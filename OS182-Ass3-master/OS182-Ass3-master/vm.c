#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "elf.h"

extern char data[];  // defined by kernel.ld
pde_t *kpgdir;  // for use in scheduler()

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
  struct cpu *c;

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
  lgdt(c->gdt, sizeof(c->gdt));
}

// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}

// There is one page table per process, plus one that's used when
// a CPU is not running any process (kpgdir). The kernel uses the
// current process's page table during system calls and interrupts;
// page protection bits prevent user code from using the kernel's
// mappings.
//
// setupkvm() and exec() set up every page table like this:
//
//   0..KERNBASE: user memory (text+data+stack+heap), mapped to
//                phys memory allocated by the kernel
//   KERNBASE..KERNBASE+EXTMEM: mapped to 0..EXTMEM (for I/O space)
//   KERNBASE+EXTMEM..data: mapped to EXTMEM..V2P(data)
//                for the kernel's instructions and r/o data
//   data..KERNBASE+PHYSTOP: mapped to V2P(data)..PHYSTOP,
//                                  rw data + free physical memory
//   0xfe000000..0: mapped direct (devices such as ioapic)
//
// The kernel allocates physical memory for its heap and for user memory
// between V2P(end) and the end of physical memory (PHYSTOP)
// (directly addressable from end..P2V(PHYSTOP)).

// This table defines the kernel's mappings, which are present in
// every process's page table.
static struct kmap {
  void *virt;
  uint phys_start;
  uint phys_end;
  int perm;
} kmap[] = {
 { (void*)KERNBASE, 0,             EXTMEM,    PTE_W}, // I/O space
 { (void*)KERNLINK, V2P(KERNLINK), V2P(data), 0},     // kern text+rodata
 { (void*)data,     V2P(data),     PHYSTOP,   PTE_W}, // kern data+memory
 { (void*)DEVSPACE, DEVSPACE,      0,         PTE_W}, // more devices
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
}

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
}

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  // cprintf("in allocuvm------------------\n");
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
    return oldsz;

  #ifndef NONE
    if (PGROUNDUP(newsz)/PGSIZE > MAX_TOTAL_PAGES && myproc()->pid > 2) {
        cprintf("proc is too big\n", PGROUNDUP(newsz)/PGSIZE);
        return 0;
    }
  #endif

  a = PGROUNDUP(oldsz);
  // int i = 0;
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
    }

    // i++;
    // cprintf("number of pages is ------------------------------- %d\n",myproc()->numberOfPhysicalPages);
    #ifndef NONE
      if (pgdir == myproc()->pgdir && myproc()->pid > 2){
        if(myproc()->numberOfPhysicalPages + myproc()->numberOfPagesInFile < MAX_TOTAL_PAGES){
          if (myproc()->numberOfPhysicalPages == MAX_PYS_PAGES){
            swapPages(myproc());
            // cprintf("after swapping in allocuvm\n");
          }
          addToPagesInRAM(myproc(), a);
          pte_t* pte = walkpgdir(pgdir, (void *)a, 0); // get a pointer to the page table entry of the page in level 2.
          *pte = *pte & ~PTE_PG; // clear the paged out to secondary storage flag.
          *pte = *pte | PTE_P;
        }
        else{
          panic("TOO MANY PAGES!!!\n");
        }
      }
    #endif
  }
  return newsz;
}

// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
      *pte = 0;
    }
  }

  #ifndef NONE
    struct proc* p = myproc();
    if (pgdir == myproc()->pgdir && myproc()->pid > 2){
      for(int i = 0; i<MAX_PYS_PAGES; i++){
        clearPageMetaData(&p->pagesInRAM[i]);
      }
      for(int i = 0; i<MAX_TOTAL_PAGES; i++){
        clearPageMetaData(&p->pagesInFile[i]);
      }
    }
  #endif
  return newsz;
}

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
}

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
  *pte &= ~PTE_U;
}

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P)){
      if(!(*pte & PTE_PG))
        panic("copyuvm: page not present");
    }
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;
  }
  return d;

