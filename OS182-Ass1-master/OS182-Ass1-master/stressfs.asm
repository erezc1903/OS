
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  int fd, i;
  char path[] = "stressfs0";
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  16:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
  1c:	31 db                	xor    %ebx,%ebx
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  2b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  32:	74 72 65 
  char data[512];

  printf(1, "stressfs starting\n");
  35:	68 70 08 00 00       	push   $0x870
  3a:	6a 01                	push   $0x1

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  char data[512];

  printf(1, "stressfs starting\n");
  46:	e8 05 05 00 00       	call   550 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 f5 01 00 00       	call   250 <memset>
  5b:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  5e:	e8 77 03 00 00       	call   3da <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx
  7c:	68 83 08 00 00       	push   $0x883

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  81:	bb 14 00 00 00       	mov    $0x14,%ebx

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  86:	6a 01                	push   $0x1
  88:	e8 c3 04 00 00       	call   550 <printf>

  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  8f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	5f                   	pop    %edi
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 7a 03 00 00       	call   422 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 43 03 00 00       	call   402 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 3a 03 00 00       	call   40a <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 8d 08 00 00       	push   $0x88d
  d7:	6a 01                	push   $0x1
  d9:	e8 72 04 00 00       	call   550 <printf>

  fd = open(path, O_RDONLY);
  de:	59                   	pop    %ecx
  df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	50                   	push   %eax
  e9:	bb 14 00 00 00       	mov    $0x14,%ebx
  ee:	e8 2f 03 00 00       	call   422 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 eb 02 00 00       	call   3fa <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
    read(fd, data, sizeof(data));
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 ea 02 00 00       	call   40a <close>

  wait();
 120:	e8 c5 02 00 00       	call   3ea <wait>

  exit();
 125:	e8 b8 02 00 00       	call   3e2 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14a:	89 c2                	mov    %eax,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	83 c1 01             	add    $0x1,%ecx
 153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 db                	test   %bl,%bl
 15c:	88 5a ff             	mov    %bl,-0x1(%edx)
 15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 17b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
 17e:	89 c2                	mov    %eax,%edx
 180:	eb 19                	jmp    19b <strncpy+0x2b>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 188:	83 c3 01             	add    $0x1,%ebx
 18b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
 18f:	83 c2 01             	add    $0x1,%edx
 192:	84 c9                	test   %cl,%cl
 194:	88 4a ff             	mov    %cl,-0x1(%edx)
 197:	74 09                	je     1a2 <strncpy+0x32>
 199:	89 f1                	mov    %esi,%ecx
 19b:	85 c9                	test   %ecx,%ecx
 19d:	8d 71 ff             	lea    -0x1(%ecx),%esi
 1a0:	7f e6                	jg     188 <strncpy+0x18>
    ;
  while(n-- > 0)
 1a2:	31 c9                	xor    %ecx,%ecx
 1a4:	85 f6                	test   %esi,%esi
 1a6:	7e 17                	jle    1bf <strncpy+0x4f>
 1a8:	90                   	nop
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
 1b0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
 1b4:	89 f3                	mov    %esi,%ebx
 1b6:	83 c1 01             	add    $0x1,%ecx
 1b9:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
 1bb:	85 db                	test   %ebx,%ebx
 1bd:	7f f1                	jg     1b0 <strncpy+0x40>
    *s++ = 0;
  return os;
}
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 55 08             	mov    0x8(%ebp),%edx
 1d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1db:	0f b6 02             	movzbl (%edx),%eax
 1de:	0f b6 19             	movzbl (%ecx),%ebx
 1e1:	84 c0                	test   %al,%al
 1e3:	75 1e                	jne    203 <strcmp+0x33>
 1e5:	eb 29                	jmp    210 <strcmp+0x40>
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1f0:	83 c2 01             	add    $0x1,%edx


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1f6:	8d 71 01             	lea    0x1(%ecx),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1fd:	84 c0                	test   %al,%al
 1ff:	74 0f                	je     210 <strcmp+0x40>
 201:	89 f1                	mov    %esi,%ecx
 203:	38 d8                	cmp    %bl,%al
 205:	74 e9                	je     1f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 207:	29 d8                	sub    %ebx,%eax
}
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 210:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 212:	29 d8                	sub    %ebx,%eax
}
 214:	5b                   	pop    %ebx
 215:	5e                   	pop    %esi
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:

