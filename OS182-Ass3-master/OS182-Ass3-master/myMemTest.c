#include "types.h"
#include "user.h"
#include "stat.h"
#include "syscall.h"

#define PGSIZE 4096
#define FREE_SPACE_ON_RAM 13
void waitForAnalyze();

int main(int argc, char *argv[]){
  #ifdef LAPA
        printf(1,"Testing LAPA MODE:\npress Enter...\n");
  #elif NFUA
        printf(1,"Testing NFUA MODE:\npress Enter...\n");
  #elif SCFIFO
        printf(1,"Testing SCFIFO MODE:\npress Enter...\n");
  #elif AQ
        printf(1,"Testing AQ MODE:\npress Enter...\n");
  #endif
    
  char* pages[26];
  int i;
  printf(1,"Allocating 13 pages (0-12)..\n");
  for(i=0; i < FREE_SPACE_ON_RAM; ++i){
      pages[i] = sbrk(PGSIZE);
      printf(1, "page #%d at address: %x\n", i, pages[i]);
  }
  printf(1,"Reached max number of pages in RAM..\n"); //i=11
  waitForAnalyze();
  
  printf(1,"Accessing pages 0-2\n");
  pages[0][0]=1;
  pages[1][0]=1;
  pages[2][0]=1;
  printf(1,"All pages in RAM, no page faults should occur.\n");
  waitForAnalyze();
  
  //allocate 13 more pages
  printf(1,"Allocating 13 more pages (10 swap outs should occur).\n"); //i=22
  int j;
  for(j=0; j<FREE_SPACE_ON_RAM; j++){
      pages[i] = sbrk(PGSIZE);
      printf(1, "page #%d at address: %x\n", i, pages[i]);
      i++;
  }

  waitForAnalyze();

  printf(1,"Accessing pages 0,1,2,5,14\n");
  pages[0][0]=1;
  pages[1][0]=1;
  pages[2][0]=1;
  pages[5][0]=1;
  pages[14][0]=1;
  printf(1,"Expected page faults\n");
  waitForAnalyze();

  printf(1,"Forking...\n");
  int pid = fork();
  if(pid != 0){
      sleep(2);
      wait();
      printf(1,"Parent\n");
      waitForAnalyze();
  }
  else{
      printf(1,"Child is accessing pages 0,1,2,5,14\n");
      pages[0][0]=1;
      pages[1][0]=1;
      pages[2][0]=1;
      pages[5][0]=1;
      pages[14][0]=1;
      printf(1,"No page faults should occur!\n");
      waitForAnalyze();
      exit();
  }

  printf(1,"Freeing pages...\n");
  for(i=0; i < (FREE_SPACE_ON_RAM*2); i++){
    pages[i] = sbrk(-PGSIZE);
    printf(1, "page #%d at address: %x\n", i, pages[i]);
  }

  printf(1,"All tests finished successfully!\n");
  exit();
  return 0;
}

void waitForAnalyze(){
  char buffer[10];
  printf(1,"Analyze using <CTRL+P>, press ENTER to continue...\n");
  gets(buffer,3);
}