bad:
  freevm(d);
  return 0;
}

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}

// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}

//PAGEBREAK!
// Blank page.
//PAGEBREAK!
// Blank page.
//PAGEBREAK!
// Blank page.

uint 
findInFile(uint va) // search the swapfile for the required page.
{
  for(int i = 0; i<MAX_TOTAL_PAGES; i++){
    // cprintf("virtual address in findInFile - %x\n", myproc()->pagesInFile[i].virtualAddress);
    if(myproc()->pagesInFile[i].virtualAddress == va){
      return i;
    }
  }
  return -1;
}

void 
copyPageMetaData(struct page_meta_data* target, struct page_meta_data* source) // copy the required page meta data from the disk.
{
  target->virtualAddress = source->virtualAddress;
  target->indexInFile = source->indexInFile;
  target->accessCounter = source->accessCounter;
  return;
}


void
clearPageMetaData(struct page_meta_data* page) // clear the meta data of the page on the swapfile beacuse it's not relevant anymore.
{
  page->virtualAddress = 0;
  page->indexInFile = -1;
  page->accessCounter = 0;
  return;
}

void
arrangePagesArray(struct proc* p, int index)
{
  for(int i=index; i<p->numberOfPhysicalPages-1; i++){
      p->pagesInRAM[i] = p->pagesInRAM[i+1];
  }
  clearPageMetaData(&p->pagesInRAM[p->numberOfPhysicalPages-1]);
}

void
addToPagesInRAM(struct proc* p, uint va)
{
  #ifndef NONE
    #if defined(NFUA) || defined(LAPA) || defined(SCFIFO)
      int nextFreePlaceInRAM = p->numberOfPhysicalPages;
      p->pagesInRAM[nextFreePlaceInRAM].virtualAddress = va;
      p->pagesInRAM[nextFreePlaceInRAM].indexInFile = -1;
      p->numberOfPhysicalPages++;
      #ifdef NFUA
        p->pagesInRAM[nextFreePlaceInRAM].accessCounter = 0;
      #endif
      #ifdef LAPA
        p->pagesInRAM[nextFreePlaceInRAM].accessCounter = 0xFFFFFFFF;
      #endif
    #endif
    #ifdef AQ
      // cprintf("va in addToPagesInRAM - %x\n",va);
      if(p->numberOfPhysicalPages == MAX_PYS_PAGES){
        for(int i=p->numberOfPhysicalPages-2; i>=0; i--){
         // cprintf("in AQ case\n");
          copyPageMetaData(&p->pagesInRAM[i+1], &p->pagesInRAM[i]);
          // p->pagesInRAM[i+1] = p->pagesInRAM[i];
        }
      }
      else{
        for(int i=p->numberOfPhysicalPages-1; i>=0; i--){
          // cprintf("in AQ case\n");
          copyPageMetaData(&p->pagesInRAM[i+1], &p->pagesInRAM[i]);
          // p->pagesInRAM[i+1] = p->pagesInRAM[i];
        }
      }
    #endif
  #endif
  return;
}

void
updateAccessCounters(struct proc *p)
{
  uint pageAccessCounter;
  pte_t* pte;
  for(int i=0; i<MAX_PYS_PAGES; i++){
    pageAccessCounter = p->pagesInRAM[i].accessCounter;
    pte = walkpgdir(p->pgdir, (void *)p->pagesInRAM[i].virtualAddress, 0);
    pageAccessCounter = pageAccessCounter >> 1;
    if(*pte & PTE_A){
      int j = 1;
      pageAccessCounter |= (j << 31);
      *pte &= ~PTE_A;
      // cprintf("pageAccessCounter of page %d with virtual address %x is - %x\n",i, p->pagesInRAM[i].virtualAddress, pageAccessCounter);
    }
    p->pagesInRAM[i].accessCounter = pageAccessCounter;
  }
  return;
}