uint
strlen(char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 39 00             	cmpb   $0x0,(%ecx)
 229:	74 12                	je     23d <strlen+0x1d>
 22b:	31 d2                	xor    %edx,%edx
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 23d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	eb 0d                	jmp    250 <memset>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	89 d0                	mov    %edx,%eax
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	74 1d                	je     29e <strchr+0x2e>
    if(*s == c)
 281:	38 d3                	cmp    %dl,%bl
 283:	89 d9                	mov    %ebx,%ecx
 285:	75 0d                	jne    294 <strchr+0x24>
 287:	eb 17                	jmp    2a0 <strchr+0x30>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 290:	38 ca                	cmp    %cl,%dl
 292:	74 0c                	je     2a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 294:	83 c0 01             	add    $0x1,%eax
 297:	0f b6 10             	movzbl (%eax),%edx
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 29e:	31 c0                	xor    %eax,%eax
}
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 2b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2be:	eb 29                	jmp    2e9 <gets+0x39>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2d 01 00 00       	call   3fa <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 2dd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2e3:	74 1b                	je     300 <gets+0x50>
 2e5:	3c 0d                	cmp    $0xd,%al
 2e7:	74 17                	je     300 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 300:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 303:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	eb 0d                	jmp    320 <stat>
 313:	90                   	nop
 314:	90                   	nop
 315:	90                   	nop
 316:	90                   	nop
 317:	90                   	nop
 318:	90                   	nop
 319:	90                   	nop
 31a:	90                   	nop
 31b:	90                   	nop
 31c:	90                   	nop
 31d:	90                   	nop
 31e:	90                   	nop
 31f:	90                   	nop

00000320 <stat>:

int
stat(char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	pushl  0x8(%ebp)
 32d:	e8 f0 00 00 00       	call   422 <open>
  if(fd < 0)
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	pushl  0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f3 00 00 00       	call   43a <fstat>
 347:	89 c6                	mov    %eax,%esi
  close(fd);
 349:	89 1c 24             	mov    %ebx,(%esp)
 34c:	e8 b9 00 00 00       	call   40a <close>
  return r;
 351:	83 c4 10             	add    $0x10,%esp
 354:	89 f0                	mov    %esi,%eax
}
 356:	8d 65 f8             	lea    -0x8(%ebp),%esp
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 365:	eb ef                	jmp    356 <stat+0x36>
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 11             	movsbl (%ecx),%edx
 37a:	8d 42 d0             	lea    -0x30(%edx),%eax
 37d:	3c 09                	cmp    $0x9,%al
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
 384:	77 1f                	ja     3a5 <atoi+0x35>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 390:	8d 04 80             	lea    (%eax,%eax,4),%eax
 393:	83 c1 01             	add    $0x1,%ecx
 396:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 39a:	0f be 11             	movsbl (%ecx),%edx
 39d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3a5:	5b                   	pop    %ebx
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
 3b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 db                	test   %ebx,%ebx
 3c0:	7e 14                	jle    3d6 <memmove+0x26>
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	39 da                	cmp    %ebx,%edx
 3d4:	75 f2                	jne    3c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3da:	b8 01 00 00 00       	mov    $0x1,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <exit>:
SYSCALL(exit)
 3e2:	b8 02 00 00 00       	mov    $0x2,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <wait>:
SYSCALL(wait)
 3ea:	b8 03 00 00 00       	mov    $0x3,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <pipe>:
SYSCALL(pipe)
 3f2:	b8 04 00 00 00       	mov    $0x4,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <read>:
SYSCALL(read)
 3fa:	b8 05 00 00 00       	mov    $0x5,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <write>:
SYSCALL(write)
 402:	b8 10 00 00 00       	mov    $0x10,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <close>:
SYSCALL(close)
 40a:	b8 15 00 00 00       	mov    $0x15,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kill>:
SYSCALL(kill)
 412:	b8 06 00 00 00       	mov    $0x6,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <exec>:
SYSCALL(exec)
 41a:	b8 07 00 00 00       	mov    $0x7,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <open>:
SYSCALL(open)
 422:	b8 0f 00 00 00       	mov    $0xf,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <mknod>:
SYSCALL(mknod)
 42a:	b8 11 00 00 00       	mov    $0x11,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <unlink>:
SYSCALL(unlink)
 432:	b8 12 00 00 00       	mov    $0x12,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <fstat>:
SYSCALL(fstat)
 43a:	b8 08 00 00 00       	mov    $0x8,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <link>:
SYSCALL(link)
 442:	b8 13 00 00 00       	mov    $0x13,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <mkdir>:
SYSCALL(mkdir)
 44a:	b8 14 00 00 00       	mov    $0x14,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <chdir>:
SYSCALL(chdir)
 452:	b8 09 00 00 00       	mov    $0x9,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <dup>:
SYSCALL(dup)
 45a:	b8 0a 00 00 00       	mov    $0xa,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <getpid>:
SYSCALL(getpid)
 462:	b8 0b 00 00 00       	mov    $0xb,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sbrk>:
SYSCALL(sbrk)
 46a:	b8 0c 00 00 00       	mov    $0xc,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <sleep>:
SYSCALL(sleep)
 472:	b8 0d 00 00 00       	mov    $0xd,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <uptime>:
SYSCALL(uptime)
 47a:	b8 0e 00 00 00       	mov    $0xe,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <setVariable>:
SYSCALL(setVariable)
 482:	b8 17 00 00 00       	mov    $0x17,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <getVariable>:
SYSCALL(getVariable)
 48a:	b8 18 00 00 00       	mov    $0x18,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <remVariable>:
SYSCALL(remVariable)
 492:	b8 19 00 00 00       	mov    $0x19,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <wait2>:
SYSCALL(wait2)
 49a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <set_priority>:
SYSCALL(set_priority)
 4a2:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	89 c6                	mov    %eax,%esi
 4b8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4be:	85 db                	test   %ebx,%ebx
 4c0:	74 7e                	je     540 <printint+0x90>
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	c1 e8 1f             	shr    $0x1f,%eax
 4c7:	84 c0                	test   %al,%al
 4c9:	74 75                	je     540 <printint+0x90>
    neg = 1;
    x = -xx;
 4cb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4cd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4d4:	f7 d8                	neg    %eax
 4d6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4d9:	31 ff                	xor    %edi,%edi
 4db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4de:	89 ce                	mov    %ecx,%esi
 4e0:	eb 08                	jmp    4ea <printint+0x3a>
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4e8:	89 cf                	mov    %ecx,%edi
 4ea:	31 d2                	xor    %edx,%edx
 4ec:	8d 4f 01             	lea    0x1(%edi),%ecx
 4ef:	f7 f6                	div    %esi
 4f1:	0f b6 92 9c 08 00 00 	movzbl 0x89c(%edx),%edx
  }while((x /= base) != 0);
 4f8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4fa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4fd:	75 e9                	jne    4e8 <printint+0x38>
  if(neg)
 4ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 502:	8b 75 c0             	mov    -0x40(%ebp),%esi
 505:	85 c0                	test   %eax,%eax
 507:	74 08                	je     511 <printint+0x61>
    buf[i++] = '-';
 509:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 50e:	8d 4f 02             	lea    0x2(%edi),%ecx
 511:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 515:	8d 76 00             	lea    0x0(%esi),%esi
 518:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 51b:	83 ec 04             	sub    $0x4,%esp
 51e:	83 ef 01             	sub    $0x1,%edi
 521:	6a 01                	push   $0x1
 523:	53                   	push   %ebx
 524:	56                   	push   %esi
 525:	88 45 d7             	mov    %al,-0x29(%ebp)
 528:	e8 d5 fe ff ff       	call   402 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 52d:	83 c4 10             	add    $0x10,%esp
 530:	39 df                	cmp    %ebx,%edi
 532:	75 e4                	jne    518 <printint+0x68>
    putc(fd, buf[i]);
}
 534:	8d 65 f4             	lea    -0xc(%ebp),%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 540:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 542:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 549:	eb 8b                	jmp    4d6 <printint+0x26>
 54b:	90                   	nop
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 556:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 559:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 55c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 55f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 562:	89 45 d0             	mov    %eax,-0x30(%ebp)
 565:	0f b6 1e             	movzbl (%esi),%ebx
 568:	83 c6 01             	add    $0x1,%esi
 56b:	84 db                	test   %bl,%bl
 56d:	0f 84 b0 00 00 00    	je     623 <printf+0xd3>
 573:	31 d2                	xor    %edx,%edx
 575:	eb 39                	jmp    5b0 <printf+0x60>
 577:	89 f6                	mov    %esi,%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 580:	83 f8 25             	cmp    $0x25,%eax
 583:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 586:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 58b:	74 18                	je     5a5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 596:	6a 01                	push   $0x1
 598:	50                   	push   %eax
 599:	57                   	push   %edi
 59a:	e8 63 fe ff ff       	call   402 <write>
 59f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5ac:	84 db                	test   %bl,%bl
 5ae:	74 73                	je     623 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 5b0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5b2:	0f be cb             	movsbl %bl,%ecx
 5b5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5b8:	74 c6                	je     580 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5ba:	83 fa 25             	cmp    $0x25,%edx
 5bd:	75 e6                	jne    5a5 <printf+0x55>
      if(c == 'd'){
 5bf:	83 f8 64             	cmp    $0x64,%eax
 5c2:	0f 84 f8 00 00 00    	je     6c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5c8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ce:	83 f9 70             	cmp    $0x70,%ecx
 5d1:	74 5d                	je     630 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5d3:	83 f8 73             	cmp    $0x73,%eax
 5d6:	0f 84 84 00 00 00    	je     660 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5dc:	83 f8 63             	cmp    $0x63,%eax
 5df:	0f 84 ea 00 00 00    	je     6cf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5e5:	83 f8 25             	cmp    $0x25,%eax
 5e8:	0f 84 c2 00 00 00    	je     6b0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f1:	83 ec 04             	sub    $0x4,%esp
 5f4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5f8:	6a 01                	push   $0x1
 5fa:	50                   	push   %eax
 5fb:	57                   	push   %edi
 5fc:	e8 01 fe ff ff       	call   402 <write>
 601:	83 c4 0c             	add    $0xc,%esp
 604:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 607:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 60a:	6a 01                	push   $0x1
 60c:	50                   	push   %eax
 60d:	57                   	push   %edi
 60e:	83 c6 01             	add    $0x1,%esi
 611:	e8 ec fd ff ff       	call   402 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 616:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 61a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 61d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 61f:	84 db                	test   %bl,%bl
 621:	75 8d                	jne    5b0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 623:	8d 65 f4             	lea    -0xc(%ebp),%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
 62b:	90                   	nop
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
 638:	6a 00                	push   $0x0
 63a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 63d:	89 f8                	mov    %edi,%eax
 63f:	8b 13                	mov    (%ebx),%edx
 641:	e8 6a fe ff ff       	call   4b0 <printint>
        ap++;
 646:	89 d8                	mov    %ebx,%eax
 648:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 64b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 64d:	83 c0 04             	add    $0x4,%eax
 650:	89 45 d0             	mov    %eax,-0x30(%ebp)
 653:	e9 4d ff ff ff       	jmp    5a5 <printf+0x55>
 658:	90                   	nop
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
        ap++;
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 66b:	b8 93 08 00 00       	mov    $0x893,%eax
 670:	85 db                	test   %ebx,%ebx
 672:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 675:	0f b6 03             	movzbl (%ebx),%eax
 678:	84 c0                	test   %al,%al
 67a:	74 23                	je     69f <printf+0x14f>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 680:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 683:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 686:	83 ec 04             	sub    $0x4,%esp
 689:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 68b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68e:	50                   	push   %eax
 68f:	57                   	push   %edi
 690:	e8 6d fd ff ff       	call   402 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 695:	0f b6 03             	movzbl (%ebx),%eax
 698:	83 c4 10             	add    $0x10,%esp
 69b:	84 c0                	test   %al,%al
 69d:	75 e1                	jne    680 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 ff fe ff ff       	jmp    5a5 <printf+0x55>
 6a6:	8d 76 00             	lea    0x0(%esi),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6b9:	6a 01                	push   $0x1
 6bb:	e9 4c ff ff ff       	jmp    60c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c8:	6a 01                	push   $0x1
 6ca:	e9 6b ff ff ff       	jmp    63a <printf+0xea>
 6cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6d2:	83 ec 04             	sub    $0x4,%esp
 6d5:	8b 03                	mov    (%ebx),%eax
 6d7:	6a 01                	push   $0x1
 6d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6df:	50                   	push   %eax
 6e0:	57                   	push   %edi
 6e1:	e8 1c fd ff ff       	call   402 <write>
 6e6:	e9 5b ff ff ff       	jmp    646 <printf+0xf6>
 6eb:	66 90                	xchg   %ax,%ax
 6ed:	66 90                	xchg   %ax,%ax
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 68 0b 00 00       	mov    0xb68,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fe:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 700:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 703:	39 c8                	cmp    %ecx,%eax
 705:	73 19                	jae    720 <free+0x30>
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 710:	39 d1                	cmp    %edx,%ecx
 712:	72 1c                	jb     730 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 714:	39 d0                	cmp    %edx,%eax
 716:	73 18                	jae    730 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 718:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 71c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71e:	72 f0                	jb     710 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 720:	39 d0                	cmp    %edx,%eax
 722:	72 f4                	jb     718 <free+0x28>
 724:	39 d1                	cmp    %edx,%ecx
 726:	73 f0                	jae    718 <free+0x28>
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 730:	8b 73 fc             	mov    -0x4(%ebx),%esi
 733:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 736:	39 d7                	cmp    %edx,%edi
 738:	74 19                	je     753 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	74 23                	je     76a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 747:	89 08                	mov    %ecx,(%eax)
  freep = p;
 749:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 74e:	5b                   	pop    %ebx
 74f:	5e                   	pop    %esi
 750:	5f                   	pop    %edi
 751:	5d                   	pop    %ebp
 752:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 753:	03 72 04             	add    0x4(%edx),%esi
 756:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 759:	8b 10                	mov    (%eax),%edx
 75b:	8b 12                	mov    (%edx),%edx
 75d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 766:	39 f1                	cmp    %esi,%ecx
 768:	75 dd                	jne    747 <free+0x57>
    p->s.size += bp->s.size;
 76a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 76d:	a3 68 0b 00 00       	mov    %eax,0xb68
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 772:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 775:	8b 53 f8             	mov    -0x8(%ebx),%edx
 778:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 77a:	5b                   	pop    %ebx
 77b:	5e                   	pop    %esi
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 68 0b 00 00    	mov    0xb68,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 a3 00 00 00    	je     846 <malloc+0xc6>
 7a3:	8b 02                	mov    (%edx),%eax
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7a8:	39 cf                	cmp    %ecx,%edi
 7aa:	76 74                	jbe    820 <malloc+0xa0>
 7ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7b2:	be 00 10 00 00       	mov    $0x1000,%esi
 7b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 7be:	0f 43 f7             	cmovae %edi,%esi
 7c1:	ba 00 80 00 00       	mov    $0x8000,%edx
 7c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 7cc:	0f 46 da             	cmovbe %edx,%ebx
 7cf:	eb 10                	jmp    7e1 <malloc+0x61>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7da:	8b 48 04             	mov    0x4(%eax),%ecx
 7dd:	39 cf                	cmp    %ecx,%edi
 7df:	76 3f                	jbe    820 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e1:	39 05 68 0b 00 00    	cmp    %eax,0xb68
 7e7:	89 c2                	mov    %eax,%edx
 7e9:	75 ed                	jne    7d8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	53                   	push   %ebx
 7ef:	e8 76 fc ff ff       	call   46a <sbrk>
  if(p == (char*)-1)
 7f4:	83 c4 10             	add    $0x10,%esp
 7f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fa:	74 1c                	je     818 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7fc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 7ff:	83 ec 0c             	sub    $0xc,%esp
 802:	83 c0 08             	add    $0x8,%eax
 805:	50                   	push   %eax
 806:	e8 e5 fe ff ff       	call   6f0 <free>
  return freep;
 80b:	8b 15 68 0b 00 00    	mov    0xb68,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 811:	83 c4 10             	add    $0x10,%esp
 814:	85 d2                	test   %edx,%edx
 816:	75 c0                	jne    7d8 <malloc+0x58>
        return 0;
 818:	31 c0                	xor    %eax,%eax
 81a:	eb 1c                	jmp    838 <malloc+0xb8>
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 820:	39 cf                	cmp    %ecx,%edi
 822:	74 1c                	je     840 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 824:	29 f9                	sub    %edi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 82c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 82f:	89 15 68 0b 00 00    	mov    %edx,0xb68
      return (void*)(p + 1);
 835:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 838:	8d 65 f4             	lea    -0xc(%ebp),%esp
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb e9                	jmp    82f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 846:	c7 05 68 0b 00 00 6c 	movl   $0xb6c,0xb68
 84d:	0b 00 00 
 850:	c7 05 6c 0b 00 00 6c 	movl   $0xb6c,0xb6c
 857:	0b 00 00 
    base.s.size = 0;
 85a:	b8 6c 0b 00 00       	mov    $0xb6c,%eax
 85f:	c7 05 70 0b 00 00 00 	movl   $0x0,0xb70
 866:	00 00 00 
 869:	e9 3e ff ff ff       	jmp    7ac <malloc+0x2c>