void
updateQueue(struct proc *p)
{
  for(int i = 0 ; i < p->numberOfPhysicalPages-1; i++){
      pte_t* currentPage = walkpgdir(p->pgdir,(void *)p->pagesInRAM[i].virtualAddress, 0);
      pte_t* nextPage = walkpgdir(p->pgdir,(void *)p->pagesInRAM[i+1].virtualAddress, 0);
      if(!(*currentPage & PTE_A)){
        if(*nextPage & PTE_A) {
          struct page_meta_data page;
          copyPageMetaData(&page, &p->pagesInRAM[i]);
          copyPageMetaData(&p->pagesInRAM[i], &p->pagesInRAM[i+1]);
          copyPageMetaData(&p->pagesInRAM[i+1], &page);
      }
    }
  }
}

int 
getPageOutIndexByPolicy(struct proc *p){
  #if NFUA
    return NFUAgetPageOutIndex(p);
  #endif
  #if LAPA
    return LAPAgetPageOutIndex(p);
  #endif
  #if SCFIFO
    return SCFIFOgetPageOutIndex(p);
  #endif
  #if AQ
   return AQgetPageOutIndex(p);
  #endif
  panic("No page replacing policy");
}

int 
getFreePlaceInFile(struct proc * p) {
  int nextFreePlaceInFile = 0; 
  for(int i=0; i<MAX_TOTAL_PAGES; i++){
    if(p->pagesInFile[i].virtualAddress == 0){
      nextFreePlaceInFile = i;
      break;
    }
  }
  return nextFreePlaceInFile;
}

void 
swapPages(struct proc *p) 
{
  p->pagedOutCounter++;
  int pageToSwapIndex = getPageOutIndexByPolicy(p);
  int nextFreePlaceInFile = getFreePlaceInFile(p);
  pte_t* pte = walkpgdir(p->pgdir, (void *)p->pagesInRAM[pageToSwapIndex].virtualAddress, 0); // get a pointer to the page table entry of the page in level 2.
  writeToSwapFile(p, (char*)PTE_ADDR(p->pagesInRAM[pageToSwapIndex].virtualAddress), nextFreePlaceInFile*PGSIZE, PGSIZE); // write the page to the swap file in the nextFreePlaceInFile.
  cprintf("-----------------------------------address of swapped page is - %x ----------------------------\n",p->pagesInRAM[pageToSwapIndex].virtualAddress);
  *pte |= PTE_PG; // set the paged out to secondary storage flag.
  *pte &= ~PTE_P;
  char* v = P2V(PTE_ADDR(*pte));
  kfree(v);
  copyPageMetaData(&p->pagesInFile[nextFreePlaceInFile], &p->pagesInRAM[pageToSwapIndex]); // copy the page meta data to the array of pages meta data of the current proc.
  clearPageMetaData(&p->pagesInRAM[pageToSwapIndex]); // clear the meta data of the page in the RAM beacuse it's not relevant anymore.
  arrangePagesArray(p,pageToSwapIndex);
  p->numberOfPhysicalPages--; // decrement number of pages in RAM
  p->numberOfPagesInFile++; // increment number of pages in file. 
  p->pagesInFile[nextFreePlaceInFile].indexInFile = nextFreePlaceInFile; // update the page index in the file.
  p->pagesInFile[nextFreePlaceInFile].accessCounter = 0;
  lcr3(V2P(p->pgdir)); //refresh TLB
  return;
}

int
NFUAgetPageOutIndex(struct proc *p)
{
  uint minCount = 0xffffffff; 
  uint pageAccessCounter = 0;
  int pageToSwapIndex = 0; // index of the page in the pagesInRAM array to be swapped out.
  for(int i=0; i<MAX_PYS_PAGES; i++){
    pageAccessCounter = p->pagesInRAM[i].accessCounter;
    cprintf("pageAccessCounter of page %d with virtual address %x is - %x\n",i, p->pagesInRAM[i].virtualAddress, pageAccessCounter);
    if(pageAccessCounter <= minCount){
      minCount = pageAccessCounter;
      pageToSwapIndex = i;
    }
  }
  return pageToSwapIndex;
}

int
countBits(uint accessCounter){
  int count = 0;
  for(int i=0; i<32; i++){
    if((accessCounter & (1 << i)) == 1){
      count++;
    }
  }
  return count;
}

int
LAPAgetPageOutIndex(struct proc *p)
{
  uint minCount = 0xffffffff; 
  uint pageAccessCounter = 0;
  int pageToSwapIndex = 0; // index of the page in the pagesInRAM array to be swapped out.
  for(int i=0; i<MAX_PYS_PAGES; i++){
    pageAccessCounter = countBits(p->pagesInRAM[i].accessCounter);
    cprintf("pageAccessCounter of page %d with virtual address %x is - %x\n",i, p->pagesInRAM[i].virtualAddress, pageAccessCounter);
    if(pageAccessCounter <= minCount){
      minCount = pageAccessCounter;
      pageToSwapIndex = i;
    }
  }
  return pageToSwapIndex;
}

int 
SCFIFOgetPageOutIndex(struct proc *p)
{
 //choose page index to swap by second chance fifo algorithm
 int found=0;
 int i=0;
 while(found==0){
    pte_t *pte = walkpgdir(p->pgdir, (void*)p->pagesInRAM[i].virtualAddress, 0);
  if((*pte & PTE_A)!= 0){   
    *pte &= ~PTE_A;
  }
  else{
    found=1;
    break; 
  }
  i=(i+1)%p->numberOfPhysicalPages;
 }
 return i;
}

int 
AQgetPageOutIndex(struct proc *p)
{
  cprintf("numberOfPhysicalPages-1 = %d\n", p->numberOfPhysicalPages-1);
  return p->numberOfPhysicalPages-1;
}

void 
pageFaultHandler(struct proc* p , uint va) // handle a page fault 
{
  p->faultPageCounter++;
  uint base_va = PGROUNDDOWN(va); // rounddown to the virtual address of the page which holds the relevent piece of code.    
  uint inFile = findInFile(base_va);
  struct page_meta_data page; // create a new page meta data.
  copyPageMetaData(&page, &p->pagesInFile[inFile]); // copy the required page meta data from the disk.
  pte_t* pte = walkpgdir(p->pgdir, (void *)page.virtualAddress, 0); // get a pointer to the page table entry of the page in level 2.
  if(p->numberOfPhysicalPages == MAX_PYS_PAGES){
    swapPages(p);
    p->pagedOutCounter++;
  }
  char* mem = kalloc(); // Allocate one 4096-byte page of physical memory to put the page data in.
  if(mem ==  0){
    panic("OUT OF MEMORY!!!");
  }
  cprintf("in pageFaultHandler inFile is - %x\n",inFile);
  mappages(p->pgdir, (char*)page.virtualAddress, PGSIZE, V2P(mem), PTE_W | PTE_U); // map the page to the physical address in level 2.
  *pte = *pte & ~PTE_PG; // clear the paged out to secondary storage flag.
  *pte = *pte | PTE_P;
  readFromSwapFile(p, mem, page.indexInFile*PGSIZE, PGSIZE); // copy the actual page data from the disk to the RAM.
  clearPageMetaData(&p->pagesInFile[inFile]); // clear the meta data of the page on the swapfile beacuse it's not relevant anymore.
  #ifndef AQ
    copyPageMetaData(&p->pagesInRAM[p->numberOfPhysicalPages+1], &page); // copy the page meta data to the array of pages meta data of the current proc.
  #else
    for(int i=p->numberOfPhysicalPages-1; i>=0; i--){
        // cprintf("in AQ case\n");
        p->pagesInRAM[i+1] = p->pagesInRAM[i];
      }
    copyPageMetaData(&p->pagesInRAM[0], &page); // copy the page meta data to the array of pages meta data of the current proc.
  #endif
  p->numberOfPhysicalPages++;
  p->numberOfPagesInFile--;
  return;
}
