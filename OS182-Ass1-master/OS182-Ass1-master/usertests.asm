
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 7e 4d 00 00       	push   $0x4d7e
      16:	6a 01                	push   $0x1
      18:	e8 53 3a 00 00       	call   3a70 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 92 4d 00 00       	push   $0x4d92
      26:	e8 17 39 00 00       	call   3942 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 fc 54 00 00       	push   $0x54fc
      3a:	6a 01                	push   $0x1
      3c:	e8 2f 3a 00 00       	call   3a70 <printf>
    exit();
      41:	e8 bc 38 00 00       	call   3902 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 92 4d 00 00       	push   $0x4d92
      52:	e8 eb 38 00 00       	call   3942 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 cb 38 00 00       	call   392a <close>

  argptest();
      5f:	e8 6c 35 00 00       	call   35d0 <argptest>
  createdelete();
      64:	e8 87 11 00 00       	call   11f0 <createdelete>
  linkunlink();
      69:	e8 42 1a 00 00       	call   1ab0 <linkunlink>
  concreate();
      6e:	e8 2d 17 00 00       	call   17a0 <concreate>
  fourfiles();
      73:	e8 88 0f 00 00       	call   1000 <fourfiles>
  sharedfd();
      78:	e8 c3 0d 00 00       	call   e40 <sharedfd>

  bigargtest();
      7d:	e8 ee 31 00 00       	call   3270 <bigargtest>
  bigwrite();
      82:	e8 49 23 00 00       	call   23d0 <bigwrite>
  bigargtest();
      87:	e8 e4 31 00 00       	call   3270 <bigargtest>
  bsstest();
      8c:	e8 6f 31 00 00       	call   3200 <bsstest>
  sbrktest();
      91:	e8 8a 2c 00 00       	call   2d20 <sbrktest>
  validatetest();
      96:	e8 b5 30 00 00       	call   3150 <validatetest>

  opentest();
      9b:	e8 50 03 00 00       	call   3f0 <opentest>
  writetest();
      a0:	e8 db 03 00 00       	call   480 <writetest>
  writetest1();
      a5:	e8 b6 05 00 00       	call   660 <writetest1>
  createtest();
      aa:	e8 81 07 00 00       	call   830 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 ad 0c 00 00       	call   d70 <mem>
  pipe1();
      c3:	e8 48 09 00 00       	call   a10 <pipe1>
  preempt();
      c8:	e8 d3 0a 00 00       	call   ba0 <preempt>
  exitwait();
      cd:	e8 0e 0c 00 00       	call   ce0 <exitwait>

  rmdot();
      d2:	e8 e9 26 00 00       	call   27c0 <rmdot>
  fourteen();
      d7:	e8 a4 25 00 00       	call   2680 <fourteen>
  bigfile();
      dc:	e8 cf 23 00 00       	call   24b0 <bigfile>
  subdir();
      e1:	e8 0a 1c 00 00       	call   1cf0 <subdir>
  linktest();
      e6:	e8 a5 14 00 00       	call   1590 <linktest>
  unlinkread();
      eb:	e8 10 13 00 00       	call   1400 <unlinkread>
  dirfile();
      f0:	e8 4b 28 00 00       	call   2940 <dirfile>
  iref();
      f5:	e8 46 2a 00 00       	call   2b40 <iref>
  forktest();
      fa:	e8 61 2b 00 00       	call   2c60 <forktest>
  bigdir(); // slow
      ff:	e8 bc 1a 00 00       	call   1bc0 <bigdir>

  uio();
     104:	e8 57 34 00 00       	call   3560 <uio>

  exectest();
     109:	e8 b2 08 00 00       	call   9c0 <exectest>

  exit();
     10e:	e8 ef 37 00 00       	call   3902 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 24 3e 00 00       	push   $0x3e24
     12b:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     131:	e8 3a 39 00 00       	call   3a70 <printf>

  if(mkdir("iputdir") < 0){
     136:	c7 04 24 b7 3d 00 00 	movl   $0x3db7,(%esp)
     13d:	e8 28 38 00 00       	call   396a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 b7 3d 00 00       	push   $0x3db7
     151:	e8 1c 38 00 00       	call   3972 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 b4 3d 00 00       	push   $0x3db4
     169:	e8 e4 37 00 00       	call   3952 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 d9 3d 00 00       	push   $0x3dd9
     17d:	e8 f0 37 00 00       	call   3972 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 5c 3e 00 00       	push   $0x3e5c
     191:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     197:	e8 d4 38 00 00       	call   3a70 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 90 3d 00 00       	push   $0x3d90
     1a8:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     1ae:	e8 bd 38 00 00       	call   3a70 <printf>
    exit();
     1b3:	e8 4a 37 00 00       	call   3902 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 db 3d 00 00       	push   $0x3ddb
     1bf:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     1c5:	e8 a6 38 00 00       	call   3a70 <printf>
    exit();
     1ca:	e8 33 37 00 00       	call   3902 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 bf 3d 00 00       	push   $0x3dbf
     1d6:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     1dc:	e8 8f 38 00 00       	call   3a70 <printf>
    exit();
     1e1:	e8 1c 37 00 00       	call   3902 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 9e 3d 00 00       	push   $0x3d9e
     1ed:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     1f3:	e8 78 38 00 00       	call   3a70 <printf>
    exit();
     1f8:	e8 05 37 00 00       	call   3902 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     206:	68 eb 3d 00 00       	push   $0x3deb
     20b:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     211:	e8 5a 38 00 00       	call   3a70 <printf>

  pid = fork();
     216:	e8 df 36 00 00       	call   38fa <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 b7 3d 00 00       	push   $0x3db7
     230:	e8 35 37 00 00       	call   396a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 b7 3d 00 00       	push   $0x3db7
     248:	e8 25 37 00 00       	call   3972 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 b4 3d 00 00       	push   $0x3db4
     25c:	e8 f1 36 00 00       	call   3952 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     268:	e8 95 36 00 00       	call   3902 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     270:	e8 95 36 00 00       	call   390a <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 0e 3e 00 00       	push   $0x3e0e
     27d:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     283:	e8 e8 37 00 00       	call   3a70 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 bf 3d 00 00       	push   $0x3dbf
     298:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     29e:	e8 cd 37 00 00       	call   3a70 <printf>
      exit();
     2a3:	e8 5a 36 00 00       	call   3902 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 d1 4c 00 00       	push   $0x4cd1
     2af:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     2b5:	e8 b6 37 00 00       	call   3a70 <printf>
    exit();
     2ba:	e8 43 36 00 00       	call   3902 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 fa 3d 00 00       	push   $0x3dfa
     2c6:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     2cc:	e8 9f 37 00 00       	call   3a70 <printf>
      exit();
     2d1:	e8 2c 36 00 00       	call   3902 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 90 3d 00 00       	push   $0x3d90
     2dd:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     2e3:	e8 88 37 00 00       	call   3a70 <printf>
      exit();
     2e8:	e8 15 36 00 00       	call   3902 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2f6:	68 20 3e 00 00       	push   $0x3e20
     2fb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     301:	e8 6a 37 00 00       	call   3a70 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 2f 3e 00 00 	movl   $0x3e2f,(%esp)
     30d:	e8 58 36 00 00       	call   396a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     31d:	e8 d8 35 00 00       	call   38fa <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 2f 3e 00 00       	push   $0x3e2f
     336:	e8 07 36 00 00       	call   3942 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 b4 4d 00 00       	push   $0x4db4
     34a:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     350:	e8 1b 37 00 00       	call   3a70 <printf>
      exit();
     355:	e8 a8 35 00 00       	call   3902 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 28 36 00 00       	call   3992 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 2f 3e 00 00 	movl   $0x3e2f,(%esp)
     371:	e8 dc 35 00 00       	call   3952 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     37d:	e8 88 35 00 00       	call   390a <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 58 3e 00 00       	push   $0x3e58
     38a:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     390:	e8 db 36 00 00       	call   3a70 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     3a0:	e8 5d 35 00 00       	call   3902 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 35 3e 00 00       	push   $0x3e35
     3ac:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     3b2:	e8 b9 36 00 00       	call   3a70 <printf>
    exit();
     3b7:	e8 46 35 00 00       	call   3902 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 d1 4c 00 00       	push   $0x4cd1
     3c3:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     3c9:	e8 a2 36 00 00       	call   3a70 <printf>
    exit();
     3ce:	e8 2f 35 00 00       	call   3902 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 49 3e 00 00       	push   $0x3e49
     3da:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     3e0:	e8 8b 36 00 00       	call   3a70 <printf>
    exit();
     3e5:	e8 18 35 00 00       	call   3902 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 6a 3e 00 00       	push   $0x3e6a
     3fb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     401:	e8 6a 36 00 00       	call   3a70 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 75 3e 00 00       	push   $0x3e75
     40f:	e8 2e 35 00 00       	call   3942 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 06 35 00 00       	call   392a <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 8d 3e 00 00       	push   $0x3e8d
     42d:	e8 10 35 00 00       	call   3942 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 b8 3e 00 00       	push   $0x3eb8
     441:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     447:	e8 24 36 00 00       	call   3a70 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 7a 3e 00 00       	push   $0x3e7a
     458:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     45e:	e8 0d 36 00 00       	call   3a70 <printf>
    exit();
     463:	e8 9a 34 00 00       	call   3902 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 9a 3e 00 00       	push   $0x3e9a
     46f:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     475:	e8 f6 35 00 00       	call   3a70 <printf>
    exit();
     47a:	e8 83 34 00 00       	call   3902 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 c6 3e 00 00       	push   $0x3ec6
     48d:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     493:	e8 d8 35 00 00       	call   3a70 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 d7 3e 00 00       	push   $0x3ed7
     4a4:	e8 99 34 00 00       	call   3942 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 8b 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 dd 3e 00 00       	push   $0x3edd
     4c0:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     4c6:	e8 a5 35 00 00       	call   3a70 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 14 3f 00 00       	push   $0x3f14
     4da:	56                   	push   %esi
     4db:	e8 42 34 00 00       	call   3922 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 1f 3f 00 00       	push   $0x3f1f
     4f6:	56                   	push   %esi
     4f7:	e8 26 34 00 00       	call   3922 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 2a 3f 00 00       	push   $0x3f2a
     518:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     51e:	e8 4d 35 00 00       	call   3a70 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 ff 33 00 00       	call   392a <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 d7 3e 00 00       	push   $0x3ed7
     534:	e8 09 34 00 00       	call   3942 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 35 3f 00 00       	push   $0x3f35
     54e:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     554:	e8 17 35 00 00       	call   3a70 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 40 86 00 00       	push   $0x8640
     566:	53                   	push   %ebx
     567:	e8 ae 33 00 00       	call   391a <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 69 3f 00 00       	push   $0x3f69
     582:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     588:	e8 e3 34 00 00       	call   3a70 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 95 33 00 00       	call   392a <close>

  if(unlink("small") < 0){
     595:	c7 04 24 d7 3e 00 00 	movl   $0x3ed7,(%esp)
     59c:	e8 b1 33 00 00       	call   3952 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 91 3f 00 00       	push   $0x3f91
     5b0:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     5b6:	e8 b5 34 00 00       	call   3a70 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 d8 4d 00 00       	push   $0x4dd8
     5ce:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     5d4:	e8 97 34 00 00       	call   3a70 <printf>
      exit();
     5d9:	e8 24 33 00 00       	call   3902 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 fc 4d 00 00       	push   $0x4dfc
     5e7:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     5ed:	e8 7e 34 00 00       	call   3a70 <printf>
      exit();
     5f2:	e8 0b 33 00 00       	call   3902 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 4e 3f 00 00       	push   $0x3f4e
     5ff:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     605:	e8 66 34 00 00       	call   3a70 <printf>
    exit();
     60a:	e8 f3 32 00 00       	call   3902 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 95 42 00 00       	push   $0x4295
     617:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     61d:	e8 4e 34 00 00       	call   3a70 <printf>
    exit();
     622:	e8 db 32 00 00       	call   3902 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 7c 3f 00 00       	push   $0x3f7c
     62f:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     635:	e8 36 34 00 00       	call   3a70 <printf>
    exit();
     63a:	e8 c3 32 00 00       	call   3902 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 f8 3e 00 00       	push   $0x3ef8
     647:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     64d:	e8 1e 34 00 00       	call   3a70 <printf>
    exit();
     652:	e8 ab 32 00 00       	call   3902 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 a5 3f 00 00       	push   $0x3fa5
     66d:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     673:	e8 f8 33 00 00       	call   3a70 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 1f 40 00 00       	push   $0x401f
     684:	e8 b9 32 00 00       	call   3942 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 64 01 00 00    	js     7f8 <writetest1+0x198>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d 40 86 00 00    	mov    %ebx,0x8640
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 40 86 00 00       	push   $0x8640
     6b3:	56                   	push   %esi
     6b4:	e8 69 32 00 00       	call   3922 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 4f 32 00 00       	call   392a <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 1f 40 00 00       	push   $0x401f
     6e4:	e8 59 32 00 00       	call   3942 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 40 86 00 00       	mov    0x8640,%eax
     710:	39 c3                	cmp    %eax,%ebx
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 40 86 00 00       	push   $0x8640
     724:	56                   	push   %esi
     725:	e8 f0 31 00 00       	call   391a <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 e4 31 00 00       	call   392a <close>
  if(unlink("big") < 0){
     746:	c7 04 24 1f 40 00 00 	movl   $0x401f,(%esp)
     74d:	e8 00 32 00 00       	call   3952 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 46 40 00 00       	push   $0x4046
     765:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     76b:	e8 00 33 00 00       	call   3a70 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 cf 3f 00 00       	push   $0x3fcf
     783:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     789:	e8 e2 32 00 00       	call   3a70 <printf>
      exit();
     78e:	e8 6f 31 00 00       	call   3902 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 20 4e 00 00       	push   $0x4e20
     79a:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     7a0:	e8 cb 32 00 00       	call   3a70 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 58 31 00 00       	call   3902 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 23 40 00 00       	push   $0x4023
     7b3:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     7b9:	e8 b2 32 00 00       	call   3a70 <printf>
      exit();
     7be:	e8 3f 31 00 00       	call   3902 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 06 40 00 00       	push   $0x4006
     7d0:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     7d6:	e8 95 32 00 00       	call   3a70 <printf>
        exit();
     7db:	e8 22 31 00 00       	call   3902 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 ed 3f 00 00       	push   $0x3fed
     7e8:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     7ee:	e8 7d 32 00 00       	call   3a70 <printf>
    exit();
     7f3:	e8 0a 31 00 00       	call   3902 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 b5 3f 00 00       	push   $0x3fb5
     800:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     806:	e8 65 32 00 00       	call   3a70 <printf>
    exit();
     80b:	e8 f2 30 00 00       	call   3902 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 33 40 00 00       	push   $0x4033
     818:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     81e:	e8 4d 32 00 00       	call   3a70 <printf>
    exit();
     823:	e8 da 30 00 00       	call   3902 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 40 4e 00 00       	push   $0x4e40
     841:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     847:	e8 24 32 00 00       	call   3a70 <printf>

  name[0] = 'a';
     84c:	c6 05 40 a6 00 00 61 	movb   $0x61,0xa640
  name[2] = '\0';
     853:	c6 05 42 a6 00 00 00 	movb   $0x0,0xa642
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d 41 a6 00 00    	mov    %bl,0xa641
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 40 a6 00 00       	push   $0xa640
     876:	e8 c7 30 00 00       	call   3942 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 a7 30 00 00       	call   392a <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 40 a6 00 00 61 	movb   $0x61,0xa640
  name[2] = '\0';
     892:	c6 05 42 a6 00 00 00 	movb   $0x0,0xa642
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d 41 a6 00 00    	mov    %bl,0xa641
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 40 a6 00 00       	push   $0xa640
     8b1:	e8 9c 30 00 00       	call   3952 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 68 4e 00 00       	push   $0x4e68
     8c6:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     8cc:	e8 9f 31 00 00       	call   3a70 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 54 40 00 00       	push   $0x4054
     8eb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     8f1:	e8 7a 31 00 00       	call   3a70 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 60 40 00 00 	movl   $0x4060,(%esp)
     8fd:	e8 68 30 00 00       	call   396a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 60 40 00 00       	push   $0x4060
     911:	e8 5c 30 00 00       	call   3972 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 05 46 00 00       	push   $0x4605
     929:	e8 44 30 00 00       	call   3972 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 60 40 00 00       	push   $0x4060
     93d:	e8 10 30 00 00       	call   3952 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 9d 40 00 00       	push   $0x409d
     951:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     957:	e8 14 31 00 00       	call   3a70 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 90 3d 00 00       	push   $0x3d90
     968:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     96e:	e8 fd 30 00 00       	call   3a70 <printf>
    exit();
     973:	e8 8a 2f 00 00       	call   3902 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 89 40 00 00       	push   $0x4089
     97f:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     985:	e8 e6 30 00 00       	call   3a70 <printf>
    exit();
     98a:	e8 73 2f 00 00       	call   3902 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 78 40 00 00       	push   $0x4078
     996:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     99c:	e8 cf 30 00 00       	call   3a70 <printf>
    exit();
     9a1:	e8 5c 2f 00 00       	call   3902 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 65 40 00 00       	push   $0x4065
     9ad:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     9b3:	e8 b8 30 00 00       	call   3a70 <printf>
    exit();
     9b8:	e8 45 2f 00 00       	call   3902 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 ac 40 00 00       	push   $0x40ac
     9cb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     9d1:	e8 9a 30 00 00       	call   3a70 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 50 5e 00 00       	push   $0x5e50
     9dd:	68 75 3e 00 00       	push   $0x3e75
     9e2:	e8 53 2f 00 00       	call   393a <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 b7 40 00 00       	push   $0x40b7
     9f7:	ff 35 4c 5e 00 00    	pushl  0x5e4c
     9fd:	e8 6e 30 00 00       	call   3a70 <printf>
    exit();
     a02:	e8 fb 2e 00 00       	call   3902 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 f0 2e 00 00       	call   3912 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 35 01 00 00    	jne    b62 <pipe1+0x152>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a2d:	e8 c8 2e 00 00       	call   38fa <fork>
  seq = 0;
  if(pid == 0){
     a32:	83 f8 00             	cmp    $0x0,%eax
     a35:	0f 84 86 00 00 00    	je     ac1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a3b:	0f 8e 35 01 00 00    	jle    b76 <pipe1+0x166>
    close(fds[1]);
     a41:	83 ec 0c             	sub    $0xc,%esp
     a44:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a47:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     a4c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a4e:	e8 d7 2e 00 00       	call   392a <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 40 86 00 00       	push   $0x8640
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 ac 2e 00 00       	call   391a <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e a3 00 00 00    	jle    b1c <pipe1+0x10c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b 40 86 00 00 	cmp    %bl,0x8640(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 e6 40 00 00       	push   $0x40e6
     aaf:	6a 01                	push   $0x1
     ab1:	e8 ba 2f 00 00       	call   3a70 <printf>
          return;
     ab6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     ac7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ac9:	e8 5c 2e 00 00       	call   392a <close>
     ace:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ad1:	89 f0                	mov    %esi,%eax
     ad3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ad9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     adb:	f7 d8                	neg    %eax
     add:	8d 76 00             	lea    0x0(%esi),%esi
     ae0:	88 9c 18 40 86 00 00 	mov    %bl,0x8640(%eax,%ebx,1)
     ae7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     aea:	39 d3                	cmp    %edx,%ebx
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	89 de                	mov    %ebx,%esi
     af3:	68 09 04 00 00       	push   $0x409
     af8:	68 40 86 00 00       	push   $0x8640
     afd:	ff 75 e4             	pushl  -0x1c(%ebp)
     b00:	e8 1d 2e 00 00       	call   3922 <write>
     b05:	83 c4 10             	add    $0x10,%esp
     b08:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0d:	75 7b                	jne    b8a <pipe1+0x17a>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b0f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b15:	75 ba                	jne    ad1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b17:	e8 e6 2d 00 00       	call   3902 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b1c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b23:	75 26                	jne    b4b <pipe1+0x13b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b25:	83 ec 0c             	sub    $0xc,%esp
     b28:	ff 75 e0             	pushl  -0x20(%ebp)
     b2b:	e8 fa 2d 00 00       	call   392a <close>
    wait();
     b30:	e8 d5 2d 00 00       	call   390a <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b35:	58                   	pop    %eax
     b36:	5a                   	pop    %edx
     b37:	68 0b 41 00 00       	push   $0x410b
     b3c:	6a 01                	push   $0x1
     b3e:	e8 2d 2f 00 00       	call   3a70 <printf>
     b43:	83 c4 10             	add    $0x10,%esp
     b46:	e9 6e ff ff ff       	jmp    ab9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b4b:	83 ec 04             	sub    $0x4,%esp
     b4e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b51:	68 f4 40 00 00       	push   $0x40f4
     b56:	6a 01                	push   $0x1
     b58:	e8 13 2f 00 00       	call   3a70 <printf>
      exit();
     b5d:	e8 a0 2d 00 00       	call   3902 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b62:	83 ec 08             	sub    $0x8,%esp
     b65:	68 c9 40 00 00       	push   $0x40c9
     b6a:	6a 01                	push   $0x1
     b6c:	e8 ff 2e 00 00       	call   3a70 <printf>
    exit();
     b71:	e8 8c 2d 00 00       	call   3902 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b76:	83 ec 08             	sub    $0x8,%esp
     b79:	68 15 41 00 00       	push   $0x4115
     b7e:	6a 01                	push   $0x1
     b80:	e8 eb 2e 00 00       	call   3a70 <printf>
    exit();
     b85:	e8 78 2d 00 00       	call   3902 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b8a:	83 ec 08             	sub    $0x8,%esp
     b8d:	68 d8 40 00 00       	push   $0x40d8
     b92:	6a 01                	push   $0x1
     b94:	e8 d7 2e 00 00       	call   3a70 <printf>
        exit();
     b99:	e8 64 2d 00 00       	call   3902 <exit>
     b9e:	66 90                	xchg   %ax,%ax

00000ba0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     ba9:	68 24 41 00 00       	push   $0x4124
     bae:	6a 01                	push   $0x1
     bb0:	e8 bb 2e 00 00       	call   3a70 <printf>
  pid1 = fork();
     bb5:	e8 40 2d 00 00       	call   38fa <fork>
  if(pid1 == 0)
     bba:	83 c4 10             	add    $0x10,%esp
     bbd:	85 c0                	test   %eax,%eax
     bbf:	75 02                	jne    bc3 <preempt+0x23>
     bc1:	eb fe                	jmp    bc1 <preempt+0x21>
     bc3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     bc5:	e8 30 2d 00 00       	call   38fa <fork>
  if(pid2 == 0)
     bca:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bcc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bce:	75 02                	jne    bd2 <preempt+0x32>
     bd0:	eb fe                	jmp    bd0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     bd2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bd5:	83 ec 0c             	sub    $0xc,%esp
     bd8:	50                   	push   %eax
     bd9:	e8 34 2d 00 00       	call   3912 <pipe>
  pid3 = fork();
     bde:	e8 17 2d 00 00       	call   38fa <fork>
  if(pid3 == 0){
     be3:	83 c4 10             	add    $0x10,%esp
     be6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     be8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bea:	75 47                	jne    c33 <preempt+0x93>
    close(pfds[0]);
     bec:	83 ec 0c             	sub    $0xc,%esp
     bef:	ff 75 e0             	pushl  -0x20(%ebp)
     bf2:	e8 33 2d 00 00       	call   392a <close>
    if(write(pfds[1], "x", 1) != 1)
     bf7:	83 c4 0c             	add    $0xc,%esp
     bfa:	6a 01                	push   $0x1
     bfc:	68 e9 46 00 00       	push   $0x46e9
     c01:	ff 75 e4             	pushl  -0x1c(%ebp)
     c04:	e8 19 2d 00 00       	call   3922 <write>
     c09:	83 c4 10             	add    $0x10,%esp
     c0c:	83 f8 01             	cmp    $0x1,%eax
     c0f:	74 12                	je     c23 <preempt+0x83>
      printf(1, "preempt write error");
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	68 2e 41 00 00       	push   $0x412e
     c19:	6a 01                	push   $0x1
     c1b:	e8 50 2e 00 00       	call   3a70 <printf>
     c20:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	ff 75 e4             	pushl  -0x1c(%ebp)
     c29:	e8 fc 2c 00 00       	call   392a <close>
     c2e:	83 c4 10             	add    $0x10,%esp
     c31:	eb fe                	jmp    c31 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 ec 2c 00 00       	call   392a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c3e:	83 c4 0c             	add    $0xc,%esp
     c41:	68 00 20 00 00       	push   $0x2000
     c46:	68 40 86 00 00       	push   $0x8640
     c4b:	ff 75 e0             	pushl  -0x20(%ebp)
     c4e:	e8 c7 2c 00 00       	call   391a <read>
     c53:	83 c4 10             	add    $0x10,%esp
     c56:	83 f8 01             	cmp    $0x1,%eax
     c59:	74 1a                	je     c75 <preempt+0xd5>
    printf(1, "preempt read error");
     c5b:	83 ec 08             	sub    $0x8,%esp
     c5e:	68 42 41 00 00       	push   $0x4142
     c63:	6a 01                	push   $0x1
     c65:	e8 06 2e 00 00       	call   3a70 <printf>
    return;
     c6a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c70:	5b                   	pop    %ebx
     c71:	5e                   	pop    %esi
     c72:	5f                   	pop    %edi
     c73:	5d                   	pop    %ebp
     c74:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c75:	83 ec 0c             	sub    $0xc,%esp
     c78:	ff 75 e0             	pushl  -0x20(%ebp)
     c7b:	e8 aa 2c 00 00       	call   392a <close>
  printf(1, "kill... ");
     c80:	58                   	pop    %eax
     c81:	5a                   	pop    %edx
     c82:	68 55 41 00 00       	push   $0x4155
     c87:	6a 01                	push   $0x1
     c89:	e8 e2 2d 00 00       	call   3a70 <printf>
  kill(pid1);
     c8e:	89 3c 24             	mov    %edi,(%esp)
     c91:	e8 9c 2c 00 00       	call   3932 <kill>
  kill(pid2);
     c96:	89 34 24             	mov    %esi,(%esp)
     c99:	e8 94 2c 00 00       	call   3932 <kill>
  kill(pid3);
     c9e:	89 1c 24             	mov    %ebx,(%esp)
     ca1:	e8 8c 2c 00 00       	call   3932 <kill>
  printf(1, "wait... ");
     ca6:	59                   	pop    %ecx
     ca7:	5b                   	pop    %ebx
     ca8:	68 5e 41 00 00       	push   $0x415e
     cad:	6a 01                	push   $0x1
     caf:	e8 bc 2d 00 00       	call   3a70 <printf>
  wait();
     cb4:	e8 51 2c 00 00       	call   390a <wait>
  wait();
     cb9:	e8 4c 2c 00 00       	call   390a <wait>
  wait();
     cbe:	e8 47 2c 00 00       	call   390a <wait>
  printf(1, "preempt ok\n");
     cc3:	5e                   	pop    %esi
     cc4:	5f                   	pop    %edi
     cc5:	68 67 41 00 00       	push   $0x4167
     cca:	6a 01                	push   $0x1
     ccc:	e8 9f 2d 00 00       	call   3a70 <printf>
     cd1:	83 c4 10             	add    $0x10,%esp
     cd4:	eb 97                	jmp    c6d <preempt+0xcd>
     cd6:	8d 76 00             	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	be 64 00 00 00       	mov    $0x64,%esi
     ce9:	53                   	push   %ebx
     cea:	eb 14                	jmp    d00 <exitwait+0x20>
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     cf0:	74 6f                	je     d61 <exitwait+0x81>
      if(wait() != pid){
     cf2:	e8 13 2c 00 00       	call   390a <wait>
     cf7:	39 c3                	cmp    %eax,%ebx
     cf9:	75 2d                	jne    d28 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     cfb:	83 ee 01             	sub    $0x1,%esi
     cfe:	74 48                	je     d48 <exitwait+0x68>
    pid = fork();
     d00:	e8 f5 2b 00 00       	call   38fa <fork>
    if(pid < 0){
     d05:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d07:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d09:	79 e5                	jns    cf0 <exitwait+0x10>
      printf(1, "fork failed\n");
     d0b:	83 ec 08             	sub    $0x8,%esp
     d0e:	68 d1 4c 00 00       	push   $0x4cd1
     d13:	6a 01                	push   $0x1
     d15:	e8 56 2d 00 00       	call   3a70 <printf>
      return;
     d1a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d20:	5b                   	pop    %ebx
     d21:	5e                   	pop    %esi
     d22:	5d                   	pop    %ebp
     d23:	c3                   	ret    
     d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d28:	83 ec 08             	sub    $0x8,%esp
     d2b:	68 73 41 00 00       	push   $0x4173
     d30:	6a 01                	push   $0x1
     d32:	e8 39 2d 00 00       	call   3a70 <printf>
        return;
     d37:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5d                   	pop    %ebp
     d40:	c3                   	ret    
     d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d48:	83 ec 08             	sub    $0x8,%esp
     d4b:	68 83 41 00 00       	push   $0x4183
     d50:	6a 01                	push   $0x1
     d52:	e8 19 2d 00 00       	call   3a70 <printf>
     d57:	83 c4 10             	add    $0x10,%esp
}
     d5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d5d:	5b                   	pop    %ebx
     d5e:	5e                   	pop    %esi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d61:	e8 9c 2b 00 00       	call   3902 <exit>
     d66:	8d 76 00             	lea    0x0(%esi),%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d70 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d79:	68 90 41 00 00       	push   $0x4190
     d7e:	6a 01                	push   $0x1
     d80:	e8 eb 2c 00 00       	call   3a70 <printf>
  ppid = getpid();
     d85:	e8 f8 2b 00 00       	call   3982 <getpid>
     d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d8c:	e8 69 2b 00 00       	call   38fa <fork>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	85 c0                	test   %eax,%eax
     d96:	75 70                	jne    e08 <mem+0x98>
     d98:	31 db                	xor    %ebx,%ebx
     d9a:	eb 08                	jmp    da4 <mem+0x34>
     d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     da0:	89 18                	mov    %ebx,(%eax)
     da2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     da4:	83 ec 0c             	sub    $0xc,%esp
     da7:	68 11 27 00 00       	push   $0x2711
     dac:	e8 ef 2e 00 00       	call   3ca0 <malloc>
     db1:	83 c4 10             	add    $0x10,%esp
     db4:	85 c0                	test   %eax,%eax
     db6:	75 e8                	jne    da0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     db8:	85 db                	test   %ebx,%ebx
     dba:	74 18                	je     dd4 <mem+0x64>
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     dc0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dc2:	83 ec 0c             	sub    $0xc,%esp
     dc5:	53                   	push   %ebx
     dc6:	89 fb                	mov    %edi,%ebx
     dc8:	e8 43 2e 00 00       	call   3c10 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     dcd:	83 c4 10             	add    $0x10,%esp
     dd0:	85 db                	test   %ebx,%ebx
     dd2:	75 ec                	jne    dc0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     dd4:	83 ec 0c             	sub    $0xc,%esp
     dd7:	68 00 50 00 00       	push   $0x5000
     ddc:	e8 bf 2e 00 00       	call   3ca0 <malloc>
    if(m1 == 0){
     de1:	83 c4 10             	add    $0x10,%esp
     de4:	85 c0                	test   %eax,%eax
     de6:	74 30                	je     e18 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     de8:	83 ec 0c             	sub    $0xc,%esp
     deb:	50                   	push   %eax
     dec:	e8 1f 2e 00 00       	call   3c10 <free>
    printf(1, "mem ok\n");
     df1:	58                   	pop    %eax
     df2:	5a                   	pop    %edx
     df3:	68 b4 41 00 00       	push   $0x41b4
     df8:	6a 01                	push   $0x1
     dfa:	e8 71 2c 00 00       	call   3a70 <printf>
    exit();
     dff:	e8 fe 2a 00 00       	call   3902 <exit>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0b:	5b                   	pop    %ebx
     e0c:	5e                   	pop    %esi
     e0d:	5f                   	pop    %edi
     e0e:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e0f:	e9 f6 2a 00 00       	jmp    390a <wait>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 9a 41 00 00       	push   $0x419a
     e20:	6a 01                	push   $0x1
     e22:	e8 49 2c 00 00       	call   3a70 <printf>
      kill(ppid);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 03 2b 00 00       	call   3932 <kill>
      exit();
     e2f:	e8 ce 2a 00 00       	call   3902 <exit>
     e34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e40 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e49:	68 bc 41 00 00       	push   $0x41bc
     e4e:	6a 01                	push   $0x1
     e50:	e8 1b 2c 00 00       	call   3a70 <printf>

  unlink("sharedfd");
     e55:	c7 04 24 cb 41 00 00 	movl   $0x41cb,(%esp)
     e5c:	e8 f1 2a 00 00       	call   3952 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e61:	5b                   	pop    %ebx
     e62:	5e                   	pop    %esi
     e63:	68 02 02 00 00       	push   $0x202
     e68:	68 cb 41 00 00       	push   $0x41cb
     e6d:	e8 d0 2a 00 00       	call   3942 <open>
  if(fd < 0){
     e72:	83 c4 10             	add    $0x10,%esp
     e75:	85 c0                	test   %eax,%eax
     e77:	0f 88 29 01 00 00    	js     fa6 <sharedfd+0x166>
     e7d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e7f:	8d 75 de             	lea    -0x22(%ebp),%esi
     e82:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e87:	e8 6e 2a 00 00       	call   38fa <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e92:	19 c0                	sbb    %eax,%eax
     e94:	83 ec 04             	sub    $0x4,%esp
     e97:	83 e0 f3             	and    $0xfffffff3,%eax
     e9a:	6a 0a                	push   $0xa
     e9c:	83 c0 70             	add    $0x70,%eax
     e9f:	50                   	push   %eax
     ea0:	56                   	push   %esi
     ea1:	e8 ca 28 00 00       	call   3770 <memset>
     ea6:	83 c4 10             	add    $0x10,%esp
     ea9:	eb 0a                	jmp    eb5 <sharedfd+0x75>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     eb0:	83 eb 01             	sub    $0x1,%ebx
     eb3:	74 26                	je     edb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     eb5:	83 ec 04             	sub    $0x4,%esp
     eb8:	6a 0a                	push   $0xa
     eba:	56                   	push   %esi
     ebb:	57                   	push   %edi
     ebc:	e8 61 2a 00 00       	call   3922 <write>
     ec1:	83 c4 10             	add    $0x10,%esp
     ec4:	83 f8 0a             	cmp    $0xa,%eax
     ec7:	74 e7                	je     eb0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ec9:	83 ec 08             	sub    $0x8,%esp
     ecc:	68 bc 4e 00 00       	push   $0x4ebc
     ed1:	6a 01                	push   $0x1
     ed3:	e8 98 2b 00 00       	call   3a70 <printf>
      break;
     ed8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     edb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     ede:	85 c9                	test   %ecx,%ecx
     ee0:	0f 84 f4 00 00 00    	je     fda <sharedfd+0x19a>
    exit();
  else
    wait();
     ee6:	e8 1f 2a 00 00       	call   390a <wait>
  close(fd);
     eeb:	83 ec 0c             	sub    $0xc,%esp
     eee:	31 db                	xor    %ebx,%ebx
     ef0:	57                   	push   %edi
     ef1:	8d 7d e8             	lea    -0x18(%ebp),%edi
     ef4:	e8 31 2a 00 00       	call   392a <close>
  fd = open("sharedfd", 0);
     ef9:	58                   	pop    %eax
     efa:	5a                   	pop    %edx
     efb:	6a 00                	push   $0x0
     efd:	68 cb 41 00 00       	push   $0x41cb
     f02:	e8 3b 2a 00 00       	call   3942 <open>
  if(fd < 0){
     f07:	83 c4 10             	add    $0x10,%esp
     f0a:	31 d2                	xor    %edx,%edx
     f0c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f0e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f11:	0f 88 a9 00 00 00    	js     fc0 <sharedfd+0x180>
     f17:	89 f6                	mov    %esi,%esi
     f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f26:	6a 0a                	push   $0xa
     f28:	56                   	push   %esi
     f29:	ff 75 d0             	pushl  -0x30(%ebp)
     f2c:	e8 e9 29 00 00       	call   391a <read>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	85 c0                	test   %eax,%eax
     f36:	7e 27                	jle    f5f <sharedfd+0x11f>
     f38:	89 f0                	mov    %esi,%eax
     f3a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f3d:	eb 13                	jmp    f52 <sharedfd+0x112>
     f3f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f40:	80 f9 70             	cmp    $0x70,%cl
     f43:	0f 94 c1             	sete   %cl
     f46:	0f b6 c9             	movzbl %cl,%ecx
     f49:	01 cb                	add    %ecx,%ebx
     f4b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f4e:	39 c7                	cmp    %eax,%edi
     f50:	74 ce                	je     f20 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f52:	0f b6 08             	movzbl (%eax),%ecx
     f55:	80 f9 63             	cmp    $0x63,%cl
     f58:	75 e6                	jne    f40 <sharedfd+0x100>
        nc++;
     f5a:	83 c2 01             	add    $0x1,%edx
     f5d:	eb ec                	jmp    f4b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 d0             	pushl  -0x30(%ebp)
     f65:	e8 c0 29 00 00       	call   392a <close>
  unlink("sharedfd");
     f6a:	c7 04 24 cb 41 00 00 	movl   $0x41cb,(%esp)
     f71:	e8 dc 29 00 00       	call   3952 <unlink>
  if(nc == 10000 && np == 10000){
     f76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f79:	83 c4 10             	add    $0x10,%esp
     f7c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f82:	75 5b                	jne    fdf <sharedfd+0x19f>
     f84:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f8a:	75 53                	jne    fdf <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f8c:	83 ec 08             	sub    $0x8,%esp
     f8f:	68 d4 41 00 00       	push   $0x41d4
     f94:	6a 01                	push   $0x1
     f96:	e8 d5 2a 00 00       	call   3a70 <printf>
     f9b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     f9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa1:	5b                   	pop    %ebx
     fa2:	5e                   	pop    %esi
     fa3:	5f                   	pop    %edi
     fa4:	5d                   	pop    %ebp
     fa5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fa6:	83 ec 08             	sub    $0x8,%esp
     fa9:	68 90 4e 00 00       	push   $0x4e90
     fae:	6a 01                	push   $0x1
     fb0:	e8 bb 2a 00 00       	call   3a70 <printf>
    return;
     fb5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbb:	5b                   	pop    %ebx
     fbc:	5e                   	pop    %esi
     fbd:	5f                   	pop    %edi
     fbe:	5d                   	pop    %ebp
     fbf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 dc 4e 00 00       	push   $0x4edc
     fc8:	6a 01                	push   $0x1
     fca:	e8 a1 2a 00 00       	call   3a70 <printf>
    return;
     fcf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     fda:	e8 23 29 00 00       	call   3902 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fdf:	53                   	push   %ebx
     fe0:	52                   	push   %edx
     fe1:	68 e1 41 00 00       	push   $0x41e1
     fe6:	6a 01                	push   $0x1
     fe8:	e8 83 2a 00 00       	call   3a70 <printf>
    exit();
     fed:	e8 10 29 00 00       	call   3902 <exit>
     ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001000 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
    1005:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1006:	be f6 41 00 00       	mov    $0x41f6,%esi

  for(pi = 0; pi < 4; pi++){
    100b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    100d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1010:	c7 45 d8 f6 41 00 00 	movl   $0x41f6,-0x28(%ebp)
    1017:	c7 45 dc 3f 43 00 00 	movl   $0x433f,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    101e:	68 fc 41 00 00       	push   $0x41fc
    1023:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1025:	c7 45 e0 43 43 00 00 	movl   $0x4343,-0x20(%ebp)
    102c:	c7 45 e4 f9 41 00 00 	movl   $0x41f9,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1033:	e8 38 2a 00 00       	call   3a70 <printf>
    1038:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	56                   	push   %esi
    103f:	e8 0e 29 00 00       	call   3952 <unlink>

    pid = fork();
    1044:	e8 b1 28 00 00       	call   38fa <fork>
    if(pid < 0){
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	85 c0                	test   %eax,%eax
    104e:	0f 88 83 01 00 00    	js     11d7 <fourfiles+0x1d7>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1054:	0f 84 e3 00 00 00    	je     113d <fourfiles+0x13d>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    105a:	83 c3 01             	add    $0x1,%ebx
    105d:	83 fb 04             	cmp    $0x4,%ebx
    1060:	74 06                	je     1068 <fourfiles+0x68>
    1062:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1066:	eb d3                	jmp    103b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1068:	e8 9d 28 00 00       	call   390a <wait>
    106d:	bf 30 00 00 00       	mov    $0x30,%edi
    1072:	e8 93 28 00 00       	call   390a <wait>
    1077:	e8 8e 28 00 00       	call   390a <wait>
    107c:	e8 89 28 00 00       	call   390a <wait>
    1081:	c7 45 d4 f6 41 00 00 	movl   $0x41f6,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1088:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    108b:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    108d:	6a 00                	push   $0x0
    108f:	ff 75 d4             	pushl  -0x2c(%ebp)
    1092:	e8 ab 28 00 00       	call   3942 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1097:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    109a:	89 c6                	mov    %eax,%esi
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	68 00 20 00 00       	push   $0x2000
    10a8:	68 40 86 00 00       	push   $0x8640
    10ad:	56                   	push   %esi
    10ae:	e8 67 28 00 00       	call   391a <read>
    10b3:	83 c4 10             	add    $0x10,%esp
    10b6:	85 c0                	test   %eax,%eax
    10b8:	7e 1c                	jle    10d6 <fourfiles+0xd6>
    10ba:	31 d2                	xor    %edx,%edx
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10c0:	0f be 8a 40 86 00 00 	movsbl 0x8640(%edx),%ecx
    10c7:	39 cf                	cmp    %ecx,%edi
    10c9:	75 5e                	jne    1129 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10cb:	83 c2 01             	add    $0x1,%edx
    10ce:	39 d0                	cmp    %edx,%eax
    10d0:	75 ee                	jne    10c0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10d2:	01 c3                	add    %eax,%ebx
    10d4:	eb ca                	jmp    10a0 <fourfiles+0xa0>
    }
    close(fd);
    10d6:	83 ec 0c             	sub    $0xc,%esp
    10d9:	56                   	push   %esi
    10da:	e8 4b 28 00 00       	call   392a <close>
    if(total != 12*500){
    10df:	83 c4 10             	add    $0x10,%esp
    10e2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    10e8:	0f 85 d4 00 00 00    	jne    11c2 <fourfiles+0x1c2>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    10ee:	83 ec 0c             	sub    $0xc,%esp
    10f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f4:	83 c7 01             	add    $0x1,%edi
    10f7:	e8 56 28 00 00       	call   3952 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    10fc:	83 c4 10             	add    $0x10,%esp
    10ff:	83 ff 32             	cmp    $0x32,%edi
    1102:	75 1a                	jne    111e <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	68 3a 42 00 00       	push   $0x423a
    110c:	6a 01                	push   $0x1
    110e:	e8 5d 29 00 00       	call   3a70 <printf>
}
    1113:	83 c4 10             	add    $0x10,%esp
    1116:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1119:	5b                   	pop    %ebx
    111a:	5e                   	pop    %esi
    111b:	5f                   	pop    %edi
    111c:	5d                   	pop    %ebp
    111d:	c3                   	ret    
    111e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1121:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1124:	e9 5f ff ff ff       	jmp    1088 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1129:	83 ec 08             	sub    $0x8,%esp
    112c:	68 1d 42 00 00       	push   $0x421d
    1131:	6a 01                	push   $0x1
    1133:	e8 38 29 00 00       	call   3a70 <printf>
          exit();
    1138:	e8 c5 27 00 00       	call   3902 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	68 02 02 00 00       	push   $0x202
    1145:	56                   	push   %esi
    1146:	e8 f7 27 00 00       	call   3942 <open>
      if(fd < 0){
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1150:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1152:	78 5a                	js     11ae <fourfiles+0x1ae>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1154:	83 ec 04             	sub    $0x4,%esp
    1157:	83 c3 30             	add    $0x30,%ebx
    115a:	68 00 02 00 00       	push   $0x200
    115f:	53                   	push   %ebx
    1160:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1165:	68 40 86 00 00       	push   $0x8640
    116a:	e8 01 26 00 00       	call   3770 <memset>
    116f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1172:	83 ec 04             	sub    $0x4,%esp
    1175:	68 f4 01 00 00       	push   $0x1f4
    117a:	68 40 86 00 00       	push   $0x8640
    117f:	56                   	push   %esi
    1180:	e8 9d 27 00 00       	call   3922 <write>
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    118d:	75 0a                	jne    1199 <fourfiles+0x199>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    118f:	83 eb 01             	sub    $0x1,%ebx
    1192:	75 de                	jne    1172 <fourfiles+0x172>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    1194:	e8 69 27 00 00       	call   3902 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    1199:	83 ec 04             	sub    $0x4,%esp
    119c:	50                   	push   %eax
    119d:	68 0c 42 00 00       	push   $0x420c
    11a2:	6a 01                	push   $0x1
    11a4:	e8 c7 28 00 00       	call   3a70 <printf>
          exit();
    11a9:	e8 54 27 00 00       	call   3902 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11ae:	83 ec 08             	sub    $0x8,%esp
    11b1:	68 97 44 00 00       	push   $0x4497
    11b6:	6a 01                	push   $0x1
    11b8:	e8 b3 28 00 00       	call   3a70 <printf>
        exit();
    11bd:	e8 40 27 00 00       	call   3902 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11c2:	83 ec 04             	sub    $0x4,%esp
    11c5:	53                   	push   %ebx
    11c6:	68 29 42 00 00       	push   $0x4229
    11cb:	6a 01                	push   $0x1
    11cd:	e8 9e 28 00 00       	call   3a70 <printf>
      exit();
    11d2:	e8 2b 27 00 00       	call   3902 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11d7:	83 ec 08             	sub    $0x8,%esp
    11da:	68 d1 4c 00 00       	push   $0x4cd1
    11df:	6a 01                	push   $0x1
    11e1:	e8 8a 28 00 00       	call   3a70 <printf>
      exit();
    11e6:	e8 17 27 00 00       	call   3902 <exit>
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011f0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	56                   	push   %esi
    11f5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    11f6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11f8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    11fb:	68 48 42 00 00       	push   $0x4248
    1200:	6a 01                	push   $0x1
    1202:	e8 69 28 00 00       	call   3a70 <printf>
    1207:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    120a:	e8 eb 26 00 00       	call   38fa <fork>
    if(pid < 0){
    120f:	85 c0                	test   %eax,%eax
    1211:	0f 88 b7 01 00 00    	js     13ce <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1217:	0f 84 f6 00 00 00    	je     1313 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    121d:	83 c3 01             	add    $0x1,%ebx
    1220:	83 fb 04             	cmp    $0x4,%ebx
    1223:	75 e5                	jne    120a <createdelete+0x1a>
    1225:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1228:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    122a:	e8 db 26 00 00       	call   390a <wait>
    122f:	e8 d6 26 00 00       	call   390a <wait>
    1234:	e8 d1 26 00 00       	call   390a <wait>
    1239:	e8 cc 26 00 00       	call   390a <wait>
  }

  name[0] = name[1] = name[2] = 0;
    123e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1248:	8d 46 30             	lea    0x30(%esi),%eax
    124b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    124e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1253:	0f 9f c2             	setg   %dl
    1256:	85 f6                	test   %esi,%esi
    1258:	88 45 c7             	mov    %al,-0x39(%ebp)
    125b:	0f 94 c0             	sete   %al
    125e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1260:	8d 46 ff             	lea    -0x1(%esi),%eax
    1263:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1266:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1269:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    126d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1270:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1273:	6a 00                	push   $0x0
    1275:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1276:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1279:	e8 c4 26 00 00       	call   3942 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    127e:	89 c1                	mov    %eax,%ecx
    1280:	83 c4 10             	add    $0x10,%esp
    1283:	c1 e9 1f             	shr    $0x1f,%ecx
    1286:	84 c9                	test   %cl,%cl
    1288:	74 0a                	je     1294 <createdelete+0xa4>
    128a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    128e:	0f 85 11 01 00 00    	jne    13a5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1294:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1298:	0f 86 44 01 00 00    	jbe    13e2 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    129e:	85 c0                	test   %eax,%eax
    12a0:	78 0c                	js     12ae <createdelete+0xbe>
        close(fd);
    12a2:	83 ec 0c             	sub    $0xc,%esp
    12a5:	50                   	push   %eax
    12a6:	e8 7f 26 00 00       	call   392a <close>
    12ab:	83 c4 10             	add    $0x10,%esp
    12ae:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12b1:	80 fb 74             	cmp    $0x74,%bl
    12b4:	75 b3                	jne    1269 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12b6:	83 c6 01             	add    $0x1,%esi
    12b9:	83 fe 14             	cmp    $0x14,%esi
    12bc:	75 8a                	jne    1248 <createdelete+0x58>
    12be:	be 70 00 00 00       	mov    $0x70,%esi
    12c3:	90                   	nop
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12cb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12d0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12d3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12d5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12d8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12db:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12df:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    12e0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12e3:	e8 6a 26 00 00       	call   3952 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12e8:	83 c4 10             	add    $0x10,%esp
    12eb:	83 eb 01             	sub    $0x1,%ebx
    12ee:	75 e3                	jne    12d3 <createdelete+0xe3>
    12f0:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    12f3:	89 f0                	mov    %esi,%eax
    12f5:	3c 84                	cmp    $0x84,%al
    12f7:	75 cf                	jne    12c8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    12f9:	83 ec 08             	sub    $0x8,%esp
    12fc:	68 5b 42 00 00       	push   $0x425b
    1301:	6a 01                	push   $0x1
    1303:	e8 68 27 00 00       	call   3a70 <printf>
}
    1308:	83 c4 10             	add    $0x10,%esp
    130b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    130e:	5b                   	pop    %ebx
    130f:	5e                   	pop    %esi
    1310:	5f                   	pop    %edi
    1311:	5d                   	pop    %ebp
    1312:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1313:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1316:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    131a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    131f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1322:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1325:	31 db                	xor    %ebx,%ebx
    1327:	eb 12                	jmp    133b <createdelete+0x14b>
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1330:	83 fe 14             	cmp    $0x14,%esi
    1333:	74 6b                	je     13a0 <createdelete+0x1b0>
    1335:	83 c3 01             	add    $0x1,%ebx
    1338:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    133b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    133e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1341:	68 02 02 00 00       	push   $0x202
    1346:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1347:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    134a:	e8 f3 25 00 00       	call   3942 <open>
        if(fd < 0){
    134f:	83 c4 10             	add    $0x10,%esp
    1352:	85 c0                	test   %eax,%eax
    1354:	78 64                	js     13ba <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1356:	83 ec 0c             	sub    $0xc,%esp
    1359:	50                   	push   %eax
    135a:	e8 cb 25 00 00       	call   392a <close>
        if(i > 0 && (i % 2 ) == 0){
    135f:	83 c4 10             	add    $0x10,%esp
    1362:	85 db                	test   %ebx,%ebx
    1364:	74 cf                	je     1335 <createdelete+0x145>
    1366:	f6 c3 01             	test   $0x1,%bl
    1369:	75 c5                	jne    1330 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    136b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    136e:	89 d8                	mov    %ebx,%eax
    1370:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1372:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1373:	83 c0 30             	add    $0x30,%eax
    1376:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1379:	e8 d4 25 00 00       	call   3952 <unlink>
    137e:	83 c4 10             	add    $0x10,%esp
    1381:	85 c0                	test   %eax,%eax
    1383:	79 ab                	jns    1330 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1385:	83 ec 08             	sub    $0x8,%esp
    1388:	68 49 3e 00 00       	push   $0x3e49
    138d:	6a 01                	push   $0x1
    138f:	e8 dc 26 00 00       	call   3a70 <printf>
            exit();
    1394:	e8 69 25 00 00       	call   3902 <exit>
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13a0:	e8 5d 25 00 00       	call   3902 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13a5:	83 ec 04             	sub    $0x4,%esp
    13a8:	57                   	push   %edi
    13a9:	68 08 4f 00 00       	push   $0x4f08
    13ae:	6a 01                	push   $0x1
    13b0:	e8 bb 26 00 00       	call   3a70 <printf>
        exit();
    13b5:	e8 48 25 00 00       	call   3902 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13ba:	83 ec 08             	sub    $0x8,%esp
    13bd:	68 97 44 00 00       	push   $0x4497
    13c2:	6a 01                	push   $0x1
    13c4:	e8 a7 26 00 00       	call   3a70 <printf>
          exit();
    13c9:	e8 34 25 00 00       	call   3902 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13ce:	83 ec 08             	sub    $0x8,%esp
    13d1:	68 d1 4c 00 00       	push   $0x4cd1
    13d6:	6a 01                	push   $0x1
    13d8:	e8 93 26 00 00       	call   3a70 <printf>
      exit();
    13dd:	e8 20 25 00 00       	call   3902 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13e2:	85 c0                	test   %eax,%eax
    13e4:	0f 88 c4 fe ff ff    	js     12ae <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    13ea:	83 ec 04             	sub    $0x4,%esp
    13ed:	57                   	push   %edi
    13ee:	68 2c 4f 00 00       	push   $0x4f2c
    13f3:	6a 01                	push   $0x1
    13f5:	e8 76 26 00 00       	call   3a70 <printf>
        exit();
    13fa:	e8 03 25 00 00       	call   3902 <exit>
    13ff:	90                   	nop

00001400 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	56                   	push   %esi
    1404:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1405:	83 ec 08             	sub    $0x8,%esp
    1408:	68 6c 42 00 00       	push   $0x426c
    140d:	6a 01                	push   $0x1
    140f:	e8 5c 26 00 00       	call   3a70 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1414:	5b                   	pop    %ebx
    1415:	5e                   	pop    %esi
    1416:	68 02 02 00 00       	push   $0x202
    141b:	68 7d 42 00 00       	push   $0x427d
    1420:	e8 1d 25 00 00       	call   3942 <open>
  if(fd < 0){
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	85 c0                	test   %eax,%eax
    142a:	0f 88 e6 00 00 00    	js     1516 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1430:	83 ec 04             	sub    $0x4,%esp
    1433:	89 c3                	mov    %eax,%ebx
    1435:	6a 05                	push   $0x5
    1437:	68 a2 42 00 00       	push   $0x42a2
    143c:	50                   	push   %eax
    143d:	e8 e0 24 00 00       	call   3922 <write>
  close(fd);
    1442:	89 1c 24             	mov    %ebx,(%esp)
    1445:	e8 e0 24 00 00       	call   392a <close>

  fd = open("unlinkread", O_RDWR);
    144a:	58                   	pop    %eax
    144b:	5a                   	pop    %edx
    144c:	6a 02                	push   $0x2
    144e:	68 7d 42 00 00       	push   $0x427d
    1453:	e8 ea 24 00 00       	call   3942 <open>
  if(fd < 0){
    1458:	83 c4 10             	add    $0x10,%esp
    145b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    145d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    145f:	0f 88 10 01 00 00    	js     1575 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1465:	83 ec 0c             	sub    $0xc,%esp
    1468:	68 7d 42 00 00       	push   $0x427d
    146d:	e8 e0 24 00 00       	call   3952 <unlink>
    1472:	83 c4 10             	add    $0x10,%esp
    1475:	85 c0                	test   %eax,%eax
    1477:	0f 85 e5 00 00 00    	jne    1562 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    147d:	83 ec 08             	sub    $0x8,%esp
    1480:	68 02 02 00 00       	push   $0x202
    1485:	68 7d 42 00 00       	push   $0x427d
    148a:	e8 b3 24 00 00       	call   3942 <open>
  write(fd1, "yyy", 3);
    148f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1492:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1494:	6a 03                	push   $0x3
    1496:	68 da 42 00 00       	push   $0x42da
    149b:	50                   	push   %eax
    149c:	e8 81 24 00 00       	call   3922 <write>
  close(fd1);
    14a1:	89 34 24             	mov    %esi,(%esp)
    14a4:	e8 81 24 00 00       	call   392a <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14a9:	83 c4 0c             	add    $0xc,%esp
    14ac:	68 00 20 00 00       	push   $0x2000
    14b1:	68 40 86 00 00       	push   $0x8640
    14b6:	53                   	push   %ebx
    14b7:	e8 5e 24 00 00       	call   391a <read>
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	83 f8 05             	cmp    $0x5,%eax
    14c2:	0f 85 87 00 00 00    	jne    154f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14c8:	80 3d 40 86 00 00 68 	cmpb   $0x68,0x8640
    14cf:	75 6b                	jne    153c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14d1:	83 ec 04             	sub    $0x4,%esp
    14d4:	6a 0a                	push   $0xa
    14d6:	68 40 86 00 00       	push   $0x8640
    14db:	53                   	push   %ebx
    14dc:	e8 41 24 00 00       	call   3922 <write>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	83 f8 0a             	cmp    $0xa,%eax
    14e7:	75 40                	jne    1529 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    14e9:	83 ec 0c             	sub    $0xc,%esp
    14ec:	53                   	push   %ebx
    14ed:	e8 38 24 00 00       	call   392a <close>
  unlink("unlinkread");
    14f2:	c7 04 24 7d 42 00 00 	movl   $0x427d,(%esp)
    14f9:	e8 54 24 00 00       	call   3952 <unlink>
  printf(1, "unlinkread ok\n");
    14fe:	58                   	pop    %eax
    14ff:	5a                   	pop    %edx
    1500:	68 25 43 00 00       	push   $0x4325
    1505:	6a 01                	push   $0x1
    1507:	e8 64 25 00 00       	call   3a70 <printf>
}
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1512:	5b                   	pop    %ebx
    1513:	5e                   	pop    %esi
    1514:	5d                   	pop    %ebp
    1515:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1516:	51                   	push   %ecx
    1517:	51                   	push   %ecx
    1518:	68 88 42 00 00       	push   $0x4288
    151d:	6a 01                	push   $0x1
    151f:	e8 4c 25 00 00       	call   3a70 <printf>
    exit();
    1524:	e8 d9 23 00 00       	call   3902 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1529:	51                   	push   %ecx
    152a:	51                   	push   %ecx
    152b:	68 0c 43 00 00       	push   $0x430c
    1530:	6a 01                	push   $0x1
    1532:	e8 39 25 00 00       	call   3a70 <printf>
    exit();
    1537:	e8 c6 23 00 00       	call   3902 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    153c:	53                   	push   %ebx
    153d:	53                   	push   %ebx
    153e:	68 f5 42 00 00       	push   $0x42f5
    1543:	6a 01                	push   $0x1
    1545:	e8 26 25 00 00       	call   3a70 <printf>
    exit();
    154a:	e8 b3 23 00 00       	call   3902 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    154f:	56                   	push   %esi
    1550:	56                   	push   %esi
    1551:	68 de 42 00 00       	push   $0x42de
    1556:	6a 01                	push   $0x1
    1558:	e8 13 25 00 00       	call   3a70 <printf>
    exit();
    155d:	e8 a0 23 00 00       	call   3902 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1562:	50                   	push   %eax
    1563:	50                   	push   %eax
    1564:	68 c0 42 00 00       	push   $0x42c0
    1569:	6a 01                	push   $0x1
    156b:	e8 00 25 00 00       	call   3a70 <printf>
    exit();
    1570:	e8 8d 23 00 00       	call   3902 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1575:	50                   	push   %eax
    1576:	50                   	push   %eax
    1577:	68 a8 42 00 00       	push   $0x42a8
    157c:	6a 01                	push   $0x1
    157e:	e8 ed 24 00 00       	call   3a70 <printf>
    exit();
    1583:	e8 7a 23 00 00       	call   3902 <exit>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001590 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	53                   	push   %ebx
    1594:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    1597:	68 34 43 00 00       	push   $0x4334
    159c:	6a 01                	push   $0x1
    159e:	e8 cd 24 00 00       	call   3a70 <printf>

  unlink("lf1");
    15a3:	c7 04 24 3e 43 00 00 	movl   $0x433e,(%esp)
    15aa:	e8 a3 23 00 00       	call   3952 <unlink>
  unlink("lf2");
    15af:	c7 04 24 42 43 00 00 	movl   $0x4342,(%esp)
    15b6:	e8 97 23 00 00       	call   3952 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15bb:	58                   	pop    %eax
    15bc:	5a                   	pop    %edx
    15bd:	68 02 02 00 00       	push   $0x202
    15c2:	68 3e 43 00 00       	push   $0x433e
    15c7:	e8 76 23 00 00       	call   3942 <open>
  if(fd < 0){
    15cc:	83 c4 10             	add    $0x10,%esp
    15cf:	85 c0                	test   %eax,%eax
    15d1:	0f 88 1e 01 00 00    	js     16f5 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15d7:	83 ec 04             	sub    $0x4,%esp
    15da:	89 c3                	mov    %eax,%ebx
    15dc:	6a 05                	push   $0x5
    15de:	68 a2 42 00 00       	push   $0x42a2
    15e3:	50                   	push   %eax
    15e4:	e8 39 23 00 00       	call   3922 <write>
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	83 f8 05             	cmp    $0x5,%eax
    15ef:	0f 85 98 01 00 00    	jne    178d <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	53                   	push   %ebx
    15f9:	e8 2c 23 00 00       	call   392a <close>

  if(link("lf1", "lf2") < 0){
    15fe:	5b                   	pop    %ebx
    15ff:	58                   	pop    %eax
    1600:	68 42 43 00 00       	push   $0x4342
    1605:	68 3e 43 00 00       	push   $0x433e
    160a:	e8 53 23 00 00       	call   3962 <link>
    160f:	83 c4 10             	add    $0x10,%esp
    1612:	85 c0                	test   %eax,%eax
    1614:	0f 88 60 01 00 00    	js     177a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    161a:	83 ec 0c             	sub    $0xc,%esp
    161d:	68 3e 43 00 00       	push   $0x433e
    1622:	e8 2b 23 00 00       	call   3952 <unlink>

  if(open("lf1", 0) >= 0){
    1627:	58                   	pop    %eax
    1628:	5a                   	pop    %edx
    1629:	6a 00                	push   $0x0
    162b:	68 3e 43 00 00       	push   $0x433e
    1630:	e8 0d 23 00 00       	call   3942 <open>
    1635:	83 c4 10             	add    $0x10,%esp
    1638:	85 c0                	test   %eax,%eax
    163a:	0f 89 27 01 00 00    	jns    1767 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1640:	83 ec 08             	sub    $0x8,%esp
    1643:	6a 00                	push   $0x0
    1645:	68 42 43 00 00       	push   $0x4342
    164a:	e8 f3 22 00 00       	call   3942 <open>
  if(fd < 0){
    164f:	83 c4 10             	add    $0x10,%esp
    1652:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1654:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1656:	0f 88 f8 00 00 00    	js     1754 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    165c:	83 ec 04             	sub    $0x4,%esp
    165f:	68 00 20 00 00       	push   $0x2000
    1664:	68 40 86 00 00       	push   $0x8640
    1669:	50                   	push   %eax
    166a:	e8 ab 22 00 00       	call   391a <read>
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	83 f8 05             	cmp    $0x5,%eax
    1675:	0f 85 c6 00 00 00    	jne    1741 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    167b:	83 ec 0c             	sub    $0xc,%esp
    167e:	53                   	push   %ebx
    167f:	e8 a6 22 00 00       	call   392a <close>

  if(link("lf2", "lf2") >= 0){
    1684:	58                   	pop    %eax
    1685:	5a                   	pop    %edx
    1686:	68 42 43 00 00       	push   $0x4342
    168b:	68 42 43 00 00       	push   $0x4342
    1690:	e8 cd 22 00 00       	call   3962 <link>
    1695:	83 c4 10             	add    $0x10,%esp
    1698:	85 c0                	test   %eax,%eax
    169a:	0f 89 8e 00 00 00    	jns    172e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16a0:	83 ec 0c             	sub    $0xc,%esp
    16a3:	68 42 43 00 00       	push   $0x4342
    16a8:	e8 a5 22 00 00       	call   3952 <unlink>
  if(link("lf2", "lf1") >= 0){
    16ad:	59                   	pop    %ecx
    16ae:	5b                   	pop    %ebx
    16af:	68 3e 43 00 00       	push   $0x433e
    16b4:	68 42 43 00 00       	push   $0x4342
    16b9:	e8 a4 22 00 00       	call   3962 <link>
    16be:	83 c4 10             	add    $0x10,%esp
    16c1:	85 c0                	test   %eax,%eax
    16c3:	79 56                	jns    171b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16c5:	83 ec 08             	sub    $0x8,%esp
    16c8:	68 3e 43 00 00       	push   $0x433e
    16cd:	68 06 46 00 00       	push   $0x4606
    16d2:	e8 8b 22 00 00       	call   3962 <link>
    16d7:	83 c4 10             	add    $0x10,%esp
    16da:	85 c0                	test   %eax,%eax
    16dc:	79 2a                	jns    1708 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16de:	83 ec 08             	sub    $0x8,%esp
    16e1:	68 dc 43 00 00       	push   $0x43dc
    16e6:	6a 01                	push   $0x1
    16e8:	e8 83 23 00 00       	call   3a70 <printf>
}
    16ed:	83 c4 10             	add    $0x10,%esp
    16f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    16f3:	c9                   	leave  
    16f4:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    16f5:	50                   	push   %eax
    16f6:	50                   	push   %eax
    16f7:	68 46 43 00 00       	push   $0x4346
    16fc:	6a 01                	push   $0x1
    16fe:	e8 6d 23 00 00       	call   3a70 <printf>
    exit();
    1703:	e8 fa 21 00 00       	call   3902 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1708:	50                   	push   %eax
    1709:	50                   	push   %eax
    170a:	68 c0 43 00 00       	push   $0x43c0
    170f:	6a 01                	push   $0x1
    1711:	e8 5a 23 00 00       	call   3a70 <printf>
    exit();
    1716:	e8 e7 21 00 00       	call   3902 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    171b:	52                   	push   %edx
    171c:	52                   	push   %edx
    171d:	68 74 4f 00 00       	push   $0x4f74
    1722:	6a 01                	push   $0x1
    1724:	e8 47 23 00 00       	call   3a70 <printf>
    exit();
    1729:	e8 d4 21 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    172e:	50                   	push   %eax
    172f:	50                   	push   %eax
    1730:	68 a2 43 00 00       	push   $0x43a2
    1735:	6a 01                	push   $0x1
    1737:	e8 34 23 00 00       	call   3a70 <printf>
    exit();
    173c:	e8 c1 21 00 00       	call   3902 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1741:	51                   	push   %ecx
    1742:	51                   	push   %ecx
    1743:	68 91 43 00 00       	push   $0x4391
    1748:	6a 01                	push   $0x1
    174a:	e8 21 23 00 00       	call   3a70 <printf>
    exit();
    174f:	e8 ae 21 00 00       	call   3902 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1754:	53                   	push   %ebx
    1755:	53                   	push   %ebx
    1756:	68 80 43 00 00       	push   $0x4380
    175b:	6a 01                	push   $0x1
    175d:	e8 0e 23 00 00       	call   3a70 <printf>
    exit();
    1762:	e8 9b 21 00 00       	call   3902 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1767:	50                   	push   %eax
    1768:	50                   	push   %eax
    1769:	68 4c 4f 00 00       	push   $0x4f4c
    176e:	6a 01                	push   $0x1
    1770:	e8 fb 22 00 00       	call   3a70 <printf>
    exit();
    1775:	e8 88 21 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    177a:	51                   	push   %ecx
    177b:	51                   	push   %ecx
    177c:	68 6b 43 00 00       	push   $0x436b
    1781:	6a 01                	push   $0x1
    1783:	e8 e8 22 00 00       	call   3a70 <printf>
    exit();
    1788:	e8 75 21 00 00       	call   3902 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    178d:	50                   	push   %eax
    178e:	50                   	push   %eax
    178f:	68 59 43 00 00       	push   $0x4359
    1794:	6a 01                	push   $0x1
    1796:	e8 d5 22 00 00       	call   3a70 <printf>
    exit();
    179b:	e8 62 21 00 00       	call   3902 <exit>

000017a0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	57                   	push   %edi
    17a4:	56                   	push   %esi
    17a5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17a6:	31 f6                	xor    %esi,%esi
    17a8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17ab:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17b0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17b3:	68 e9 43 00 00       	push   $0x43e9
    17b8:	6a 01                	push   $0x1
    17ba:	e8 b1 22 00 00       	call   3a70 <printf>
  file[0] = 'C';
    17bf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17c3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17c7:	83 c4 10             	add    $0x10,%esp
    17ca:	eb 51                	jmp    181d <concreate+0x7d>
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17d0:	89 f0                	mov    %esi,%eax
    17d2:	89 f1                	mov    %esi,%ecx
    17d4:	f7 ef                	imul   %edi
    17d6:	89 f0                	mov    %esi,%eax
    17d8:	c1 f8 1f             	sar    $0x1f,%eax
    17db:	29 c2                	sub    %eax,%edx
    17dd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    17e0:	29 c1                	sub    %eax,%ecx
    17e2:	83 f9 01             	cmp    $0x1,%ecx
    17e5:	0f 84 b5 00 00 00    	je     18a0 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    17eb:	83 ec 08             	sub    $0x8,%esp
    17ee:	68 02 02 00 00       	push   $0x202
    17f3:	53                   	push   %ebx
    17f4:	e8 49 21 00 00       	call   3942 <open>
      if(fd < 0){
    17f9:	83 c4 10             	add    $0x10,%esp
    17fc:	85 c0                	test   %eax,%eax
    17fe:	78 6d                	js     186d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1800:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1803:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1806:	50                   	push   %eax
    1807:	e8 1e 21 00 00       	call   392a <close>
    180c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    180f:	e8 f6 20 00 00       	call   390a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1814:	83 fe 28             	cmp    $0x28,%esi
    1817:	0f 84 ab 00 00 00    	je     18c8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    181d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1820:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1823:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1824:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1827:	e8 26 21 00 00       	call   3952 <unlink>
    pid = fork();
    182c:	e8 c9 20 00 00       	call   38fa <fork>
    if(pid && (i % 3) == 1){
    1831:	83 c4 10             	add    $0x10,%esp
    1834:	85 c0                	test   %eax,%eax
    1836:	75 98                	jne    17d0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1838:	89 f0                	mov    %esi,%eax
    183a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    183f:	f7 ea                	imul   %edx
    1841:	89 f0                	mov    %esi,%eax
    1843:	c1 f8 1f             	sar    $0x1f,%eax
    1846:	d1 fa                	sar    %edx
    1848:	29 c2                	sub    %eax,%edx
    184a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    184d:	29 c6                	sub    %eax,%esi
    184f:	83 fe 01             	cmp    $0x1,%esi
    1852:	74 34                	je     1888 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1854:	83 ec 08             	sub    $0x8,%esp
    1857:	68 02 02 00 00       	push   $0x202
    185c:	53                   	push   %ebx
    185d:	e8 e0 20 00 00       	call   3942 <open>
      if(fd < 0){
    1862:	83 c4 10             	add    $0x10,%esp
    1865:	85 c0                	test   %eax,%eax
    1867:	0f 89 32 02 00 00    	jns    1a9f <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    186d:	83 ec 04             	sub    $0x4,%esp
    1870:	53                   	push   %ebx
    1871:	68 fc 43 00 00       	push   $0x43fc
    1876:	6a 01                	push   $0x1
    1878:	e8 f3 21 00 00       	call   3a70 <printf>
        exit();
    187d:	e8 80 20 00 00       	call   3902 <exit>
    1882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1888:	83 ec 08             	sub    $0x8,%esp
    188b:	53                   	push   %ebx
    188c:	68 f9 43 00 00       	push   $0x43f9
    1891:	e8 cc 20 00 00       	call   3962 <link>
    1896:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    1899:	e8 64 20 00 00       	call   3902 <exit>
    189e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18a0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18a3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18a6:	53                   	push   %ebx
    18a7:	68 f9 43 00 00       	push   $0x43f9
    18ac:	e8 b1 20 00 00       	call   3962 <link>
    18b1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    18b4:	e8 51 20 00 00       	call   390a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18b9:	83 fe 28             	cmp    $0x28,%esi
    18bc:	0f 85 5b ff ff ff    	jne    181d <concreate+0x7d>
    18c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    18c8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18cb:	83 ec 04             	sub    $0x4,%esp
    18ce:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18d1:	6a 28                	push   $0x28
    18d3:	6a 00                	push   $0x0
    18d5:	50                   	push   %eax
    18d6:	e8 95 1e 00 00       	call   3770 <memset>
  fd = open(".", 0);
    18db:	59                   	pop    %ecx
    18dc:	5e                   	pop    %esi
    18dd:	6a 00                	push   $0x0
    18df:	68 06 46 00 00       	push   $0x4606
    18e4:	e8 59 20 00 00       	call   3942 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    18e9:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    18ec:	89 c6                	mov    %eax,%esi
  n = 0;
    18ee:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    18f5:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    18f8:	83 ec 04             	sub    $0x4,%esp
    18fb:	6a 10                	push   $0x10
    18fd:	57                   	push   %edi
    18fe:	56                   	push   %esi
    18ff:	e8 16 20 00 00       	call   391a <read>
    1904:	83 c4 10             	add    $0x10,%esp
    1907:	85 c0                	test   %eax,%eax
    1909:	7e 3d                	jle    1948 <concreate+0x1a8>
    if(de.inum == 0)
    190b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1910:	74 e6                	je     18f8 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1912:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1916:	75 e0                	jne    18f8 <concreate+0x158>
    1918:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    191c:	75 da                	jne    18f8 <concreate+0x158>
      i = de.name[1] - '0';
    191e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1922:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1925:	83 f8 27             	cmp    $0x27,%eax
    1928:	0f 87 59 01 00 00    	ja     1a87 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    192e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1933:	0f 85 36 01 00 00    	jne    1a6f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1939:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    193e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1942:	eb b4                	jmp    18f8 <concreate+0x158>
    1944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1948:	83 ec 0c             	sub    $0xc,%esp
    194b:	56                   	push   %esi
    194c:	e8 d9 1f 00 00       	call   392a <close>

  if(n != 40){
    1951:	83 c4 10             	add    $0x10,%esp
    1954:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1958:	0f 85 fd 00 00 00    	jne    1a5b <concreate+0x2bb>
    195e:	31 f6                	xor    %esi,%esi
    1960:	eb 70                	jmp    19d2 <concreate+0x232>
    1962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1968:	83 fa 01             	cmp    $0x1,%edx
    196b:	0f 85 99 00 00 00    	jne    1a0a <concreate+0x26a>
      close(open(file, 0));
    1971:	83 ec 08             	sub    $0x8,%esp
    1974:	6a 00                	push   $0x0
    1976:	53                   	push   %ebx
    1977:	e8 c6 1f 00 00       	call   3942 <open>
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 a6 1f 00 00       	call   392a <close>
      close(open(file, 0));
    1984:	58                   	pop    %eax
    1985:	5a                   	pop    %edx
    1986:	6a 00                	push   $0x0
    1988:	53                   	push   %ebx
    1989:	e8 b4 1f 00 00       	call   3942 <open>
    198e:	89 04 24             	mov    %eax,(%esp)
    1991:	e8 94 1f 00 00       	call   392a <close>
      close(open(file, 0));
    1996:	59                   	pop    %ecx
    1997:	58                   	pop    %eax
    1998:	6a 00                	push   $0x0
    199a:	53                   	push   %ebx
    199b:	e8 a2 1f 00 00       	call   3942 <open>
    19a0:	89 04 24             	mov    %eax,(%esp)
    19a3:	e8 82 1f 00 00       	call   392a <close>
      close(open(file, 0));
    19a8:	58                   	pop    %eax
    19a9:	5a                   	pop    %edx
    19aa:	6a 00                	push   $0x0
    19ac:	53                   	push   %ebx
    19ad:	e8 90 1f 00 00       	call   3942 <open>
    19b2:	89 04 24             	mov    %eax,(%esp)
    19b5:	e8 70 1f 00 00       	call   392a <close>
    19ba:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19bd:	85 ff                	test   %edi,%edi
    19bf:	0f 84 d4 fe ff ff    	je     1899 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19c5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19c8:	e8 3d 1f 00 00       	call   390a <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19cd:	83 fe 28             	cmp    $0x28,%esi
    19d0:	74 5e                	je     1a30 <concreate+0x290>
    file[1] = '0' + i;
    19d2:	8d 46 30             	lea    0x30(%esi),%eax
    19d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19d8:	e8 1d 1f 00 00       	call   38fa <fork>
    if(pid < 0){
    19dd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19df:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19e1:	78 64                	js     1a47 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    19e3:	b8 56 55 55 55       	mov    $0x55555556,%eax
    19e8:	f7 ee                	imul   %esi
    19ea:	89 f0                	mov    %esi,%eax
    19ec:	c1 f8 1f             	sar    $0x1f,%eax
    19ef:	29 c2                	sub    %eax,%edx
    19f1:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f4:	89 f2                	mov    %esi,%edx
    19f6:	29 c2                	sub    %eax,%edx
    19f8:	89 f8                	mov    %edi,%eax
    19fa:	09 d0                	or     %edx,%eax
    19fc:	0f 84 6f ff ff ff    	je     1971 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    1a02:	85 ff                	test   %edi,%edi
    1a04:	0f 85 5e ff ff ff    	jne    1968 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a0a:	83 ec 0c             	sub    $0xc,%esp
    1a0d:	53                   	push   %ebx
    1a0e:	e8 3f 1f 00 00       	call   3952 <unlink>
      unlink(file);
    1a13:	89 1c 24             	mov    %ebx,(%esp)
    1a16:	e8 37 1f 00 00       	call   3952 <unlink>
      unlink(file);
    1a1b:	89 1c 24             	mov    %ebx,(%esp)
    1a1e:	e8 2f 1f 00 00       	call   3952 <unlink>
      unlink(file);
    1a23:	89 1c 24             	mov    %ebx,(%esp)
    1a26:	e8 27 1f 00 00       	call   3952 <unlink>
    1a2b:	83 c4 10             	add    $0x10,%esp
    1a2e:	eb 8d                	jmp    19bd <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a30:	83 ec 08             	sub    $0x8,%esp
    1a33:	68 4e 44 00 00       	push   $0x444e
    1a38:	6a 01                	push   $0x1
    1a3a:	e8 31 20 00 00       	call   3a70 <printf>
}
    1a3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a42:	5b                   	pop    %ebx
    1a43:	5e                   	pop    %esi
    1a44:	5f                   	pop    %edi
    1a45:	5d                   	pop    %ebp
    1a46:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a47:	83 ec 08             	sub    $0x8,%esp
    1a4a:	68 d1 4c 00 00       	push   $0x4cd1
    1a4f:	6a 01                	push   $0x1
    1a51:	e8 1a 20 00 00       	call   3a70 <printf>
      exit();
    1a56:	e8 a7 1e 00 00       	call   3902 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a5b:	83 ec 08             	sub    $0x8,%esp
    1a5e:	68 98 4f 00 00       	push   $0x4f98
    1a63:	6a 01                	push   $0x1
    1a65:	e8 06 20 00 00       	call   3a70 <printf>
    exit();
    1a6a:	e8 93 1e 00 00       	call   3902 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1a6f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a72:	83 ec 04             	sub    $0x4,%esp
    1a75:	50                   	push   %eax
    1a76:	68 31 44 00 00       	push   $0x4431
    1a7b:	6a 01                	push   $0x1
    1a7d:	e8 ee 1f 00 00       	call   3a70 <printf>
        exit();
    1a82:	e8 7b 1e 00 00       	call   3902 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1a87:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a8a:	83 ec 04             	sub    $0x4,%esp
    1a8d:	50                   	push   %eax
    1a8e:	68 18 44 00 00       	push   $0x4418
    1a93:	6a 01                	push   $0x1
    1a95:	e8 d6 1f 00 00       	call   3a70 <printf>
        exit();
    1a9a:	e8 63 1e 00 00       	call   3902 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1a9f:	83 ec 0c             	sub    $0xc,%esp
    1aa2:	50                   	push   %eax
    1aa3:	e8 82 1e 00 00       	call   392a <close>
    1aa8:	83 c4 10             	add    $0x10,%esp
    1aab:	e9 e9 fd ff ff       	jmp    1899 <concreate+0xf9>

00001ab0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1ab0:	55                   	push   %ebp
    1ab1:	89 e5                	mov    %esp,%ebp
    1ab3:	57                   	push   %edi
    1ab4:	56                   	push   %esi
    1ab5:	53                   	push   %ebx
    1ab6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ab9:	68 5c 44 00 00       	push   $0x445c
    1abe:	6a 01                	push   $0x1
    1ac0:	e8 ab 1f 00 00       	call   3a70 <printf>

  unlink("x");
    1ac5:	c7 04 24 e9 46 00 00 	movl   $0x46e9,(%esp)
    1acc:	e8 81 1e 00 00       	call   3952 <unlink>
  pid = fork();
    1ad1:	e8 24 1e 00 00       	call   38fa <fork>
  if(pid < 0){
    1ad6:	83 c4 10             	add    $0x10,%esp
    1ad9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1adb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1ade:	0f 88 b6 00 00 00    	js     1b9a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1ae4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1ae8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1aed:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1af2:	19 ff                	sbb    %edi,%edi
    1af4:	83 e7 60             	and    $0x60,%edi
    1af7:	83 c7 01             	add    $0x1,%edi
    1afa:	eb 1e                	jmp    1b1a <linkunlink+0x6a>
    1afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b00:	83 fa 01             	cmp    $0x1,%edx
    1b03:	74 7b                	je     1b80 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1b05:	83 ec 0c             	sub    $0xc,%esp
    1b08:	68 e9 46 00 00       	push   $0x46e9
    1b0d:	e8 40 1e 00 00       	call   3952 <unlink>
    1b12:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b15:	83 eb 01             	sub    $0x1,%ebx
    1b18:	74 3d                	je     1b57 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b1a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b20:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b26:	89 f8                	mov    %edi,%eax
    1b28:	f7 e6                	mul    %esi
    1b2a:	d1 ea                	shr    %edx
    1b2c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b2f:	89 fa                	mov    %edi,%edx
    1b31:	29 c2                	sub    %eax,%edx
    1b33:	75 cb                	jne    1b00 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b35:	83 ec 08             	sub    $0x8,%esp
    1b38:	68 02 02 00 00       	push   $0x202
    1b3d:	68 e9 46 00 00       	push   $0x46e9
    1b42:	e8 fb 1d 00 00       	call   3942 <open>
    1b47:	89 04 24             	mov    %eax,(%esp)
    1b4a:	e8 db 1d 00 00       	call   392a <close>
    1b4f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b52:	83 eb 01             	sub    $0x1,%ebx
    1b55:	75 c3                	jne    1b1a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b5a:	85 c0                	test   %eax,%eax
    1b5c:	74 50                	je     1bae <linkunlink+0xfe>
    wait();
    1b5e:	e8 a7 1d 00 00       	call   390a <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b63:	83 ec 08             	sub    $0x8,%esp
    1b66:	68 71 44 00 00       	push   $0x4471
    1b6b:	6a 01                	push   $0x1
    1b6d:	e8 fe 1e 00 00       	call   3a70 <printf>
}
    1b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b75:	5b                   	pop    %ebx
    1b76:	5e                   	pop    %esi
    1b77:	5f                   	pop    %edi
    1b78:	5d                   	pop    %ebp
    1b79:	c3                   	ret    
    1b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1b80:	83 ec 08             	sub    $0x8,%esp
    1b83:	68 e9 46 00 00       	push   $0x46e9
    1b88:	68 6d 44 00 00       	push   $0x446d
    1b8d:	e8 d0 1d 00 00       	call   3962 <link>
    1b92:	83 c4 10             	add    $0x10,%esp
    1b95:	e9 7b ff ff ff       	jmp    1b15 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1b9a:	83 ec 08             	sub    $0x8,%esp
    1b9d:	68 d1 4c 00 00       	push   $0x4cd1
    1ba2:	6a 01                	push   $0x1
    1ba4:	e8 c7 1e 00 00       	call   3a70 <printf>
    exit();
    1ba9:	e8 54 1d 00 00       	call   3902 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1bae:	e8 4f 1d 00 00       	call   3902 <exit>
    1bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bc0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	56                   	push   %esi
    1bc4:	53                   	push   %ebx
    1bc5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1bc8:	68 80 44 00 00       	push   $0x4480
    1bcd:	6a 01                	push   $0x1
    1bcf:	e8 9c 1e 00 00       	call   3a70 <printf>
  unlink("bd");
    1bd4:	c7 04 24 8d 44 00 00 	movl   $0x448d,(%esp)
    1bdb:	e8 72 1d 00 00       	call   3952 <unlink>

  fd = open("bd", O_CREATE);
    1be0:	58                   	pop    %eax
    1be1:	5a                   	pop    %edx
    1be2:	68 00 02 00 00       	push   $0x200
    1be7:	68 8d 44 00 00       	push   $0x448d
    1bec:	e8 51 1d 00 00       	call   3942 <open>
  if(fd < 0){
    1bf1:	83 c4 10             	add    $0x10,%esp
    1bf4:	85 c0                	test   %eax,%eax
    1bf6:	0f 88 de 00 00 00    	js     1cda <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1bfc:	83 ec 0c             	sub    $0xc,%esp
    1bff:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1c02:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c04:	50                   	push   %eax
    1c05:	e8 20 1d 00 00       	call   392a <close>
    1c0a:	83 c4 10             	add    $0x10,%esp
    1c0d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c10:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c12:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c15:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c19:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c1c:	56                   	push   %esi
    1c1d:	68 8d 44 00 00       	push   $0x448d
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c22:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c25:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c29:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c2c:	89 d8                	mov    %ebx,%eax
    1c2e:	83 e0 3f             	and    $0x3f,%eax
    1c31:	83 c0 30             	add    $0x30,%eax
    1c34:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c37:	e8 26 1d 00 00       	call   3962 <link>
    1c3c:	83 c4 10             	add    $0x10,%esp
    1c3f:	85 c0                	test   %eax,%eax
    1c41:	75 6f                	jne    1cb2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c43:	83 c3 01             	add    $0x1,%ebx
    1c46:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c4c:	75 c2                	jne    1c10 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c4e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c51:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c53:	68 8d 44 00 00       	push   $0x448d
    1c58:	e8 f5 1c 00 00       	call   3952 <unlink>
    1c5d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c60:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c62:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c65:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c69:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c6c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c6d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c71:	83 c0 30             	add    $0x30,%eax
    1c74:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c77:	89 d8                	mov    %ebx,%eax
    1c79:	83 e0 3f             	and    $0x3f,%eax
    1c7c:	83 c0 30             	add    $0x30,%eax
    1c7f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1c82:	e8 cb 1c 00 00       	call   3952 <unlink>
    1c87:	83 c4 10             	add    $0x10,%esp
    1c8a:	85 c0                	test   %eax,%eax
    1c8c:	75 38                	jne    1cc6 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1c8e:	83 c3 01             	add    $0x1,%ebx
    1c91:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c97:	75 c7                	jne    1c60 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1c99:	83 ec 08             	sub    $0x8,%esp
    1c9c:	68 cf 44 00 00       	push   $0x44cf
    1ca1:	6a 01                	push   $0x1
    1ca3:	e8 c8 1d 00 00       	call   3a70 <printf>
}
    1ca8:	83 c4 10             	add    $0x10,%esp
    1cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1cae:	5b                   	pop    %ebx
    1caf:	5e                   	pop    %esi
    1cb0:	5d                   	pop    %ebp
    1cb1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1cb2:	83 ec 08             	sub    $0x8,%esp
    1cb5:	68 a6 44 00 00       	push   $0x44a6
    1cba:	6a 01                	push   $0x1
    1cbc:	e8 af 1d 00 00       	call   3a70 <printf>
      exit();
    1cc1:	e8 3c 1c 00 00       	call   3902 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1cc6:	83 ec 08             	sub    $0x8,%esp
    1cc9:	68 ba 44 00 00       	push   $0x44ba
    1cce:	6a 01                	push   $0x1
    1cd0:	e8 9b 1d 00 00       	call   3a70 <printf>
      exit();
    1cd5:	e8 28 1c 00 00       	call   3902 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1cda:	83 ec 08             	sub    $0x8,%esp
    1cdd:	68 90 44 00 00       	push   $0x4490
    1ce2:	6a 01                	push   $0x1
    1ce4:	e8 87 1d 00 00       	call   3a70 <printf>
    exit();
    1ce9:	e8 14 1c 00 00       	call   3902 <exit>
    1cee:	66 90                	xchg   %ax,%ax

00001cf0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	53                   	push   %ebx
    1cf4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1cf7:	68 da 44 00 00       	push   $0x44da
    1cfc:	6a 01                	push   $0x1
    1cfe:	e8 6d 1d 00 00       	call   3a70 <printf>

  unlink("ff");
    1d03:	c7 04 24 63 45 00 00 	movl   $0x4563,(%esp)
    1d0a:	e8 43 1c 00 00       	call   3952 <unlink>
  if(mkdir("dd") != 0){
    1d0f:	c7 04 24 00 46 00 00 	movl   $0x4600,(%esp)
    1d16:	e8 4f 1c 00 00       	call   396a <mkdir>
    1d1b:	83 c4 10             	add    $0x10,%esp
    1d1e:	85 c0                	test   %eax,%eax
    1d20:	0f 85 b3 05 00 00    	jne    22d9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d26:	83 ec 08             	sub    $0x8,%esp
    1d29:	68 02 02 00 00       	push   $0x202
    1d2e:	68 39 45 00 00       	push   $0x4539
    1d33:	e8 0a 1c 00 00       	call   3942 <open>
  if(fd < 0){
    1d38:	83 c4 10             	add    $0x10,%esp
    1d3b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d3d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d3f:	0f 88 81 05 00 00    	js     22c6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d45:	83 ec 04             	sub    $0x4,%esp
    1d48:	6a 02                	push   $0x2
    1d4a:	68 63 45 00 00       	push   $0x4563
    1d4f:	50                   	push   %eax
    1d50:	e8 cd 1b 00 00       	call   3922 <write>
  close(fd);
    1d55:	89 1c 24             	mov    %ebx,(%esp)
    1d58:	e8 cd 1b 00 00       	call   392a <close>

  if(unlink("dd") >= 0){
    1d5d:	c7 04 24 00 46 00 00 	movl   $0x4600,(%esp)
    1d64:	e8 e9 1b 00 00       	call   3952 <unlink>
    1d69:	83 c4 10             	add    $0x10,%esp
    1d6c:	85 c0                	test   %eax,%eax
    1d6e:	0f 89 3f 05 00 00    	jns    22b3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1d74:	83 ec 0c             	sub    $0xc,%esp
    1d77:	68 14 45 00 00       	push   $0x4514
    1d7c:	e8 e9 1b 00 00       	call   396a <mkdir>
    1d81:	83 c4 10             	add    $0x10,%esp
    1d84:	85 c0                	test   %eax,%eax
    1d86:	0f 85 14 05 00 00    	jne    22a0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d8c:	83 ec 08             	sub    $0x8,%esp
    1d8f:	68 02 02 00 00       	push   $0x202
    1d94:	68 36 45 00 00       	push   $0x4536
    1d99:	e8 a4 1b 00 00       	call   3942 <open>
  if(fd < 0){
    1d9e:	83 c4 10             	add    $0x10,%esp
    1da1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1da3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1da5:	0f 88 24 04 00 00    	js     21cf <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1dab:	83 ec 04             	sub    $0x4,%esp
    1dae:	6a 02                	push   $0x2
    1db0:	68 57 45 00 00       	push   $0x4557
    1db5:	50                   	push   %eax
    1db6:	e8 67 1b 00 00       	call   3922 <write>
  close(fd);
    1dbb:	89 1c 24             	mov    %ebx,(%esp)
    1dbe:	e8 67 1b 00 00       	call   392a <close>

  fd = open("dd/dd/../ff", 0);
    1dc3:	58                   	pop    %eax
    1dc4:	5a                   	pop    %edx
    1dc5:	6a 00                	push   $0x0
    1dc7:	68 5a 45 00 00       	push   $0x455a
    1dcc:	e8 71 1b 00 00       	call   3942 <open>
  if(fd < 0){
    1dd1:	83 c4 10             	add    $0x10,%esp
    1dd4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1dd6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dd8:	0f 88 de 03 00 00    	js     21bc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1dde:	83 ec 04             	sub    $0x4,%esp
    1de1:	68 00 20 00 00       	push   $0x2000
    1de6:	68 40 86 00 00       	push   $0x8640
    1deb:	50                   	push   %eax
    1dec:	e8 29 1b 00 00       	call   391a <read>
  if(cc != 2 || buf[0] != 'f'){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	83 f8 02             	cmp    $0x2,%eax
    1df7:	0f 85 3a 03 00 00    	jne    2137 <subdir+0x447>
    1dfd:	80 3d 40 86 00 00 66 	cmpb   $0x66,0x8640
    1e04:	0f 85 2d 03 00 00    	jne    2137 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e0a:	83 ec 0c             	sub    $0xc,%esp
    1e0d:	53                   	push   %ebx
    1e0e:	e8 17 1b 00 00       	call   392a <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e13:	5b                   	pop    %ebx
    1e14:	58                   	pop    %eax
    1e15:	68 9a 45 00 00       	push   $0x459a
    1e1a:	68 36 45 00 00       	push   $0x4536
    1e1f:	e8 3e 1b 00 00       	call   3962 <link>
    1e24:	83 c4 10             	add    $0x10,%esp
    1e27:	85 c0                	test   %eax,%eax
    1e29:	0f 85 c6 03 00 00    	jne    21f5 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e2f:	83 ec 0c             	sub    $0xc,%esp
    1e32:	68 36 45 00 00       	push   $0x4536
    1e37:	e8 16 1b 00 00       	call   3952 <unlink>
    1e3c:	83 c4 10             	add    $0x10,%esp
    1e3f:	85 c0                	test   %eax,%eax
    1e41:	0f 85 16 03 00 00    	jne    215d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e47:	83 ec 08             	sub    $0x8,%esp
    1e4a:	6a 00                	push   $0x0
    1e4c:	68 36 45 00 00       	push   $0x4536
    1e51:	e8 ec 1a 00 00       	call   3942 <open>
    1e56:	83 c4 10             	add    $0x10,%esp
    1e59:	85 c0                	test   %eax,%eax
    1e5b:	0f 89 2c 04 00 00    	jns    228d <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1e61:	83 ec 0c             	sub    $0xc,%esp
    1e64:	68 00 46 00 00       	push   $0x4600
    1e69:	e8 04 1b 00 00       	call   3972 <chdir>
    1e6e:	83 c4 10             	add    $0x10,%esp
    1e71:	85 c0                	test   %eax,%eax
    1e73:	0f 85 01 04 00 00    	jne    227a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1e79:	83 ec 0c             	sub    $0xc,%esp
    1e7c:	68 ce 45 00 00       	push   $0x45ce
    1e81:	e8 ec 1a 00 00       	call   3972 <chdir>
    1e86:	83 c4 10             	add    $0x10,%esp
    1e89:	85 c0                	test   %eax,%eax
    1e8b:	0f 85 b9 02 00 00    	jne    214a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1e91:	83 ec 0c             	sub    $0xc,%esp
    1e94:	68 f4 45 00 00       	push   $0x45f4
    1e99:	e8 d4 1a 00 00       	call   3972 <chdir>
    1e9e:	83 c4 10             	add    $0x10,%esp
    1ea1:	85 c0                	test   %eax,%eax
    1ea3:	0f 85 a1 02 00 00    	jne    214a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1ea9:	83 ec 0c             	sub    $0xc,%esp
    1eac:	68 03 46 00 00       	push   $0x4603
    1eb1:	e8 bc 1a 00 00       	call   3972 <chdir>
    1eb6:	83 c4 10             	add    $0x10,%esp
    1eb9:	85 c0                	test   %eax,%eax
    1ebb:	0f 85 21 03 00 00    	jne    21e2 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ec1:	83 ec 08             	sub    $0x8,%esp
    1ec4:	6a 00                	push   $0x0
    1ec6:	68 9a 45 00 00       	push   $0x459a
    1ecb:	e8 72 1a 00 00       	call   3942 <open>
  if(fd < 0){
    1ed0:	83 c4 10             	add    $0x10,%esp
    1ed3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ed5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ed7:	0f 88 e0 04 00 00    	js     23bd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1edd:	83 ec 04             	sub    $0x4,%esp
    1ee0:	68 00 20 00 00       	push   $0x2000
    1ee5:	68 40 86 00 00       	push   $0x8640
    1eea:	50                   	push   %eax
    1eeb:	e8 2a 1a 00 00       	call   391a <read>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	83 f8 02             	cmp    $0x2,%eax
    1ef6:	0f 85 ae 04 00 00    	jne    23aa <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1efc:	83 ec 0c             	sub    $0xc,%esp
    1eff:	53                   	push   %ebx
    1f00:	e8 25 1a 00 00       	call   392a <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f05:	59                   	pop    %ecx
    1f06:	5b                   	pop    %ebx
    1f07:	6a 00                	push   $0x0
    1f09:	68 36 45 00 00       	push   $0x4536
    1f0e:	e8 2f 1a 00 00       	call   3942 <open>
    1f13:	83 c4 10             	add    $0x10,%esp
    1f16:	85 c0                	test   %eax,%eax
    1f18:	0f 89 65 02 00 00    	jns    2183 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f1e:	83 ec 08             	sub    $0x8,%esp
    1f21:	68 02 02 00 00       	push   $0x202
    1f26:	68 4e 46 00 00       	push   $0x464e
    1f2b:	e8 12 1a 00 00       	call   3942 <open>
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	85 c0                	test   %eax,%eax
    1f35:	0f 89 35 02 00 00    	jns    2170 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f3b:	83 ec 08             	sub    $0x8,%esp
    1f3e:	68 02 02 00 00       	push   $0x202
    1f43:	68 73 46 00 00       	push   $0x4673
    1f48:	e8 f5 19 00 00       	call   3942 <open>
    1f4d:	83 c4 10             	add    $0x10,%esp
    1f50:	85 c0                	test   %eax,%eax
    1f52:	0f 89 0f 03 00 00    	jns    2267 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f58:	83 ec 08             	sub    $0x8,%esp
    1f5b:	68 00 02 00 00       	push   $0x200
    1f60:	68 00 46 00 00       	push   $0x4600
    1f65:	e8 d8 19 00 00       	call   3942 <open>
    1f6a:	83 c4 10             	add    $0x10,%esp
    1f6d:	85 c0                	test   %eax,%eax
    1f6f:	0f 89 df 02 00 00    	jns    2254 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1f75:	83 ec 08             	sub    $0x8,%esp
    1f78:	6a 02                	push   $0x2
    1f7a:	68 00 46 00 00       	push   $0x4600
    1f7f:	e8 be 19 00 00       	call   3942 <open>
    1f84:	83 c4 10             	add    $0x10,%esp
    1f87:	85 c0                	test   %eax,%eax
    1f89:	0f 89 b2 02 00 00    	jns    2241 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1f8f:	83 ec 08             	sub    $0x8,%esp
    1f92:	6a 01                	push   $0x1
    1f94:	68 00 46 00 00       	push   $0x4600
    1f99:	e8 a4 19 00 00       	call   3942 <open>
    1f9e:	83 c4 10             	add    $0x10,%esp
    1fa1:	85 c0                	test   %eax,%eax
    1fa3:	0f 89 85 02 00 00    	jns    222e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fa9:	83 ec 08             	sub    $0x8,%esp
    1fac:	68 e2 46 00 00       	push   $0x46e2
    1fb1:	68 4e 46 00 00       	push   $0x464e
    1fb6:	e8 a7 19 00 00       	call   3962 <link>
    1fbb:	83 c4 10             	add    $0x10,%esp
    1fbe:	85 c0                	test   %eax,%eax
    1fc0:	0f 84 55 02 00 00    	je     221b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fc6:	83 ec 08             	sub    $0x8,%esp
    1fc9:	68 e2 46 00 00       	push   $0x46e2
    1fce:	68 73 46 00 00       	push   $0x4673
    1fd3:	e8 8a 19 00 00       	call   3962 <link>
    1fd8:	83 c4 10             	add    $0x10,%esp
    1fdb:	85 c0                	test   %eax,%eax
    1fdd:	0f 84 25 02 00 00    	je     2208 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1fe3:	83 ec 08             	sub    $0x8,%esp
    1fe6:	68 9a 45 00 00       	push   $0x459a
    1feb:	68 39 45 00 00       	push   $0x4539
    1ff0:	e8 6d 19 00 00       	call   3962 <link>
    1ff5:	83 c4 10             	add    $0x10,%esp
    1ff8:	85 c0                	test   %eax,%eax
    1ffa:	0f 84 a9 01 00 00    	je     21a9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2000:	83 ec 0c             	sub    $0xc,%esp
    2003:	68 4e 46 00 00       	push   $0x464e
    2008:	e8 5d 19 00 00       	call   396a <mkdir>
    200d:	83 c4 10             	add    $0x10,%esp
    2010:	85 c0                	test   %eax,%eax
    2012:	0f 84 7e 01 00 00    	je     2196 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2018:	83 ec 0c             	sub    $0xc,%esp
    201b:	68 73 46 00 00       	push   $0x4673
    2020:	e8 45 19 00 00       	call   396a <mkdir>
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	85 c0                	test   %eax,%eax
    202a:	0f 84 67 03 00 00    	je     2397 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	68 9a 45 00 00       	push   $0x459a
    2038:	e8 2d 19 00 00       	call   396a <mkdir>
    203d:	83 c4 10             	add    $0x10,%esp
    2040:	85 c0                	test   %eax,%eax
    2042:	0f 84 3c 03 00 00    	je     2384 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	68 73 46 00 00       	push   $0x4673
    2050:	e8 fd 18 00 00       	call   3952 <unlink>
    2055:	83 c4 10             	add    $0x10,%esp
    2058:	85 c0                	test   %eax,%eax
    205a:	0f 84 11 03 00 00    	je     2371 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2060:	83 ec 0c             	sub    $0xc,%esp
    2063:	68 4e 46 00 00       	push   $0x464e
    2068:	e8 e5 18 00 00       	call   3952 <unlink>
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	85 c0                	test   %eax,%eax
    2072:	0f 84 e6 02 00 00    	je     235e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2078:	83 ec 0c             	sub    $0xc,%esp
    207b:	68 39 45 00 00       	push   $0x4539
    2080:	e8 ed 18 00 00       	call   3972 <chdir>
    2085:	83 c4 10             	add    $0x10,%esp
    2088:	85 c0                	test   %eax,%eax
    208a:	0f 84 bb 02 00 00    	je     234b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    2090:	83 ec 0c             	sub    $0xc,%esp
    2093:	68 e5 46 00 00       	push   $0x46e5
    2098:	e8 d5 18 00 00       	call   3972 <chdir>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	85 c0                	test   %eax,%eax
    20a2:	0f 84 90 02 00 00    	je     2338 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    20a8:	83 ec 0c             	sub    $0xc,%esp
    20ab:	68 9a 45 00 00       	push   $0x459a
    20b0:	e8 9d 18 00 00       	call   3952 <unlink>
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	85 c0                	test   %eax,%eax
    20ba:	0f 85 9d 00 00 00    	jne    215d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    20c0:	83 ec 0c             	sub    $0xc,%esp
    20c3:	68 39 45 00 00       	push   $0x4539
    20c8:	e8 85 18 00 00       	call   3952 <unlink>
    20cd:	83 c4 10             	add    $0x10,%esp
    20d0:	85 c0                	test   %eax,%eax
    20d2:	0f 85 4d 02 00 00    	jne    2325 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    20d8:	83 ec 0c             	sub    $0xc,%esp
    20db:	68 00 46 00 00       	push   $0x4600
    20e0:	e8 6d 18 00 00       	call   3952 <unlink>
    20e5:	83 c4 10             	add    $0x10,%esp
    20e8:	85 c0                	test   %eax,%eax
    20ea:	0f 84 22 02 00 00    	je     2312 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	68 15 45 00 00       	push   $0x4515
    20f8:	e8 55 18 00 00       	call   3952 <unlink>
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	85 c0                	test   %eax,%eax
    2102:	0f 88 f7 01 00 00    	js     22ff <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2108:	83 ec 0c             	sub    $0xc,%esp
    210b:	68 00 46 00 00       	push   $0x4600
    2110:	e8 3d 18 00 00       	call   3952 <unlink>
    2115:	83 c4 10             	add    $0x10,%esp
    2118:	85 c0                	test   %eax,%eax
    211a:	0f 88 cc 01 00 00    	js     22ec <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2120:	83 ec 08             	sub    $0x8,%esp
    2123:	68 e2 47 00 00       	push   $0x47e2
    2128:	6a 01                	push   $0x1
    212a:	e8 41 19 00 00       	call   3a70 <printf>
}
    212f:	83 c4 10             	add    $0x10,%esp
    2132:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2135:	c9                   	leave  
    2136:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2137:	50                   	push   %eax
    2138:	50                   	push   %eax
    2139:	68 7f 45 00 00       	push   $0x457f
    213e:	6a 01                	push   $0x1
    2140:	e8 2b 19 00 00       	call   3a70 <printf>
    exit();
    2145:	e8 b8 17 00 00       	call   3902 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    214a:	50                   	push   %eax
    214b:	50                   	push   %eax
    214c:	68 da 45 00 00       	push   $0x45da
    2151:	6a 01                	push   $0x1
    2153:	e8 18 19 00 00       	call   3a70 <printf>
    exit();
    2158:	e8 a5 17 00 00       	call   3902 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    215d:	52                   	push   %edx
    215e:	52                   	push   %edx
    215f:	68 a5 45 00 00       	push   $0x45a5
    2164:	6a 01                	push   $0x1
    2166:	e8 05 19 00 00       	call   3a70 <printf>
    exit();
    216b:	e8 92 17 00 00       	call   3902 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2170:	50                   	push   %eax
    2171:	50                   	push   %eax
    2172:	68 57 46 00 00       	push   $0x4657
    2177:	6a 01                	push   $0x1
    2179:	e8 f2 18 00 00       	call   3a70 <printf>
    exit();
    217e:	e8 7f 17 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2183:	52                   	push   %edx
    2184:	52                   	push   %edx
    2185:	68 3c 50 00 00       	push   $0x503c
    218a:	6a 01                	push   $0x1
    218c:	e8 df 18 00 00       	call   3a70 <printf>
    exit();
    2191:	e8 6c 17 00 00       	call   3902 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2196:	52                   	push   %edx
    2197:	52                   	push   %edx
    2198:	68 eb 46 00 00       	push   $0x46eb
    219d:	6a 01                	push   $0x1
    219f:	e8 cc 18 00 00       	call   3a70 <printf>
    exit();
    21a4:	e8 59 17 00 00       	call   3902 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21a9:	51                   	push   %ecx
    21aa:	51                   	push   %ecx
    21ab:	68 ac 50 00 00       	push   $0x50ac
    21b0:	6a 01                	push   $0x1
    21b2:	e8 b9 18 00 00       	call   3a70 <printf>
    exit();
    21b7:	e8 46 17 00 00       	call   3902 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21bc:	50                   	push   %eax
    21bd:	50                   	push   %eax
    21be:	68 66 45 00 00       	push   $0x4566
    21c3:	6a 01                	push   $0x1
    21c5:	e8 a6 18 00 00       	call   3a70 <printf>
    exit();
    21ca:	e8 33 17 00 00       	call   3902 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    21cf:	51                   	push   %ecx
    21d0:	51                   	push   %ecx
    21d1:	68 3f 45 00 00       	push   $0x453f
    21d6:	6a 01                	push   $0x1
    21d8:	e8 93 18 00 00       	call   3a70 <printf>
    exit();
    21dd:	e8 20 17 00 00       	call   3902 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    21e2:	50                   	push   %eax
    21e3:	50                   	push   %eax
    21e4:	68 08 46 00 00       	push   $0x4608
    21e9:	6a 01                	push   $0x1
    21eb:	e8 80 18 00 00       	call   3a70 <printf>
    exit();
    21f0:	e8 0d 17 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    21f5:	51                   	push   %ecx
    21f6:	51                   	push   %ecx
    21f7:	68 f4 4f 00 00       	push   $0x4ff4
    21fc:	6a 01                	push   $0x1
    21fe:	e8 6d 18 00 00       	call   3a70 <printf>
    exit();
    2203:	e8 fa 16 00 00       	call   3902 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2208:	53                   	push   %ebx
    2209:	53                   	push   %ebx
    220a:	68 88 50 00 00       	push   $0x5088
    220f:	6a 01                	push   $0x1
    2211:	e8 5a 18 00 00       	call   3a70 <printf>
    exit();
    2216:	e8 e7 16 00 00       	call   3902 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    221b:	50                   	push   %eax
    221c:	50                   	push   %eax
    221d:	68 64 50 00 00       	push   $0x5064
    2222:	6a 01                	push   $0x1
    2224:	e8 47 18 00 00       	call   3a70 <printf>
    exit();
    2229:	e8 d4 16 00 00       	call   3902 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    222e:	50                   	push   %eax
    222f:	50                   	push   %eax
    2230:	68 c7 46 00 00       	push   $0x46c7
    2235:	6a 01                	push   $0x1
    2237:	e8 34 18 00 00       	call   3a70 <printf>
    exit();
    223c:	e8 c1 16 00 00       	call   3902 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2241:	50                   	push   %eax
    2242:	50                   	push   %eax
    2243:	68 ae 46 00 00       	push   $0x46ae
    2248:	6a 01                	push   $0x1
    224a:	e8 21 18 00 00       	call   3a70 <printf>
    exit();
    224f:	e8 ae 16 00 00       	call   3902 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2254:	50                   	push   %eax
    2255:	50                   	push   %eax
    2256:	68 98 46 00 00       	push   $0x4698
    225b:	6a 01                	push   $0x1
    225d:	e8 0e 18 00 00       	call   3a70 <printf>
    exit();
    2262:	e8 9b 16 00 00       	call   3902 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2267:	50                   	push   %eax
    2268:	50                   	push   %eax
    2269:	68 7c 46 00 00       	push   $0x467c
    226e:	6a 01                	push   $0x1
    2270:	e8 fb 17 00 00       	call   3a70 <printf>
    exit();
    2275:	e8 88 16 00 00       	call   3902 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    227a:	50                   	push   %eax
    227b:	50                   	push   %eax
    227c:	68 bd 45 00 00       	push   $0x45bd
    2281:	6a 01                	push   $0x1
    2283:	e8 e8 17 00 00       	call   3a70 <printf>
    exit();
    2288:	e8 75 16 00 00       	call   3902 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    228d:	50                   	push   %eax
    228e:	50                   	push   %eax
    228f:	68 18 50 00 00       	push   $0x5018
    2294:	6a 01                	push   $0x1
    2296:	e8 d5 17 00 00       	call   3a70 <printf>
    exit();
    229b:	e8 62 16 00 00       	call   3902 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    22a0:	53                   	push   %ebx
    22a1:	53                   	push   %ebx
    22a2:	68 1b 45 00 00       	push   $0x451b
    22a7:	6a 01                	push   $0x1
    22a9:	e8 c2 17 00 00       	call   3a70 <printf>
    exit();
    22ae:	e8 4f 16 00 00       	call   3902 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22b3:	50                   	push   %eax
    22b4:	50                   	push   %eax
    22b5:	68 cc 4f 00 00       	push   $0x4fcc
    22ba:	6a 01                	push   $0x1
    22bc:	e8 af 17 00 00       	call   3a70 <printf>
    exit();
    22c1:	e8 3c 16 00 00       	call   3902 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    22c6:	50                   	push   %eax
    22c7:	50                   	push   %eax
    22c8:	68 ff 44 00 00       	push   $0x44ff
    22cd:	6a 01                	push   $0x1
    22cf:	e8 9c 17 00 00       	call   3a70 <printf>
    exit();
    22d4:	e8 29 16 00 00       	call   3902 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    22d9:	50                   	push   %eax
    22da:	50                   	push   %eax
    22db:	68 e7 44 00 00       	push   $0x44e7
    22e0:	6a 01                	push   $0x1
    22e2:	e8 89 17 00 00       	call   3a70 <printf>
    exit();
    22e7:	e8 16 16 00 00       	call   3902 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    22ec:	50                   	push   %eax
    22ed:	50                   	push   %eax
    22ee:	68 d0 47 00 00       	push   $0x47d0
    22f3:	6a 01                	push   $0x1
    22f5:	e8 76 17 00 00       	call   3a70 <printf>
    exit();
    22fa:	e8 03 16 00 00       	call   3902 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    22ff:	52                   	push   %edx
    2300:	52                   	push   %edx
    2301:	68 bb 47 00 00       	push   $0x47bb
    2306:	6a 01                	push   $0x1
    2308:	e8 63 17 00 00       	call   3a70 <printf>
    exit();
    230d:	e8 f0 15 00 00       	call   3902 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2312:	51                   	push   %ecx
    2313:	51                   	push   %ecx
    2314:	68 d0 50 00 00       	push   $0x50d0
    2319:	6a 01                	push   $0x1
    231b:	e8 50 17 00 00       	call   3a70 <printf>
    exit();
    2320:	e8 dd 15 00 00       	call   3902 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2325:	53                   	push   %ebx
    2326:	53                   	push   %ebx
    2327:	68 a6 47 00 00       	push   $0x47a6
    232c:	6a 01                	push   $0x1
    232e:	e8 3d 17 00 00       	call   3a70 <printf>
    exit();
    2333:	e8 ca 15 00 00       	call   3902 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2338:	50                   	push   %eax
    2339:	50                   	push   %eax
    233a:	68 8e 47 00 00       	push   $0x478e
    233f:	6a 01                	push   $0x1
    2341:	e8 2a 17 00 00       	call   3a70 <printf>
    exit();
    2346:	e8 b7 15 00 00       	call   3902 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    234b:	50                   	push   %eax
    234c:	50                   	push   %eax
    234d:	68 76 47 00 00       	push   $0x4776
    2352:	6a 01                	push   $0x1
    2354:	e8 17 17 00 00       	call   3a70 <printf>
    exit();
    2359:	e8 a4 15 00 00       	call   3902 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    235e:	50                   	push   %eax
    235f:	50                   	push   %eax
    2360:	68 5a 47 00 00       	push   $0x475a
    2365:	6a 01                	push   $0x1
    2367:	e8 04 17 00 00       	call   3a70 <printf>
    exit();
    236c:	e8 91 15 00 00       	call   3902 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2371:	50                   	push   %eax
    2372:	50                   	push   %eax
    2373:	68 3e 47 00 00       	push   $0x473e
    2378:	6a 01                	push   $0x1
    237a:	e8 f1 16 00 00       	call   3a70 <printf>
    exit();
    237f:	e8 7e 15 00 00       	call   3902 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2384:	50                   	push   %eax
    2385:	50                   	push   %eax
    2386:	68 21 47 00 00       	push   $0x4721
    238b:	6a 01                	push   $0x1
    238d:	e8 de 16 00 00       	call   3a70 <printf>
    exit();
    2392:	e8 6b 15 00 00       	call   3902 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2397:	50                   	push   %eax
    2398:	50                   	push   %eax
    2399:	68 06 47 00 00       	push   $0x4706
    239e:	6a 01                	push   $0x1
    23a0:	e8 cb 16 00 00       	call   3a70 <printf>
    exit();
    23a5:	e8 58 15 00 00       	call   3902 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    23aa:	50                   	push   %eax
    23ab:	50                   	push   %eax
    23ac:	68 33 46 00 00       	push   $0x4633
    23b1:	6a 01                	push   $0x1
    23b3:	e8 b8 16 00 00       	call   3a70 <printf>
    exit();
    23b8:	e8 45 15 00 00       	call   3902 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23bd:	50                   	push   %eax
    23be:	50                   	push   %eax
    23bf:	68 1b 46 00 00       	push   $0x461b
    23c4:	6a 01                	push   $0x1
    23c6:	e8 a5 16 00 00       	call   3a70 <printf>
    exit();
    23cb:	e8 32 15 00 00       	call   3902 <exit>

000023d0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    23d0:	55                   	push   %ebp
    23d1:	89 e5                	mov    %esp,%ebp
    23d3:	56                   	push   %esi
    23d4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    23d5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    23da:	83 ec 08             	sub    $0x8,%esp
    23dd:	68 ed 47 00 00       	push   $0x47ed
    23e2:	6a 01                	push   $0x1
    23e4:	e8 87 16 00 00       	call   3a70 <printf>

  unlink("bigwrite");
    23e9:	c7 04 24 fc 47 00 00 	movl   $0x47fc,(%esp)
    23f0:	e8 5d 15 00 00       	call   3952 <unlink>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	90                   	nop
    23f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2400:	83 ec 08             	sub    $0x8,%esp
    2403:	68 02 02 00 00       	push   $0x202
    2408:	68 fc 47 00 00       	push   $0x47fc
    240d:	e8 30 15 00 00       	call   3942 <open>
    if(fd < 0){
    2412:	83 c4 10             	add    $0x10,%esp
    2415:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2417:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2419:	78 7e                	js     2499 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    241b:	83 ec 04             	sub    $0x4,%esp
    241e:	53                   	push   %ebx
    241f:	68 40 86 00 00       	push   $0x8640
    2424:	50                   	push   %eax
    2425:	e8 f8 14 00 00       	call   3922 <write>
      if(cc != sz){
    242a:	83 c4 10             	add    $0x10,%esp
    242d:	39 c3                	cmp    %eax,%ebx
    242f:	75 55                	jne    2486 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2431:	83 ec 04             	sub    $0x4,%esp
    2434:	53                   	push   %ebx
    2435:	68 40 86 00 00       	push   $0x8640
    243a:	56                   	push   %esi
    243b:	e8 e2 14 00 00       	call   3922 <write>
      if(cc != sz){
    2440:	83 c4 10             	add    $0x10,%esp
    2443:	39 c3                	cmp    %eax,%ebx
    2445:	75 3f                	jne    2486 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2447:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    244a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2450:	56                   	push   %esi
    2451:	e8 d4 14 00 00       	call   392a <close>
    unlink("bigwrite");
    2456:	c7 04 24 fc 47 00 00 	movl   $0x47fc,(%esp)
    245d:	e8 f0 14 00 00       	call   3952 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2462:	83 c4 10             	add    $0x10,%esp
    2465:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    246b:	75 93                	jne    2400 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    246d:	83 ec 08             	sub    $0x8,%esp
    2470:	68 2f 48 00 00       	push   $0x482f
    2475:	6a 01                	push   $0x1
    2477:	e8 f4 15 00 00       	call   3a70 <printf>
}
    247c:	83 c4 10             	add    $0x10,%esp
    247f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2482:	5b                   	pop    %ebx
    2483:	5e                   	pop    %esi
    2484:	5d                   	pop    %ebp
    2485:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2486:	50                   	push   %eax
    2487:	53                   	push   %ebx
    2488:	68 1d 48 00 00       	push   $0x481d
    248d:	6a 01                	push   $0x1
    248f:	e8 dc 15 00 00       	call   3a70 <printf>
        exit();
    2494:	e8 69 14 00 00       	call   3902 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2499:	83 ec 08             	sub    $0x8,%esp
    249c:	68 05 48 00 00       	push   $0x4805
    24a1:	6a 01                	push   $0x1
    24a3:	e8 c8 15 00 00       	call   3a70 <printf>
      exit();
    24a8:	e8 55 14 00 00       	call   3902 <exit>
    24ad:	8d 76 00             	lea    0x0(%esi),%esi

000024b0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24b0:	55                   	push   %ebp
    24b1:	89 e5                	mov    %esp,%ebp
    24b3:	57                   	push   %edi
    24b4:	56                   	push   %esi
    24b5:	53                   	push   %ebx
    24b6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24b9:	68 3c 48 00 00       	push   $0x483c
    24be:	6a 01                	push   $0x1
    24c0:	e8 ab 15 00 00       	call   3a70 <printf>

  unlink("bigfile");
    24c5:	c7 04 24 58 48 00 00 	movl   $0x4858,(%esp)
    24cc:	e8 81 14 00 00       	call   3952 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24d1:	5e                   	pop    %esi
    24d2:	5f                   	pop    %edi
    24d3:	68 02 02 00 00       	push   $0x202
    24d8:	68 58 48 00 00       	push   $0x4858
    24dd:	e8 60 14 00 00       	call   3942 <open>
  if(fd < 0){
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	85 c0                	test   %eax,%eax
    24e7:	0f 88 5f 01 00 00    	js     264c <bigfile+0x19c>
    24ed:	89 c6                	mov    %eax,%esi
    24ef:	31 db                	xor    %ebx,%ebx
    24f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    24f8:	83 ec 04             	sub    $0x4,%esp
    24fb:	68 58 02 00 00       	push   $0x258
    2500:	53                   	push   %ebx
    2501:	68 40 86 00 00       	push   $0x8640
    2506:	e8 65 12 00 00       	call   3770 <memset>
    if(write(fd, buf, 600) != 600){
    250b:	83 c4 0c             	add    $0xc,%esp
    250e:	68 58 02 00 00       	push   $0x258
    2513:	68 40 86 00 00       	push   $0x8640
    2518:	56                   	push   %esi
    2519:	e8 04 14 00 00       	call   3922 <write>
    251e:	83 c4 10             	add    $0x10,%esp
    2521:	3d 58 02 00 00       	cmp    $0x258,%eax
    2526:	0f 85 f8 00 00 00    	jne    2624 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    252c:	83 c3 01             	add    $0x1,%ebx
    252f:	83 fb 14             	cmp    $0x14,%ebx
    2532:	75 c4                	jne    24f8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2534:	83 ec 0c             	sub    $0xc,%esp
    2537:	56                   	push   %esi
    2538:	e8 ed 13 00 00       	call   392a <close>

  fd = open("bigfile", 0);
    253d:	59                   	pop    %ecx
    253e:	5b                   	pop    %ebx
    253f:	6a 00                	push   $0x0
    2541:	68 58 48 00 00       	push   $0x4858
    2546:	e8 f7 13 00 00       	call   3942 <open>
  if(fd < 0){
    254b:	83 c4 10             	add    $0x10,%esp
    254e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2550:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2552:	0f 88 e0 00 00 00    	js     2638 <bigfile+0x188>
    2558:	31 db                	xor    %ebx,%ebx
    255a:	31 ff                	xor    %edi,%edi
    255c:	eb 30                	jmp    258e <bigfile+0xde>
    255e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2560:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2565:	0f 85 91 00 00 00    	jne    25fc <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    256b:	0f be 05 40 86 00 00 	movsbl 0x8640,%eax
    2572:	89 fa                	mov    %edi,%edx
    2574:	d1 fa                	sar    %edx
    2576:	39 d0                	cmp    %edx,%eax
    2578:	75 6e                	jne    25e8 <bigfile+0x138>
    257a:	0f be 15 6b 87 00 00 	movsbl 0x876b,%edx
    2581:	39 d0                	cmp    %edx,%eax
    2583:	75 63                	jne    25e8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2585:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    258b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    258e:	83 ec 04             	sub    $0x4,%esp
    2591:	68 2c 01 00 00       	push   $0x12c
    2596:	68 40 86 00 00       	push   $0x8640
    259b:	56                   	push   %esi
    259c:	e8 79 13 00 00       	call   391a <read>
    if(cc < 0){
    25a1:	83 c4 10             	add    $0x10,%esp
    25a4:	85 c0                	test   %eax,%eax
    25a6:	78 68                	js     2610 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    25a8:	75 b6                	jne    2560 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25aa:	83 ec 0c             	sub    $0xc,%esp
    25ad:	56                   	push   %esi
    25ae:	e8 77 13 00 00       	call   392a <close>
  if(total != 20*600){
    25b3:	83 c4 10             	add    $0x10,%esp
    25b6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25bc:	0f 85 9e 00 00 00    	jne    2660 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    25c2:	83 ec 0c             	sub    $0xc,%esp
    25c5:	68 58 48 00 00       	push   $0x4858
    25ca:	e8 83 13 00 00       	call   3952 <unlink>

  printf(1, "bigfile test ok\n");
    25cf:	58                   	pop    %eax
    25d0:	5a                   	pop    %edx
    25d1:	68 e7 48 00 00       	push   $0x48e7
    25d6:	6a 01                	push   $0x1
    25d8:	e8 93 14 00 00       	call   3a70 <printf>
}
    25dd:	83 c4 10             	add    $0x10,%esp
    25e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    25e3:	5b                   	pop    %ebx
    25e4:	5e                   	pop    %esi
    25e5:	5f                   	pop    %edi
    25e6:	5d                   	pop    %ebp
    25e7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    25e8:	83 ec 08             	sub    $0x8,%esp
    25eb:	68 b4 48 00 00       	push   $0x48b4
    25f0:	6a 01                	push   $0x1
    25f2:	e8 79 14 00 00       	call   3a70 <printf>
      exit();
    25f7:	e8 06 13 00 00       	call   3902 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    25fc:	83 ec 08             	sub    $0x8,%esp
    25ff:	68 a0 48 00 00       	push   $0x48a0
    2604:	6a 01                	push   $0x1
    2606:	e8 65 14 00 00       	call   3a70 <printf>
      exit();
    260b:	e8 f2 12 00 00       	call   3902 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2610:	83 ec 08             	sub    $0x8,%esp
    2613:	68 8b 48 00 00       	push   $0x488b
    2618:	6a 01                	push   $0x1
    261a:	e8 51 14 00 00       	call   3a70 <printf>
      exit();
    261f:	e8 de 12 00 00       	call   3902 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2624:	83 ec 08             	sub    $0x8,%esp
    2627:	68 60 48 00 00       	push   $0x4860
    262c:	6a 01                	push   $0x1
    262e:	e8 3d 14 00 00       	call   3a70 <printf>
      exit();
    2633:	e8 ca 12 00 00       	call   3902 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2638:	83 ec 08             	sub    $0x8,%esp
    263b:	68 76 48 00 00       	push   $0x4876
    2640:	6a 01                	push   $0x1
    2642:	e8 29 14 00 00       	call   3a70 <printf>
    exit();
    2647:	e8 b6 12 00 00       	call   3902 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    264c:	83 ec 08             	sub    $0x8,%esp
    264f:	68 4a 48 00 00       	push   $0x484a
    2654:	6a 01                	push   $0x1
    2656:	e8 15 14 00 00       	call   3a70 <printf>
    exit();
    265b:	e8 a2 12 00 00       	call   3902 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2660:	83 ec 08             	sub    $0x8,%esp
    2663:	68 cd 48 00 00       	push   $0x48cd
    2668:	6a 01                	push   $0x1
    266a:	e8 01 14 00 00       	call   3a70 <printf>
    exit();
    266f:	e8 8e 12 00 00       	call   3902 <exit>
    2674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    267a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002680 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2680:	55                   	push   %ebp
    2681:	89 e5                	mov    %esp,%ebp
    2683:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2686:	68 f8 48 00 00       	push   $0x48f8
    268b:	6a 01                	push   $0x1
    268d:	e8 de 13 00 00       	call   3a70 <printf>

  if(mkdir("12345678901234") != 0){
    2692:	c7 04 24 33 49 00 00 	movl   $0x4933,(%esp)
    2699:	e8 cc 12 00 00       	call   396a <mkdir>
    269e:	83 c4 10             	add    $0x10,%esp
    26a1:	85 c0                	test   %eax,%eax
    26a3:	0f 85 97 00 00 00    	jne    2740 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26a9:	83 ec 0c             	sub    $0xc,%esp
    26ac:	68 f0 50 00 00       	push   $0x50f0
    26b1:	e8 b4 12 00 00       	call   396a <mkdir>
    26b6:	83 c4 10             	add    $0x10,%esp
    26b9:	85 c0                	test   %eax,%eax
    26bb:	0f 85 de 00 00 00    	jne    279f <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26c1:	83 ec 08             	sub    $0x8,%esp
    26c4:	68 00 02 00 00       	push   $0x200
    26c9:	68 40 51 00 00       	push   $0x5140
    26ce:	e8 6f 12 00 00       	call   3942 <open>
  if(fd < 0){
    26d3:	83 c4 10             	add    $0x10,%esp
    26d6:	85 c0                	test   %eax,%eax
    26d8:	0f 88 ae 00 00 00    	js     278c <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    26de:	83 ec 0c             	sub    $0xc,%esp
    26e1:	50                   	push   %eax
    26e2:	e8 43 12 00 00       	call   392a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    26e7:	58                   	pop    %eax
    26e8:	5a                   	pop    %edx
    26e9:	6a 00                	push   $0x0
    26eb:	68 b0 51 00 00       	push   $0x51b0
    26f0:	e8 4d 12 00 00       	call   3942 <open>
  if(fd < 0){
    26f5:	83 c4 10             	add    $0x10,%esp
    26f8:	85 c0                	test   %eax,%eax
    26fa:	78 7d                	js     2779 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    26fc:	83 ec 0c             	sub    $0xc,%esp
    26ff:	50                   	push   %eax
    2700:	e8 25 12 00 00       	call   392a <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2705:	c7 04 24 24 49 00 00 	movl   $0x4924,(%esp)
    270c:	e8 59 12 00 00       	call   396a <mkdir>
    2711:	83 c4 10             	add    $0x10,%esp
    2714:	85 c0                	test   %eax,%eax
    2716:	74 4e                	je     2766 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2718:	83 ec 0c             	sub    $0xc,%esp
    271b:	68 4c 52 00 00       	push   $0x524c
    2720:	e8 45 12 00 00       	call   396a <mkdir>
    2725:	83 c4 10             	add    $0x10,%esp
    2728:	85 c0                	test   %eax,%eax
    272a:	74 27                	je     2753 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    272c:	83 ec 08             	sub    $0x8,%esp
    272f:	68 42 49 00 00       	push   $0x4942
    2734:	6a 01                	push   $0x1
    2736:	e8 35 13 00 00       	call   3a70 <printf>
}
    273b:	83 c4 10             	add    $0x10,%esp
    273e:	c9                   	leave  
    273f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2740:	50                   	push   %eax
    2741:	50                   	push   %eax
    2742:	68 07 49 00 00       	push   $0x4907
    2747:	6a 01                	push   $0x1
    2749:	e8 22 13 00 00       	call   3a70 <printf>
    exit();
    274e:	e8 af 11 00 00       	call   3902 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2753:	50                   	push   %eax
    2754:	50                   	push   %eax
    2755:	68 6c 52 00 00       	push   $0x526c
    275a:	6a 01                	push   $0x1
    275c:	e8 0f 13 00 00       	call   3a70 <printf>
    exit();
    2761:	e8 9c 11 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2766:	52                   	push   %edx
    2767:	52                   	push   %edx
    2768:	68 1c 52 00 00       	push   $0x521c
    276d:	6a 01                	push   $0x1
    276f:	e8 fc 12 00 00       	call   3a70 <printf>
    exit();
    2774:	e8 89 11 00 00       	call   3902 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2779:	51                   	push   %ecx
    277a:	51                   	push   %ecx
    277b:	68 e0 51 00 00       	push   $0x51e0
    2780:	6a 01                	push   $0x1
    2782:	e8 e9 12 00 00       	call   3a70 <printf>
    exit();
    2787:	e8 76 11 00 00       	call   3902 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    278c:	51                   	push   %ecx
    278d:	51                   	push   %ecx
    278e:	68 70 51 00 00       	push   $0x5170
    2793:	6a 01                	push   $0x1
    2795:	e8 d6 12 00 00       	call   3a70 <printf>
    exit();
    279a:	e8 63 11 00 00       	call   3902 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    279f:	50                   	push   %eax
    27a0:	50                   	push   %eax
    27a1:	68 10 51 00 00       	push   $0x5110
    27a6:	6a 01                	push   $0x1
    27a8:	e8 c3 12 00 00       	call   3a70 <printf>
    exit();
    27ad:	e8 50 11 00 00       	call   3902 <exit>
    27b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027c0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    27c0:	55                   	push   %ebp
    27c1:	89 e5                	mov    %esp,%ebp
    27c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27c6:	68 4f 49 00 00       	push   $0x494f
    27cb:	6a 01                	push   $0x1
    27cd:	e8 9e 12 00 00       	call   3a70 <printf>
  if(mkdir("dots") != 0){
    27d2:	c7 04 24 5b 49 00 00 	movl   $0x495b,(%esp)
    27d9:	e8 8c 11 00 00       	call   396a <mkdir>
    27de:	83 c4 10             	add    $0x10,%esp
    27e1:	85 c0                	test   %eax,%eax
    27e3:	0f 85 b0 00 00 00    	jne    2899 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	68 5b 49 00 00       	push   $0x495b
    27f1:	e8 7c 11 00 00       	call   3972 <chdir>
    27f6:	83 c4 10             	add    $0x10,%esp
    27f9:	85 c0                	test   %eax,%eax
    27fb:	0f 85 1d 01 00 00    	jne    291e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2801:	83 ec 0c             	sub    $0xc,%esp
    2804:	68 06 46 00 00       	push   $0x4606
    2809:	e8 44 11 00 00       	call   3952 <unlink>
    280e:	83 c4 10             	add    $0x10,%esp
    2811:	85 c0                	test   %eax,%eax
    2813:	0f 84 f2 00 00 00    	je     290b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2819:	83 ec 0c             	sub    $0xc,%esp
    281c:	68 05 46 00 00       	push   $0x4605
    2821:	e8 2c 11 00 00       	call   3952 <unlink>
    2826:	83 c4 10             	add    $0x10,%esp
    2829:	85 c0                	test   %eax,%eax
    282b:	0f 84 c7 00 00 00    	je     28f8 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2831:	83 ec 0c             	sub    $0xc,%esp
    2834:	68 d9 3d 00 00       	push   $0x3dd9
    2839:	e8 34 11 00 00       	call   3972 <chdir>
    283e:	83 c4 10             	add    $0x10,%esp
    2841:	85 c0                	test   %eax,%eax
    2843:	0f 85 9c 00 00 00    	jne    28e5 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2849:	83 ec 0c             	sub    $0xc,%esp
    284c:	68 a3 49 00 00       	push   $0x49a3
    2851:	e8 fc 10 00 00       	call   3952 <unlink>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	85 c0                	test   %eax,%eax
    285b:	74 75                	je     28d2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    285d:	83 ec 0c             	sub    $0xc,%esp
    2860:	68 c1 49 00 00       	push   $0x49c1
    2865:	e8 e8 10 00 00       	call   3952 <unlink>
    286a:	83 c4 10             	add    $0x10,%esp
    286d:	85 c0                	test   %eax,%eax
    286f:	74 4e                	je     28bf <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 5b 49 00 00       	push   $0x495b
    2879:	e8 d4 10 00 00       	call   3952 <unlink>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	75 27                	jne    28ac <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2885:	83 ec 08             	sub    $0x8,%esp
    2888:	68 f6 49 00 00       	push   $0x49f6
    288d:	6a 01                	push   $0x1
    288f:	e8 dc 11 00 00       	call   3a70 <printf>
}
    2894:	83 c4 10             	add    $0x10,%esp
    2897:	c9                   	leave  
    2898:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2899:	50                   	push   %eax
    289a:	50                   	push   %eax
    289b:	68 60 49 00 00       	push   $0x4960
    28a0:	6a 01                	push   $0x1
    28a2:	e8 c9 11 00 00       	call   3a70 <printf>
    exit();
    28a7:	e8 56 10 00 00       	call   3902 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    28ac:	50                   	push   %eax
    28ad:	50                   	push   %eax
    28ae:	68 e1 49 00 00       	push   $0x49e1
    28b3:	6a 01                	push   $0x1
    28b5:	e8 b6 11 00 00       	call   3a70 <printf>
    exit();
    28ba:	e8 43 10 00 00       	call   3902 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28bf:	52                   	push   %edx
    28c0:	52                   	push   %edx
    28c1:	68 c9 49 00 00       	push   $0x49c9
    28c6:	6a 01                	push   $0x1
    28c8:	e8 a3 11 00 00       	call   3a70 <printf>
    exit();
    28cd:	e8 30 10 00 00       	call   3902 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    28d2:	51                   	push   %ecx
    28d3:	51                   	push   %ecx
    28d4:	68 aa 49 00 00       	push   $0x49aa
    28d9:	6a 01                	push   $0x1
    28db:	e8 90 11 00 00       	call   3a70 <printf>
    exit();
    28e0:	e8 1d 10 00 00       	call   3902 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    28e5:	50                   	push   %eax
    28e6:	50                   	push   %eax
    28e7:	68 db 3d 00 00       	push   $0x3ddb
    28ec:	6a 01                	push   $0x1
    28ee:	e8 7d 11 00 00       	call   3a70 <printf>
    exit();
    28f3:	e8 0a 10 00 00       	call   3902 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    28f8:	50                   	push   %eax
    28f9:	50                   	push   %eax
    28fa:	68 94 49 00 00       	push   $0x4994
    28ff:	6a 01                	push   $0x1
    2901:	e8 6a 11 00 00       	call   3a70 <printf>
    exit();
    2906:	e8 f7 0f 00 00       	call   3902 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    290b:	50                   	push   %eax
    290c:	50                   	push   %eax
    290d:	68 86 49 00 00       	push   $0x4986
    2912:	6a 01                	push   $0x1
    2914:	e8 57 11 00 00       	call   3a70 <printf>
    exit();
    2919:	e8 e4 0f 00 00       	call   3902 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    291e:	50                   	push   %eax
    291f:	50                   	push   %eax
    2920:	68 73 49 00 00       	push   $0x4973
    2925:	6a 01                	push   $0x1
    2927:	e8 44 11 00 00       	call   3a70 <printf>
    exit();
    292c:	e8 d1 0f 00 00       	call   3902 <exit>
    2931:	eb 0d                	jmp    2940 <dirfile>
    2933:	90                   	nop
    2934:	90                   	nop
    2935:	90                   	nop
    2936:	90                   	nop
    2937:	90                   	nop
    2938:	90                   	nop
    2939:	90                   	nop
    293a:	90                   	nop
    293b:	90                   	nop
    293c:	90                   	nop
    293d:	90                   	nop
    293e:	90                   	nop
    293f:	90                   	nop

00002940 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2940:	55                   	push   %ebp
    2941:	89 e5                	mov    %esp,%ebp
    2943:	53                   	push   %ebx
    2944:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2947:	68 00 4a 00 00       	push   $0x4a00
    294c:	6a 01                	push   $0x1
    294e:	e8 1d 11 00 00       	call   3a70 <printf>

  fd = open("dirfile", O_CREATE);
    2953:	59                   	pop    %ecx
    2954:	5b                   	pop    %ebx
    2955:	68 00 02 00 00       	push   $0x200
    295a:	68 0d 4a 00 00       	push   $0x4a0d
    295f:	e8 de 0f 00 00       	call   3942 <open>
  if(fd < 0){
    2964:	83 c4 10             	add    $0x10,%esp
    2967:	85 c0                	test   %eax,%eax
    2969:	0f 88 43 01 00 00    	js     2ab2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    296f:	83 ec 0c             	sub    $0xc,%esp
    2972:	50                   	push   %eax
    2973:	e8 b2 0f 00 00       	call   392a <close>
  if(chdir("dirfile") == 0){
    2978:	c7 04 24 0d 4a 00 00 	movl   $0x4a0d,(%esp)
    297f:	e8 ee 0f 00 00       	call   3972 <chdir>
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 84 10 01 00 00    	je     2a9f <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    298f:	83 ec 08             	sub    $0x8,%esp
    2992:	6a 00                	push   $0x0
    2994:	68 46 4a 00 00       	push   $0x4a46
    2999:	e8 a4 0f 00 00       	call   3942 <open>
  if(fd >= 0){
    299e:	83 c4 10             	add    $0x10,%esp
    29a1:	85 c0                	test   %eax,%eax
    29a3:	0f 89 e3 00 00 00    	jns    2a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 00 02 00 00       	push   $0x200
    29b1:	68 46 4a 00 00       	push   $0x4a46
    29b6:	e8 87 0f 00 00       	call   3942 <open>
  if(fd >= 0){
    29bb:	83 c4 10             	add    $0x10,%esp
    29be:	85 c0                	test   %eax,%eax
    29c0:	0f 89 c6 00 00 00    	jns    2a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    29c6:	83 ec 0c             	sub    $0xc,%esp
    29c9:	68 46 4a 00 00       	push   $0x4a46
    29ce:	e8 97 0f 00 00       	call   396a <mkdir>
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	85 c0                	test   %eax,%eax
    29d8:	0f 84 46 01 00 00    	je     2b24 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    29de:	83 ec 0c             	sub    $0xc,%esp
    29e1:	68 46 4a 00 00       	push   $0x4a46
    29e6:	e8 67 0f 00 00       	call   3952 <unlink>
    29eb:	83 c4 10             	add    $0x10,%esp
    29ee:	85 c0                	test   %eax,%eax
    29f0:	0f 84 1b 01 00 00    	je     2b11 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    29f6:	83 ec 08             	sub    $0x8,%esp
    29f9:	68 46 4a 00 00       	push   $0x4a46
    29fe:	68 aa 4a 00 00       	push   $0x4aaa
    2a03:	e8 5a 0f 00 00       	call   3962 <link>
    2a08:	83 c4 10             	add    $0x10,%esp
    2a0b:	85 c0                	test   %eax,%eax
    2a0d:	0f 84 eb 00 00 00    	je     2afe <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a13:	83 ec 0c             	sub    $0xc,%esp
    2a16:	68 0d 4a 00 00       	push   $0x4a0d
    2a1b:	e8 32 0f 00 00       	call   3952 <unlink>
    2a20:	83 c4 10             	add    $0x10,%esp
    2a23:	85 c0                	test   %eax,%eax
    2a25:	0f 85 c0 00 00 00    	jne    2aeb <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a2b:	83 ec 08             	sub    $0x8,%esp
    2a2e:	6a 02                	push   $0x2
    2a30:	68 06 46 00 00       	push   $0x4606
    2a35:	e8 08 0f 00 00       	call   3942 <open>
  if(fd >= 0){
    2a3a:	83 c4 10             	add    $0x10,%esp
    2a3d:	85 c0                	test   %eax,%eax
    2a3f:	0f 89 93 00 00 00    	jns    2ad8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a45:	83 ec 08             	sub    $0x8,%esp
    2a48:	6a 00                	push   $0x0
    2a4a:	68 06 46 00 00       	push   $0x4606
    2a4f:	e8 ee 0e 00 00       	call   3942 <open>
  if(write(fd, "x", 1) > 0){
    2a54:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a57:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a59:	6a 01                	push   $0x1
    2a5b:	68 e9 46 00 00       	push   $0x46e9
    2a60:	50                   	push   %eax
    2a61:	e8 bc 0e 00 00       	call   3922 <write>
    2a66:	83 c4 10             	add    $0x10,%esp
    2a69:	85 c0                	test   %eax,%eax
    2a6b:	7f 58                	jg     2ac5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2a6d:	83 ec 0c             	sub    $0xc,%esp
    2a70:	53                   	push   %ebx
    2a71:	e8 b4 0e 00 00       	call   392a <close>

  printf(1, "dir vs file OK\n");
    2a76:	58                   	pop    %eax
    2a77:	5a                   	pop    %edx
    2a78:	68 dd 4a 00 00       	push   $0x4add
    2a7d:	6a 01                	push   $0x1
    2a7f:	e8 ec 0f 00 00       	call   3a70 <printf>
}
    2a84:	83 c4 10             	add    $0x10,%esp
    2a87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a8a:	c9                   	leave  
    2a8b:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2a8c:	50                   	push   %eax
    2a8d:	50                   	push   %eax
    2a8e:	68 51 4a 00 00       	push   $0x4a51
    2a93:	6a 01                	push   $0x1
    2a95:	e8 d6 0f 00 00       	call   3a70 <printf>
    exit();
    2a9a:	e8 63 0e 00 00       	call   3902 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2a9f:	50                   	push   %eax
    2aa0:	50                   	push   %eax
    2aa1:	68 2c 4a 00 00       	push   $0x4a2c
    2aa6:	6a 01                	push   $0x1
    2aa8:	e8 c3 0f 00 00       	call   3a70 <printf>
    exit();
    2aad:	e8 50 0e 00 00       	call   3902 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2ab2:	52                   	push   %edx
    2ab3:	52                   	push   %edx
    2ab4:	68 15 4a 00 00       	push   $0x4a15
    2ab9:	6a 01                	push   $0x1
    2abb:	e8 b0 0f 00 00       	call   3a70 <printf>
    exit();
    2ac0:	e8 3d 0e 00 00       	call   3902 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2ac5:	51                   	push   %ecx
    2ac6:	51                   	push   %ecx
    2ac7:	68 c9 4a 00 00       	push   $0x4ac9
    2acc:	6a 01                	push   $0x1
    2ace:	e8 9d 0f 00 00       	call   3a70 <printf>
    exit();
    2ad3:	e8 2a 0e 00 00       	call   3902 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2ad8:	53                   	push   %ebx
    2ad9:	53                   	push   %ebx
    2ada:	68 c0 52 00 00       	push   $0x52c0
    2adf:	6a 01                	push   $0x1
    2ae1:	e8 8a 0f 00 00       	call   3a70 <printf>
    exit();
    2ae6:	e8 17 0e 00 00       	call   3902 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2aeb:	50                   	push   %eax
    2aec:	50                   	push   %eax
    2aed:	68 b1 4a 00 00       	push   $0x4ab1
    2af2:	6a 01                	push   $0x1
    2af4:	e8 77 0f 00 00       	call   3a70 <printf>
    exit();
    2af9:	e8 04 0e 00 00       	call   3902 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2afe:	50                   	push   %eax
    2aff:	50                   	push   %eax
    2b00:	68 a0 52 00 00       	push   $0x52a0
    2b05:	6a 01                	push   $0x1
    2b07:	e8 64 0f 00 00       	call   3a70 <printf>
    exit();
    2b0c:	e8 f1 0d 00 00       	call   3902 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b11:	50                   	push   %eax
    2b12:	50                   	push   %eax
    2b13:	68 8c 4a 00 00       	push   $0x4a8c
    2b18:	6a 01                	push   $0x1
    2b1a:	e8 51 0f 00 00       	call   3a70 <printf>
    exit();
    2b1f:	e8 de 0d 00 00       	call   3902 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b24:	50                   	push   %eax
    2b25:	50                   	push   %eax
    2b26:	68 6f 4a 00 00       	push   $0x4a6f
    2b2b:	6a 01                	push   $0x1
    2b2d:	e8 3e 0f 00 00       	call   3a70 <printf>
    exit();
    2b32:	e8 cb 0d 00 00       	call   3902 <exit>
    2b37:	89 f6                	mov    %esi,%esi
    2b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b40 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b40:	55                   	push   %ebp
    2b41:	89 e5                	mov    %esp,%ebp
    2b43:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b44:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b49:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b4c:	68 ed 4a 00 00       	push   $0x4aed
    2b51:	6a 01                	push   $0x1
    2b53:	e8 18 0f 00 00       	call   3a70 <printf>
    2b58:	83 c4 10             	add    $0x10,%esp
    2b5b:	90                   	nop
    2b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2b60:	83 ec 0c             	sub    $0xc,%esp
    2b63:	68 fe 4a 00 00       	push   $0x4afe
    2b68:	e8 fd 0d 00 00       	call   396a <mkdir>
    2b6d:	83 c4 10             	add    $0x10,%esp
    2b70:	85 c0                	test   %eax,%eax
    2b72:	0f 85 bb 00 00 00    	jne    2c33 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2b78:	83 ec 0c             	sub    $0xc,%esp
    2b7b:	68 fe 4a 00 00       	push   $0x4afe
    2b80:	e8 ed 0d 00 00       	call   3972 <chdir>
    2b85:	83 c4 10             	add    $0x10,%esp
    2b88:	85 c0                	test   %eax,%eax
    2b8a:	0f 85 b7 00 00 00    	jne    2c47 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2b90:	83 ec 0c             	sub    $0xc,%esp
    2b93:	68 b3 41 00 00       	push   $0x41b3
    2b98:	e8 cd 0d 00 00       	call   396a <mkdir>
    link("README", "");
    2b9d:	59                   	pop    %ecx
    2b9e:	58                   	pop    %eax
    2b9f:	68 b3 41 00 00       	push   $0x41b3
    2ba4:	68 aa 4a 00 00       	push   $0x4aaa
    2ba9:	e8 b4 0d 00 00       	call   3962 <link>
    fd = open("", O_CREATE);
    2bae:	58                   	pop    %eax
    2baf:	5a                   	pop    %edx
    2bb0:	68 00 02 00 00       	push   $0x200
    2bb5:	68 b3 41 00 00       	push   $0x41b3
    2bba:	e8 83 0d 00 00       	call   3942 <open>
    if(fd >= 0)
    2bbf:	83 c4 10             	add    $0x10,%esp
    2bc2:	85 c0                	test   %eax,%eax
    2bc4:	78 0c                	js     2bd2 <iref+0x92>
      close(fd);
    2bc6:	83 ec 0c             	sub    $0xc,%esp
    2bc9:	50                   	push   %eax
    2bca:	e8 5b 0d 00 00       	call   392a <close>
    2bcf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bd2:	83 ec 08             	sub    $0x8,%esp
    2bd5:	68 00 02 00 00       	push   $0x200
    2bda:	68 e8 46 00 00       	push   $0x46e8
    2bdf:	e8 5e 0d 00 00       	call   3942 <open>
    if(fd >= 0)
    2be4:	83 c4 10             	add    $0x10,%esp
    2be7:	85 c0                	test   %eax,%eax
    2be9:	78 0c                	js     2bf7 <iref+0xb7>
      close(fd);
    2beb:	83 ec 0c             	sub    $0xc,%esp
    2bee:	50                   	push   %eax
    2bef:	e8 36 0d 00 00       	call   392a <close>
    2bf4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2bf7:	83 ec 0c             	sub    $0xc,%esp
    2bfa:	68 e8 46 00 00       	push   $0x46e8
    2bff:	e8 4e 0d 00 00       	call   3952 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	83 eb 01             	sub    $0x1,%ebx
    2c0a:	0f 85 50 ff ff ff    	jne    2b60 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c10:	83 ec 0c             	sub    $0xc,%esp
    2c13:	68 d9 3d 00 00       	push   $0x3dd9
    2c18:	e8 55 0d 00 00       	call   3972 <chdir>
  printf(1, "empty file name OK\n");
    2c1d:	58                   	pop    %eax
    2c1e:	5a                   	pop    %edx
    2c1f:	68 2c 4b 00 00       	push   $0x4b2c
    2c24:	6a 01                	push   $0x1
    2c26:	e8 45 0e 00 00       	call   3a70 <printf>
}
    2c2b:	83 c4 10             	add    $0x10,%esp
    2c2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c31:	c9                   	leave  
    2c32:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c33:	83 ec 08             	sub    $0x8,%esp
    2c36:	68 04 4b 00 00       	push   $0x4b04
    2c3b:	6a 01                	push   $0x1
    2c3d:	e8 2e 0e 00 00       	call   3a70 <printf>
      exit();
    2c42:	e8 bb 0c 00 00       	call   3902 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c47:	83 ec 08             	sub    $0x8,%esp
    2c4a:	68 18 4b 00 00       	push   $0x4b18
    2c4f:	6a 01                	push   $0x1
    2c51:	e8 1a 0e 00 00       	call   3a70 <printf>
      exit();
    2c56:	e8 a7 0c 00 00       	call   3902 <exit>
    2c5b:	90                   	nop
    2c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c60 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c60:	55                   	push   %ebp
    2c61:	89 e5                	mov    %esp,%ebp
    2c63:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c64:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c66:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2c69:	68 40 4b 00 00       	push   $0x4b40
    2c6e:	6a 01                	push   $0x1
    2c70:	e8 fb 0d 00 00       	call   3a70 <printf>
    2c75:	83 c4 10             	add    $0x10,%esp
    2c78:	eb 13                	jmp    2c8d <forktest+0x2d>
    2c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2c80:	74 62                	je     2ce4 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c82:	83 c3 01             	add    $0x1,%ebx
    2c85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2c8b:	74 43                	je     2cd0 <forktest+0x70>
    pid = fork();
    2c8d:	e8 68 0c 00 00       	call   38fa <fork>
    if(pid < 0)
    2c92:	85 c0                	test   %eax,%eax
    2c94:	79 ea                	jns    2c80 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2c96:	85 db                	test   %ebx,%ebx
    2c98:	74 14                	je     2cae <forktest+0x4e>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ca0:	e8 65 0c 00 00       	call   390a <wait>
    2ca5:	85 c0                	test   %eax,%eax
    2ca7:	78 40                	js     2ce9 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2ca9:	83 eb 01             	sub    $0x1,%ebx
    2cac:	75 f2                	jne    2ca0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2cae:	e8 57 0c 00 00       	call   390a <wait>
    2cb3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cb6:	75 45                	jne    2cfd <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2cb8:	83 ec 08             	sub    $0x8,%esp
    2cbb:	68 72 4b 00 00       	push   $0x4b72
    2cc0:	6a 01                	push   $0x1
    2cc2:	e8 a9 0d 00 00       	call   3a70 <printf>
}
    2cc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cca:	c9                   	leave  
    2ccb:	c3                   	ret    
    2ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2cd0:	83 ec 08             	sub    $0x8,%esp
    2cd3:	68 e0 52 00 00       	push   $0x52e0
    2cd8:	6a 01                	push   $0x1
    2cda:	e8 91 0d 00 00       	call   3a70 <printf>
    exit();
    2cdf:	e8 1e 0c 00 00       	call   3902 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2ce4:	e8 19 0c 00 00       	call   3902 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2ce9:	83 ec 08             	sub    $0x8,%esp
    2cec:	68 4b 4b 00 00       	push   $0x4b4b
    2cf1:	6a 01                	push   $0x1
    2cf3:	e8 78 0d 00 00       	call   3a70 <printf>
      exit();
    2cf8:	e8 05 0c 00 00       	call   3902 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2cfd:	83 ec 08             	sub    $0x8,%esp
    2d00:	68 5f 4b 00 00       	push   $0x4b5f
    2d05:	6a 01                	push   $0x1
    2d07:	e8 64 0d 00 00       	call   3a70 <printf>
    exit();
    2d0c:	e8 f1 0b 00 00       	call   3902 <exit>
    2d11:	eb 0d                	jmp    2d20 <sbrktest>
    2d13:	90                   	nop
    2d14:	90                   	nop
    2d15:	90                   	nop
    2d16:	90                   	nop
    2d17:	90                   	nop
    2d18:	90                   	nop
    2d19:	90                   	nop
    2d1a:	90                   	nop
    2d1b:	90                   	nop
    2d1c:	90                   	nop
    2d1d:	90                   	nop
    2d1e:	90                   	nop
    2d1f:	90                   	nop

00002d20 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d20:	55                   	push   %ebp
    2d21:	89 e5                	mov    %esp,%ebp
    2d23:	57                   	push   %edi
    2d24:	56                   	push   %esi
    2d25:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d26:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d28:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d2b:	68 80 4b 00 00       	push   $0x4b80
    2d30:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    2d36:	e8 35 0d 00 00       	call   3a70 <printf>
  oldbrk = sbrk(0);
    2d3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d42:	e8 43 0c 00 00       	call   398a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d4e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d51:	e8 34 0c 00 00       	call   398a <sbrk>
    2d56:	83 c4 10             	add    $0x10,%esp
    2d59:	89 c3                	mov    %eax,%ebx
    2d5b:	90                   	nop
    2d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2d60:	83 ec 0c             	sub    $0xc,%esp
    2d63:	6a 01                	push   $0x1
    2d65:	e8 20 0c 00 00       	call   398a <sbrk>
    if(b != a){
    2d6a:	83 c4 10             	add    $0x10,%esp
    2d6d:	39 d8                	cmp    %ebx,%eax
    2d6f:	0f 85 85 02 00 00    	jne    2ffa <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d75:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2d78:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d7b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d7e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2d84:	75 da                	jne    2d60 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d86:	e8 6f 0b 00 00       	call   38fa <fork>
  if(pid < 0){
    2d8b:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d8d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2d8f:	0f 88 93 03 00 00    	js     3128 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d95:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2d98:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d9b:	6a 01                	push   $0x1
    2d9d:	e8 e8 0b 00 00       	call   398a <sbrk>
  c = sbrk(1);
    2da2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2da9:	e8 dc 0b 00 00       	call   398a <sbrk>
  if(c != a + 1){
    2dae:	83 c4 10             	add    $0x10,%esp
    2db1:	39 d8                	cmp    %ebx,%eax
    2db3:	0f 85 57 03 00 00    	jne    3110 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2db9:	85 ff                	test   %edi,%edi
    2dbb:	0f 84 4a 03 00 00    	je     310b <sbrktest+0x3eb>
    exit();
  wait();
    2dc1:	e8 44 0b 00 00       	call   390a <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2dc6:	83 ec 0c             	sub    $0xc,%esp
    2dc9:	6a 00                	push   $0x0
    2dcb:	e8 ba 0b 00 00       	call   398a <sbrk>
    2dd0:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    2dd2:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2dd7:	29 d8                	sub    %ebx,%eax
    2dd9:	89 04 24             	mov    %eax,(%esp)
    2ddc:	e8 a9 0b 00 00       	call   398a <sbrk>
  if (p != a) {
    2de1:	83 c4 10             	add    $0x10,%esp
    2de4:	39 c3                	cmp    %eax,%ebx
    2de6:	0f 85 07 03 00 00    	jne    30f3 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2dec:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2def:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2df6:	6a 00                	push   $0x0
    2df8:	e8 8d 0b 00 00       	call   398a <sbrk>
  c = sbrk(-4096);
    2dfd:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e04:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e06:	e8 7f 0b 00 00       	call   398a <sbrk>
  if(c == (char*)0xffffffff){
    2e0b:	83 c4 10             	add    $0x10,%esp
    2e0e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e11:	0f 84 c4 02 00 00    	je     30db <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e17:	83 ec 0c             	sub    $0xc,%esp
    2e1a:	6a 00                	push   $0x0
    2e1c:	e8 69 0b 00 00       	call   398a <sbrk>
  if(c != a - 4096){
    2e21:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e27:	83 c4 10             	add    $0x10,%esp
    2e2a:	39 d0                	cmp    %edx,%eax
    2e2c:	0f 85 92 02 00 00    	jne    30c4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e32:	83 ec 0c             	sub    $0xc,%esp
    2e35:	6a 00                	push   $0x0
    2e37:	e8 4e 0b 00 00       	call   398a <sbrk>
    2e3c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e3e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e45:	e8 40 0b 00 00       	call   398a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e4a:	83 c4 10             	add    $0x10,%esp
    2e4d:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e4f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e51:	0f 85 56 02 00 00    	jne    30ad <sbrktest+0x38d>
    2e57:	83 ec 0c             	sub    $0xc,%esp
    2e5a:	6a 00                	push   $0x0
    2e5c:	e8 29 0b 00 00       	call   398a <sbrk>
    2e61:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e67:	83 c4 10             	add    $0x10,%esp
    2e6a:	39 d0                	cmp    %edx,%eax
    2e6c:	0f 85 3b 02 00 00    	jne    30ad <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2e72:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e79:	0f 84 16 02 00 00    	je     3095 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e7f:	83 ec 0c             	sub    $0xc,%esp
    2e82:	6a 00                	push   $0x0
    2e84:	e8 01 0b 00 00       	call   398a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2e89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e90:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2e92:	e8 f3 0a 00 00       	call   398a <sbrk>
    2e97:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2e9a:	29 c1                	sub    %eax,%ecx
    2e9c:	89 0c 24             	mov    %ecx,(%esp)
    2e9f:	e8 e6 0a 00 00       	call   398a <sbrk>
  if(c != a){
    2ea4:	83 c4 10             	add    $0x10,%esp
    2ea7:	39 c3                	cmp    %eax,%ebx
    2ea9:	0f 85 cf 01 00 00    	jne    307e <sbrktest+0x35e>
    2eaf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2eb8:	e8 c5 0a 00 00       	call   3982 <getpid>
    2ebd:	89 c7                	mov    %eax,%edi
    pid = fork();
    2ebf:	e8 36 0a 00 00       	call   38fa <fork>
    if(pid < 0){
    2ec4:	85 c0                	test   %eax,%eax
    2ec6:	0f 88 9a 01 00 00    	js     3066 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2ecc:	0f 84 72 01 00 00    	je     3044 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ed2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2ed8:	e8 2d 0a 00 00       	call   390a <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2edd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2ee3:	75 d3                	jne    2eb8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2ee5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ee8:	83 ec 0c             	sub    $0xc,%esp
    2eeb:	50                   	push   %eax
    2eec:	e8 21 0a 00 00       	call   3912 <pipe>
    2ef1:	83 c4 10             	add    $0x10,%esp
    2ef4:	85 c0                	test   %eax,%eax
    2ef6:	0f 85 34 01 00 00    	jne    3030 <sbrktest+0x310>
    2efc:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2eff:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2f02:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2f04:	e8 f1 09 00 00       	call   38fa <fork>
    2f09:	85 c0                	test   %eax,%eax
    2f0b:	89 06                	mov    %eax,(%esi)
    2f0d:	0f 84 a1 00 00 00    	je     2fb4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f13:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f16:	74 14                	je     2f2c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    2f18:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f1b:	83 ec 04             	sub    $0x4,%esp
    2f1e:	6a 01                	push   $0x1
    2f20:	50                   	push   %eax
    2f21:	ff 75 b8             	pushl  -0x48(%ebp)
    2f24:	e8 f1 09 00 00       	call   391a <read>
    2f29:	83 c4 10             	add    $0x10,%esp
    2f2c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f2f:	39 f7                	cmp    %esi,%edi
    2f31:	75 d1                	jne    2f04 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f33:	83 ec 0c             	sub    $0xc,%esp
    2f36:	68 00 10 00 00       	push   $0x1000
    2f3b:	e8 4a 0a 00 00       	call   398a <sbrk>
    2f40:	83 c4 10             	add    $0x10,%esp
    2f43:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f45:	8b 03                	mov    (%ebx),%eax
    2f47:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f4a:	74 11                	je     2f5d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    2f4c:	83 ec 0c             	sub    $0xc,%esp
    2f4f:	50                   	push   %eax
    2f50:	e8 dd 09 00 00       	call   3932 <kill>
    wait();
    2f55:	e8 b0 09 00 00       	call   390a <wait>
    2f5a:	83 c4 10             	add    $0x10,%esp
    2f5d:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f60:	39 fb                	cmp    %edi,%ebx
    2f62:	75 e1                	jne    2f45 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2f64:	83 fe ff             	cmp    $0xffffffff,%esi
    2f67:	0f 84 ab 00 00 00    	je     3018 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f6d:	83 ec 0c             	sub    $0xc,%esp
    2f70:	6a 00                	push   $0x0
    2f72:	e8 13 0a 00 00       	call   398a <sbrk>
    2f77:	83 c4 10             	add    $0x10,%esp
    2f7a:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2f7d:	73 1a                	jae    2f99 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    2f7f:	83 ec 0c             	sub    $0xc,%esp
    2f82:	6a 00                	push   $0x0
    2f84:	e8 01 0a 00 00       	call   398a <sbrk>
    2f89:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    2f8c:	29 c6                	sub    %eax,%esi
    2f8e:	89 34 24             	mov    %esi,(%esp)
    2f91:	e8 f4 09 00 00       	call   398a <sbrk>
    2f96:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2f99:	83 ec 08             	sub    $0x8,%esp
    2f9c:	68 28 4c 00 00       	push   $0x4c28
    2fa1:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    2fa7:	e8 c4 0a 00 00       	call   3a70 <printf>
}
    2fac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2faf:	5b                   	pop    %ebx
    2fb0:	5e                   	pop    %esi
    2fb1:	5f                   	pop    %edi
    2fb2:	5d                   	pop    %ebp
    2fb3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2fb4:	83 ec 0c             	sub    $0xc,%esp
    2fb7:	6a 00                	push   $0x0
    2fb9:	e8 cc 09 00 00       	call   398a <sbrk>
    2fbe:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fc3:	29 c2                	sub    %eax,%edx
    2fc5:	89 14 24             	mov    %edx,(%esp)
    2fc8:	e8 bd 09 00 00       	call   398a <sbrk>
      write(fds[1], "x", 1);
    2fcd:	83 c4 0c             	add    $0xc,%esp
    2fd0:	6a 01                	push   $0x1
    2fd2:	68 e9 46 00 00       	push   $0x46e9
    2fd7:	ff 75 bc             	pushl  -0x44(%ebp)
    2fda:	e8 43 09 00 00       	call   3922 <write>
    2fdf:	83 c4 10             	add    $0x10,%esp
    2fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    2fe8:	83 ec 0c             	sub    $0xc,%esp
    2feb:	68 e8 03 00 00       	push   $0x3e8
    2ff0:	e8 9d 09 00 00       	call   3992 <sleep>
    2ff5:	83 c4 10             	add    $0x10,%esp
    2ff8:	eb ee                	jmp    2fe8 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2ffa:	83 ec 0c             	sub    $0xc,%esp
    2ffd:	50                   	push   %eax
    2ffe:	53                   	push   %ebx
    2fff:	57                   	push   %edi
    3000:	68 8b 4b 00 00       	push   $0x4b8b
    3005:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    300b:	e8 60 0a 00 00       	call   3a70 <printf>
      exit();
    3010:	83 c4 20             	add    $0x20,%esp
    3013:	e8 ea 08 00 00       	call   3902 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3018:	83 ec 08             	sub    $0x8,%esp
    301b:	68 0d 4c 00 00       	push   $0x4c0d
    3020:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3026:	e8 45 0a 00 00       	call   3a70 <printf>
    exit();
    302b:	e8 d2 08 00 00       	call   3902 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3030:	83 ec 08             	sub    $0x8,%esp
    3033:	68 c9 40 00 00       	push   $0x40c9
    3038:	6a 01                	push   $0x1
    303a:	e8 31 0a 00 00       	call   3a70 <printf>
    exit();
    303f:	e8 be 08 00 00       	call   3902 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3044:	0f be 03             	movsbl (%ebx),%eax
    3047:	50                   	push   %eax
    3048:	53                   	push   %ebx
    3049:	68 f4 4b 00 00       	push   $0x4bf4
    304e:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3054:	e8 17 0a 00 00       	call   3a70 <printf>
      kill(ppid);
    3059:	89 3c 24             	mov    %edi,(%esp)
    305c:	e8 d1 08 00 00       	call   3932 <kill>
      exit();
    3061:	e8 9c 08 00 00       	call   3902 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3066:	83 ec 08             	sub    $0x8,%esp
    3069:	68 d1 4c 00 00       	push   $0x4cd1
    306e:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3074:	e8 f7 09 00 00       	call   3a70 <printf>
      exit();
    3079:	e8 84 08 00 00       	call   3902 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    307e:	50                   	push   %eax
    307f:	53                   	push   %ebx
    3080:	68 d4 53 00 00       	push   $0x53d4
    3085:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    308b:	e8 e0 09 00 00       	call   3a70 <printf>
    exit();
    3090:	e8 6d 08 00 00       	call   3902 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3095:	83 ec 08             	sub    $0x8,%esp
    3098:	68 a4 53 00 00       	push   $0x53a4
    309d:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    30a3:	e8 c8 09 00 00       	call   3a70 <printf>
    exit();
    30a8:	e8 55 08 00 00       	call   3902 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30ad:	57                   	push   %edi
    30ae:	53                   	push   %ebx
    30af:	68 7c 53 00 00       	push   $0x537c
    30b4:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    30ba:	e8 b1 09 00 00       	call   3a70 <printf>
    exit();
    30bf:	e8 3e 08 00 00       	call   3902 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30c4:	50                   	push   %eax
    30c5:	53                   	push   %ebx
    30c6:	68 44 53 00 00       	push   $0x5344
    30cb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    30d1:	e8 9a 09 00 00       	call   3a70 <printf>
    exit();
    30d6:	e8 27 08 00 00       	call   3902 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    30db:	83 ec 08             	sub    $0x8,%esp
    30de:	68 d9 4b 00 00       	push   $0x4bd9
    30e3:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    30e9:	e8 82 09 00 00       	call   3a70 <printf>
    exit();
    30ee:	e8 0f 08 00 00       	call   3902 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30f3:	83 ec 08             	sub    $0x8,%esp
    30f6:	68 04 53 00 00       	push   $0x5304
    30fb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3101:	e8 6a 09 00 00       	call   3a70 <printf>
    exit();
    3106:	e8 f7 07 00 00       	call   3902 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    310b:	e8 f2 07 00 00       	call   3902 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3110:	83 ec 08             	sub    $0x8,%esp
    3113:	68 bd 4b 00 00       	push   $0x4bbd
    3118:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    311e:	e8 4d 09 00 00       	call   3a70 <printf>
    exit();
    3123:	e8 da 07 00 00       	call   3902 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3128:	83 ec 08             	sub    $0x8,%esp
    312b:	68 a6 4b 00 00       	push   $0x4ba6
    3130:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3136:	e8 35 09 00 00       	call   3a70 <printf>
    exit();
    313b:	e8 c2 07 00 00       	call   3902 <exit>

00003140 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3143:	5d                   	pop    %ebp
    3144:	c3                   	ret    
    3145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003150 <validatetest>:

void
validatetest(void)
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	56                   	push   %esi
    3154:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3155:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3157:	83 ec 08             	sub    $0x8,%esp
    315a:	68 36 4c 00 00       	push   $0x4c36
    315f:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3165:	e8 06 09 00 00       	call   3a70 <printf>
    316a:	83 c4 10             	add    $0x10,%esp
    316d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3170:	e8 85 07 00 00       	call   38fa <fork>
    3175:	85 c0                	test   %eax,%eax
    3177:	89 c6                	mov    %eax,%esi
    3179:	74 63                	je     31de <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    317b:	83 ec 0c             	sub    $0xc,%esp
    317e:	6a 00                	push   $0x0
    3180:	e8 0d 08 00 00       	call   3992 <sleep>
    sleep(0);
    3185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    318c:	e8 01 08 00 00       	call   3992 <sleep>
    kill(pid);
    3191:	89 34 24             	mov    %esi,(%esp)
    3194:	e8 99 07 00 00       	call   3932 <kill>
    wait();
    3199:	e8 6c 07 00 00       	call   390a <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    319e:	58                   	pop    %eax
    319f:	5a                   	pop    %edx
    31a0:	53                   	push   %ebx
    31a1:	68 45 4c 00 00       	push   $0x4c45
    31a6:	e8 b7 07 00 00       	call   3962 <link>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b1:	75 30                	jne    31e3 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31bf:	75 af                	jne    3170 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    31c1:	83 ec 08             	sub    $0x8,%esp
    31c4:	68 69 4c 00 00       	push   $0x4c69
    31c9:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    31cf:	e8 9c 08 00 00       	call   3a70 <printf>
}
    31d4:	83 c4 10             	add    $0x10,%esp
    31d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31da:	5b                   	pop    %ebx
    31db:	5e                   	pop    %esi
    31dc:	5d                   	pop    %ebp
    31dd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    31de:	e8 1f 07 00 00       	call   3902 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    31e3:	83 ec 08             	sub    $0x8,%esp
    31e6:	68 50 4c 00 00       	push   $0x4c50
    31eb:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    31f1:	e8 7a 08 00 00       	call   3a70 <printf>
      exit();
    31f6:	e8 07 07 00 00       	call   3902 <exit>
    31fb:	90                   	nop
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3200:	55                   	push   %ebp
    3201:	89 e5                	mov    %esp,%ebp
    3203:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3206:	68 76 4c 00 00       	push   $0x4c76
    320b:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3211:	e8 5a 08 00 00       	call   3a70 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3216:	83 c4 10             	add    $0x10,%esp
    3219:	80 3d 20 5f 00 00 00 	cmpb   $0x0,0x5f20
    3220:	75 35                	jne    3257 <bsstest+0x57>
    3222:	b8 21 5f 00 00       	mov    $0x5f21,%eax
    3227:	89 f6                	mov    %esi,%esi
    3229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3230:	80 38 00             	cmpb   $0x0,(%eax)
    3233:	75 22                	jne    3257 <bsstest+0x57>
    3235:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3238:	3d 30 86 00 00       	cmp    $0x8630,%eax
    323d:	75 f1                	jne    3230 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    323f:	83 ec 08             	sub    $0x8,%esp
    3242:	68 91 4c 00 00       	push   $0x4c91
    3247:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    324d:	e8 1e 08 00 00       	call   3a70 <printf>
}
    3252:	83 c4 10             	add    $0x10,%esp
    3255:	c9                   	leave  
    3256:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3257:	83 ec 08             	sub    $0x8,%esp
    325a:	68 80 4c 00 00       	push   $0x4c80
    325f:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3265:	e8 06 08 00 00       	call   3a70 <printf>
      exit();
    326a:	e8 93 06 00 00       	call   3902 <exit>
    326f:	90                   	nop

00003270 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3270:	55                   	push   %ebp
    3271:	89 e5                	mov    %esp,%ebp
    3273:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3276:	68 9e 4c 00 00       	push   $0x4c9e
    327b:	e8 d2 06 00 00       	call   3952 <unlink>
  pid = fork();
    3280:	e8 75 06 00 00       	call   38fa <fork>
  if(pid == 0){
    3285:	83 c4 10             	add    $0x10,%esp
    3288:	85 c0                	test   %eax,%eax
    328a:	74 3f                	je     32cb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    328c:	0f 88 c2 00 00 00    	js     3354 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3292:	e8 73 06 00 00       	call   390a <wait>
  fd = open("bigarg-ok", 0);
    3297:	83 ec 08             	sub    $0x8,%esp
    329a:	6a 00                	push   $0x0
    329c:	68 9e 4c 00 00       	push   $0x4c9e
    32a1:	e8 9c 06 00 00       	call   3942 <open>
  if(fd < 0){
    32a6:	83 c4 10             	add    $0x10,%esp
    32a9:	85 c0                	test   %eax,%eax
    32ab:	0f 88 8c 00 00 00    	js     333d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32b1:	83 ec 0c             	sub    $0xc,%esp
    32b4:	50                   	push   %eax
    32b5:	e8 70 06 00 00       	call   392a <close>
  unlink("bigarg-ok");
    32ba:	c7 04 24 9e 4c 00 00 	movl   $0x4c9e,(%esp)
    32c1:	e8 8c 06 00 00       	call   3952 <unlink>
}
    32c6:	83 c4 10             	add    $0x10,%esp
    32c9:	c9                   	leave  
    32ca:	c3                   	ret    
    32cb:	b8 80 5e 00 00       	mov    $0x5e80,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32d0:	c7 00 f8 53 00 00    	movl   $0x53f8,(%eax)
    32d6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    32d9:	3d fc 5e 00 00       	cmp    $0x5efc,%eax
    32de:	75 f0                	jne    32d0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    32e0:	51                   	push   %ecx
    32e1:	51                   	push   %ecx
    32e2:	68 a8 4c 00 00       	push   $0x4ca8
    32e7:	ff 35 4c 5e 00 00    	pushl  0x5e4c
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    32ed:	c7 05 fc 5e 00 00 00 	movl   $0x0,0x5efc
    32f4:	00 00 00 
    printf(stdout, "bigarg test\n");
    32f7:	e8 74 07 00 00       	call   3a70 <printf>
    exec("echo", args);
    32fc:	58                   	pop    %eax
    32fd:	5a                   	pop    %edx
    32fe:	68 80 5e 00 00       	push   $0x5e80
    3303:	68 75 3e 00 00       	push   $0x3e75
    3308:	e8 2d 06 00 00       	call   393a <exec>
    printf(stdout, "bigarg test ok\n");
    330d:	59                   	pop    %ecx
    330e:	58                   	pop    %eax
    330f:	68 b5 4c 00 00       	push   $0x4cb5
    3314:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    331a:	e8 51 07 00 00       	call   3a70 <printf>
    fd = open("bigarg-ok", O_CREATE);
    331f:	58                   	pop    %eax
    3320:	5a                   	pop    %edx
    3321:	68 00 02 00 00       	push   $0x200
    3326:	68 9e 4c 00 00       	push   $0x4c9e
    332b:	e8 12 06 00 00       	call   3942 <open>
    close(fd);
    3330:	89 04 24             	mov    %eax,(%esp)
    3333:	e8 f2 05 00 00       	call   392a <close>
    exit();
    3338:	e8 c5 05 00 00       	call   3902 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    333d:	50                   	push   %eax
    333e:	50                   	push   %eax
    333f:	68 de 4c 00 00       	push   $0x4cde
    3344:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    334a:	e8 21 07 00 00       	call   3a70 <printf>
    exit();
    334f:	e8 ae 05 00 00       	call   3902 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3354:	52                   	push   %edx
    3355:	52                   	push   %edx
    3356:	68 c5 4c 00 00       	push   $0x4cc5
    335b:	ff 35 4c 5e 00 00    	pushl  0x5e4c
    3361:	e8 0a 07 00 00       	call   3a70 <printf>
    exit();
    3366:	e8 97 05 00 00       	call   3902 <exit>
    336b:	90                   	nop
    336c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003370 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3370:	55                   	push   %ebp
    3371:	89 e5                	mov    %esp,%ebp
    3373:	57                   	push   %edi
    3374:	56                   	push   %esi
    3375:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3376:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3378:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    337b:	68 f3 4c 00 00       	push   $0x4cf3
    3380:	6a 01                	push   $0x1
    3382:	e8 e9 06 00 00       	call   3a70 <printf>
    3387:	83 c4 10             	add    $0x10,%esp
    338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3390:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3395:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3397:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3399:	f7 eb                	imul   %ebx
    339b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    339e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    33a0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    33a3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    33a7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33ab:	c1 fa 06             	sar    $0x6,%edx
    33ae:	29 f2                	sub    %esi,%edx
    33b0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33b3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33b9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33bc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33c1:	29 d1                	sub    %edx,%ecx
    33c3:	f7 e9                	imul   %ecx
    33c5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33c8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33cd:	c1 fa 05             	sar    $0x5,%edx
    33d0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    33d2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33d7:	83 c2 30             	add    $0x30,%edx
    33da:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33dd:	f7 eb                	imul   %ebx
    33df:	c1 fa 05             	sar    $0x5,%edx
    33e2:	29 f2                	sub    %esi,%edx
    33e4:	6b d2 64             	imul   $0x64,%edx,%edx
    33e7:	29 d7                	sub    %edx,%edi
    33e9:	89 f8                	mov    %edi,%eax
    33eb:	c1 ff 1f             	sar    $0x1f,%edi
    33ee:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    33f0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33f2:	c1 fa 02             	sar    $0x2,%edx
    33f5:	29 fa                	sub    %edi,%edx
    33f7:	83 c2 30             	add    $0x30,%edx
    33fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    33fd:	f7 e9                	imul   %ecx
    33ff:	89 d9                	mov    %ebx,%ecx
    3401:	c1 fa 02             	sar    $0x2,%edx
    3404:	29 f2                	sub    %esi,%edx
    3406:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3409:	01 c0                	add    %eax,%eax
    340b:	29 c1                	sub    %eax,%ecx
    340d:	89 c8                	mov    %ecx,%eax
    340f:	83 c0 30             	add    $0x30,%eax
    3412:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3415:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3418:	50                   	push   %eax
    3419:	68 00 4d 00 00       	push   $0x4d00
    341e:	6a 01                	push   $0x1
    3420:	e8 4b 06 00 00       	call   3a70 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3425:	58                   	pop    %eax
    3426:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3429:	5a                   	pop    %edx
    342a:	68 02 02 00 00       	push   $0x202
    342f:	50                   	push   %eax
    3430:	e8 0d 05 00 00       	call   3942 <open>
    if(fd < 0){
    3435:	83 c4 10             	add    $0x10,%esp
    3438:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    343a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    343c:	78 50                	js     348e <fsfull+0x11e>
    343e:	31 f6                	xor    %esi,%esi
    3440:	eb 08                	jmp    344a <fsfull+0xda>
    3442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3448:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    344a:	83 ec 04             	sub    $0x4,%esp
    344d:	68 00 02 00 00       	push   $0x200
    3452:	68 40 86 00 00       	push   $0x8640
    3457:	57                   	push   %edi
    3458:	e8 c5 04 00 00       	call   3922 <write>
      if(cc < 512)
    345d:	83 c4 10             	add    $0x10,%esp
    3460:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3465:	7f e1                	jg     3448 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3467:	83 ec 04             	sub    $0x4,%esp
    346a:	56                   	push   %esi
    346b:	68 1c 4d 00 00       	push   $0x4d1c
    3470:	6a 01                	push   $0x1
    3472:	e8 f9 05 00 00       	call   3a70 <printf>
    close(fd);
    3477:	89 3c 24             	mov    %edi,(%esp)
    347a:	e8 ab 04 00 00       	call   392a <close>
    if(total == 0)
    347f:	83 c4 10             	add    $0x10,%esp
    3482:	85 f6                	test   %esi,%esi
    3484:	74 22                	je     34a8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3486:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3489:	e9 02 ff ff ff       	jmp    3390 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    348e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3491:	83 ec 04             	sub    $0x4,%esp
    3494:	50                   	push   %eax
    3495:	68 0c 4d 00 00       	push   $0x4d0c
    349a:	6a 01                	push   $0x1
    349c:	e8 cf 05 00 00       	call   3a70 <printf>
      break;
    34a1:	83 c4 10             	add    $0x10,%esp
    34a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34a8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34ad:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34af:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34b1:	f7 eb                	imul   %ebx
    34b3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34b6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34b8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34bb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34bf:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34c3:	c1 fa 06             	sar    $0x6,%edx
    34c6:	29 f2                	sub    %esi,%edx
    34c8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34cb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34d1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34d4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    34d9:	29 d1                	sub    %edx,%ecx
    34db:	f7 e9                	imul   %ecx
    34dd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    34e0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34e5:	c1 fa 05             	sar    $0x5,%edx
    34e8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    34ea:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34ef:	83 c2 30             	add    $0x30,%edx
    34f2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    34f5:	f7 eb                	imul   %ebx
    34f7:	c1 fa 05             	sar    $0x5,%edx
    34fa:	29 f2                	sub    %esi,%edx
    34fc:	6b d2 64             	imul   $0x64,%edx,%edx
    34ff:	29 d7                	sub    %edx,%edi
    3501:	89 f8                	mov    %edi,%eax
    3503:	c1 ff 1f             	sar    $0x1f,%edi
    3506:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3508:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    350a:	c1 fa 02             	sar    $0x2,%edx
    350d:	29 fa                	sub    %edi,%edx
    350f:	83 c2 30             	add    $0x30,%edx
    3512:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3515:	f7 e9                	imul   %ecx
    3517:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3519:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    351c:	c1 fa 02             	sar    $0x2,%edx
    351f:	29 f2                	sub    %esi,%edx
    3521:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3524:	01 c0                	add    %eax,%eax
    3526:	29 c1                	sub    %eax,%ecx
    3528:	89 c8                	mov    %ecx,%eax
    352a:	83 c0 30             	add    $0x30,%eax
    352d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3530:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3533:	50                   	push   %eax
    3534:	e8 19 04 00 00       	call   3952 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3539:	83 c4 10             	add    $0x10,%esp
    353c:	83 fb ff             	cmp    $0xffffffff,%ebx
    353f:	0f 85 63 ff ff ff    	jne    34a8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3545:	83 ec 08             	sub    $0x8,%esp
    3548:	68 2c 4d 00 00       	push   $0x4d2c
    354d:	6a 01                	push   $0x1
    354f:	e8 1c 05 00 00       	call   3a70 <printf>
}
    3554:	83 c4 10             	add    $0x10,%esp
    3557:	8d 65 f4             	lea    -0xc(%ebp),%esp
    355a:	5b                   	pop    %ebx
    355b:	5e                   	pop    %esi
    355c:	5f                   	pop    %edi
    355d:	5d                   	pop    %ebp
    355e:	c3                   	ret    
    355f:	90                   	nop

00003560 <uio>:

void
uio()
{
    3560:	55                   	push   %ebp
    3561:	89 e5                	mov    %esp,%ebp
    3563:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3566:	68 42 4d 00 00       	push   $0x4d42
    356b:	6a 01                	push   $0x1
    356d:	e8 fe 04 00 00       	call   3a70 <printf>
  pid = fork();
    3572:	e8 83 03 00 00       	call   38fa <fork>
  if(pid == 0){
    3577:	83 c4 10             	add    $0x10,%esp
    357a:	85 c0                	test   %eax,%eax
    357c:	74 1b                	je     3599 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    357e:	78 3d                	js     35bd <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3580:	e8 85 03 00 00       	call   390a <wait>
  printf(1, "uio test done\n");
    3585:	83 ec 08             	sub    $0x8,%esp
    3588:	68 4c 4d 00 00       	push   $0x4d4c
    358d:	6a 01                	push   $0x1
    358f:	e8 dc 04 00 00       	call   3a70 <printf>
}
    3594:	83 c4 10             	add    $0x10,%esp
    3597:	c9                   	leave  
    3598:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3599:	ba 70 00 00 00       	mov    $0x70,%edx
    359e:	b8 09 00 00 00       	mov    $0x9,%eax
    35a3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35a4:	ba 71 00 00 00       	mov    $0x71,%edx
    35a9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35aa:	52                   	push   %edx
    35ab:	52                   	push   %edx
    35ac:	68 d8 54 00 00       	push   $0x54d8
    35b1:	6a 01                	push   $0x1
    35b3:	e8 b8 04 00 00       	call   3a70 <printf>
    exit();
    35b8:	e8 45 03 00 00       	call   3902 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35bd:	50                   	push   %eax
    35be:	50                   	push   %eax
    35bf:	68 d1 4c 00 00       	push   $0x4cd1
    35c4:	6a 01                	push   $0x1
    35c6:	e8 a5 04 00 00       	call   3a70 <printf>
    exit();
    35cb:	e8 32 03 00 00       	call   3902 <exit>

000035d0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    35d0:	55                   	push   %ebp
    35d1:	89 e5                	mov    %esp,%ebp
    35d3:	53                   	push   %ebx
    35d4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    35d7:	6a 00                	push   $0x0
    35d9:	68 5b 4d 00 00       	push   $0x4d5b
    35de:	e8 5f 03 00 00       	call   3942 <open>
  if (fd < 0) {
    35e3:	83 c4 10             	add    $0x10,%esp
    35e6:	85 c0                	test   %eax,%eax
    35e8:	78 39                	js     3623 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    35ea:	83 ec 0c             	sub    $0xc,%esp
    35ed:	89 c3                	mov    %eax,%ebx
    35ef:	6a 00                	push   $0x0
    35f1:	e8 94 03 00 00       	call   398a <sbrk>
    35f6:	83 c4 0c             	add    $0xc,%esp
    35f9:	83 e8 01             	sub    $0x1,%eax
    35fc:	6a ff                	push   $0xffffffff
    35fe:	50                   	push   %eax
    35ff:	53                   	push   %ebx
    3600:	e8 15 03 00 00       	call   391a <read>
  close(fd);
    3605:	89 1c 24             	mov    %ebx,(%esp)
    3608:	e8 1d 03 00 00       	call   392a <close>
  printf(1, "arg test passed\n");
    360d:	58                   	pop    %eax
    360e:	5a                   	pop    %edx
    360f:	68 6d 4d 00 00       	push   $0x4d6d
    3614:	6a 01                	push   $0x1
    3616:	e8 55 04 00 00       	call   3a70 <printf>
}
    361b:	83 c4 10             	add    $0x10,%esp
    361e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3621:	c9                   	leave  
    3622:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3623:	51                   	push   %ecx
    3624:	51                   	push   %ecx
    3625:	68 60 4d 00 00       	push   $0x4d60
    362a:	6a 02                	push   $0x2
    362c:	e8 3f 04 00 00       	call   3a70 <printf>
    exit();
    3631:	e8 cc 02 00 00       	call   3902 <exit>
    3636:	8d 76 00             	lea    0x0(%esi),%esi
    3639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003640 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3640:	69 05 48 5e 00 00 0d 	imul   $0x19660d,0x5e48,%eax
    3647:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    364a:	55                   	push   %ebp
    364b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    364d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    364e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3653:	a3 48 5e 00 00       	mov    %eax,0x5e48
  return randstate;
}
    3658:	c3                   	ret    
    3659:	66 90                	xchg   %ax,%ax
    365b:	66 90                	xchg   %ax,%ax
    365d:	66 90                	xchg   %ax,%ax
    365f:	90                   	nop

00003660 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3660:	55                   	push   %ebp
    3661:	89 e5                	mov    %esp,%ebp
    3663:	53                   	push   %ebx
    3664:	8b 45 08             	mov    0x8(%ebp),%eax
    3667:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    366a:	89 c2                	mov    %eax,%edx
    366c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3670:	83 c1 01             	add    $0x1,%ecx
    3673:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3677:	83 c2 01             	add    $0x1,%edx
    367a:	84 db                	test   %bl,%bl
    367c:	88 5a ff             	mov    %bl,-0x1(%edx)
    367f:	75 ef                	jne    3670 <strcpy+0x10>
    ;
  return os;
}
    3681:	5b                   	pop    %ebx
    3682:	5d                   	pop    %ebp
    3683:	c3                   	ret    
    3684:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    368a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003690 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    3690:	55                   	push   %ebp
    3691:	89 e5                	mov    %esp,%ebp
    3693:	56                   	push   %esi
    3694:	53                   	push   %ebx
    3695:	8b 45 08             	mov    0x8(%ebp),%eax
    3698:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    369b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    369e:	89 c2                	mov    %eax,%edx
    36a0:	eb 19                	jmp    36bb <strncpy+0x2b>
    36a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36a8:	83 c3 01             	add    $0x1,%ebx
    36ab:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
    36af:	83 c2 01             	add    $0x1,%edx
    36b2:	84 c9                	test   %cl,%cl
    36b4:	88 4a ff             	mov    %cl,-0x1(%edx)
    36b7:	74 09                	je     36c2 <strncpy+0x32>
    36b9:	89 f1                	mov    %esi,%ecx
    36bb:	85 c9                	test   %ecx,%ecx
    36bd:	8d 71 ff             	lea    -0x1(%ecx),%esi
    36c0:	7f e6                	jg     36a8 <strncpy+0x18>
    ;
  while(n-- > 0)
    36c2:	31 c9                	xor    %ecx,%ecx
    36c4:	85 f6                	test   %esi,%esi
    36c6:	7e 17                	jle    36df <strncpy+0x4f>
    36c8:	90                   	nop
    36c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
    36d0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
    36d4:	89 f3                	mov    %esi,%ebx
    36d6:	83 c1 01             	add    $0x1,%ecx
    36d9:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    36db:	85 db                	test   %ebx,%ebx
    36dd:	7f f1                	jg     36d0 <strncpy+0x40>
    *s++ = 0;
  return os;
}
    36df:	5b                   	pop    %ebx
    36e0:	5e                   	pop    %esi
    36e1:	5d                   	pop    %ebp
    36e2:	c3                   	ret    
    36e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036f0 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	56                   	push   %esi
    36f4:	53                   	push   %ebx
    36f5:	8b 55 08             	mov    0x8(%ebp),%edx
    36f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36fb:	0f b6 02             	movzbl (%edx),%eax
    36fe:	0f b6 19             	movzbl (%ecx),%ebx
    3701:	84 c0                	test   %al,%al
    3703:	75 1e                	jne    3723 <strcmp+0x33>
    3705:	eb 29                	jmp    3730 <strcmp+0x40>
    3707:	89 f6                	mov    %esi,%esi
    3709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3710:	83 c2 01             	add    $0x1,%edx


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3713:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3716:	8d 71 01             	lea    0x1(%ecx),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3719:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    371d:	84 c0                	test   %al,%al
    371f:	74 0f                	je     3730 <strcmp+0x40>
    3721:	89 f1                	mov    %esi,%ecx
    3723:	38 d8                	cmp    %bl,%al
    3725:	74 e9                	je     3710 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3727:	29 d8                	sub    %ebx,%eax
}
    3729:	5b                   	pop    %ebx
    372a:	5e                   	pop    %esi
    372b:	5d                   	pop    %ebp
    372c:	c3                   	ret    
    372d:	8d 76 00             	lea    0x0(%esi),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3730:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3732:	29 d8                	sub    %ebx,%eax
}
    3734:	5b                   	pop    %ebx
    3735:	5e                   	pop    %esi
    3736:	5d                   	pop    %ebp
    3737:	c3                   	ret    
    3738:	90                   	nop
    3739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003740 <strlen>:

uint
strlen(char *s)
{
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3746:	80 39 00             	cmpb   $0x0,(%ecx)
    3749:	74 12                	je     375d <strlen+0x1d>
    374b:	31 d2                	xor    %edx,%edx
    374d:	8d 76 00             	lea    0x0(%esi),%esi
    3750:	83 c2 01             	add    $0x1,%edx
    3753:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3757:	89 d0                	mov    %edx,%eax
    3759:	75 f5                	jne    3750 <strlen+0x10>
    ;
  return n;
}
    375b:	5d                   	pop    %ebp
    375c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    375d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    375f:	5d                   	pop    %ebp
    3760:	c3                   	ret    
    3761:	eb 0d                	jmp    3770 <memset>
    3763:	90                   	nop
    3764:	90                   	nop
    3765:	90                   	nop
    3766:	90                   	nop
    3767:	90                   	nop
    3768:	90                   	nop
    3769:	90                   	nop
    376a:	90                   	nop
    376b:	90                   	nop
    376c:	90                   	nop
    376d:	90                   	nop
    376e:	90                   	nop
    376f:	90                   	nop

00003770 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3770:	55                   	push   %ebp
    3771:	89 e5                	mov    %esp,%ebp
    3773:	57                   	push   %edi
    3774:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3777:	8b 4d 10             	mov    0x10(%ebp),%ecx
    377a:	8b 45 0c             	mov    0xc(%ebp),%eax
    377d:	89 d7                	mov    %edx,%edi
    377f:	fc                   	cld    
    3780:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3782:	89 d0                	mov    %edx,%eax
    3784:	5f                   	pop    %edi
    3785:	5d                   	pop    %ebp
    3786:	c3                   	ret    
    3787:	89 f6                	mov    %esi,%esi
    3789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003790 <strchr>:

char*
strchr(const char *s, char c)
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	53                   	push   %ebx
    3794:	8b 45 08             	mov    0x8(%ebp),%eax
    3797:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    379a:	0f b6 10             	movzbl (%eax),%edx
    379d:	84 d2                	test   %dl,%dl
    379f:	74 1d                	je     37be <strchr+0x2e>
    if(*s == c)
    37a1:	38 d3                	cmp    %dl,%bl
    37a3:	89 d9                	mov    %ebx,%ecx
    37a5:	75 0d                	jne    37b4 <strchr+0x24>
    37a7:	eb 17                	jmp    37c0 <strchr+0x30>
    37a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37b0:	38 ca                	cmp    %cl,%dl
    37b2:	74 0c                	je     37c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    37b4:	83 c0 01             	add    $0x1,%eax
    37b7:	0f b6 10             	movzbl (%eax),%edx
    37ba:	84 d2                	test   %dl,%dl
    37bc:	75 f2                	jne    37b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    37be:	31 c0                	xor    %eax,%eax
}
    37c0:	5b                   	pop    %ebx
    37c1:	5d                   	pop    %ebp
    37c2:	c3                   	ret    
    37c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    37c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037d0 <gets>:

char*
gets(char *buf, int max)
{
    37d0:	55                   	push   %ebp
    37d1:	89 e5                	mov    %esp,%ebp
    37d3:	57                   	push   %edi
    37d4:	56                   	push   %esi
    37d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    37d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    37db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37de:	eb 29                	jmp    3809 <gets+0x39>
    cc = read(0, &c, 1);
    37e0:	83 ec 04             	sub    $0x4,%esp
    37e3:	6a 01                	push   $0x1
    37e5:	57                   	push   %edi
    37e6:	6a 00                	push   $0x0
    37e8:	e8 2d 01 00 00       	call   391a <read>
    if(cc < 1)
    37ed:	83 c4 10             	add    $0x10,%esp
    37f0:	85 c0                	test   %eax,%eax
    37f2:	7e 1d                	jle    3811 <gets+0x41>
      break;
    buf[i++] = c;
    37f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    37f8:	8b 55 08             	mov    0x8(%ebp),%edx
    37fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    37fd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    37ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3803:	74 1b                	je     3820 <gets+0x50>
    3805:	3c 0d                	cmp    $0xd,%al
    3807:	74 17                	je     3820 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3809:	8d 5e 01             	lea    0x1(%esi),%ebx
    380c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    380f:	7c cf                	jl     37e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3811:	8b 45 08             	mov    0x8(%ebp),%eax
    3814:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3818:	8d 65 f4             	lea    -0xc(%ebp),%esp
    381b:	5b                   	pop    %ebx
    381c:	5e                   	pop    %esi
    381d:	5f                   	pop    %edi
    381e:	5d                   	pop    %ebp
    381f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3820:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3823:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3825:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3829:	8d 65 f4             	lea    -0xc(%ebp),%esp
    382c:	5b                   	pop    %ebx
    382d:	5e                   	pop    %esi
    382e:	5f                   	pop    %edi
    382f:	5d                   	pop    %ebp
    3830:	c3                   	ret    
    3831:	eb 0d                	jmp    3840 <stat>
    3833:	90                   	nop
    3834:	90                   	nop
    3835:	90                   	nop
    3836:	90                   	nop
    3837:	90                   	nop
    3838:	90                   	nop
    3839:	90                   	nop
    383a:	90                   	nop
    383b:	90                   	nop
    383c:	90                   	nop
    383d:	90                   	nop
    383e:	90                   	nop
    383f:	90                   	nop

00003840 <stat>:

int
stat(char *n, struct stat *st)
{
    3840:	55                   	push   %ebp
    3841:	89 e5                	mov    %esp,%ebp
    3843:	56                   	push   %esi
    3844:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3845:	83 ec 08             	sub    $0x8,%esp
    3848:	6a 00                	push   $0x0
    384a:	ff 75 08             	pushl  0x8(%ebp)
    384d:	e8 f0 00 00 00       	call   3942 <open>
  if(fd < 0)
    3852:	83 c4 10             	add    $0x10,%esp
    3855:	85 c0                	test   %eax,%eax
    3857:	78 27                	js     3880 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3859:	83 ec 08             	sub    $0x8,%esp
    385c:	ff 75 0c             	pushl  0xc(%ebp)
    385f:	89 c3                	mov    %eax,%ebx
    3861:	50                   	push   %eax
    3862:	e8 f3 00 00 00       	call   395a <fstat>
    3867:	89 c6                	mov    %eax,%esi
  close(fd);
    3869:	89 1c 24             	mov    %ebx,(%esp)
    386c:	e8 b9 00 00 00       	call   392a <close>
  return r;
    3871:	83 c4 10             	add    $0x10,%esp
    3874:	89 f0                	mov    %esi,%eax
}
    3876:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3879:	5b                   	pop    %ebx
    387a:	5e                   	pop    %esi
    387b:	5d                   	pop    %ebp
    387c:	c3                   	ret    
    387d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3885:	eb ef                	jmp    3876 <stat+0x36>
    3887:	89 f6                	mov    %esi,%esi
    3889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003890 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3890:	55                   	push   %ebp
    3891:	89 e5                	mov    %esp,%ebp
    3893:	53                   	push   %ebx
    3894:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3897:	0f be 11             	movsbl (%ecx),%edx
    389a:	8d 42 d0             	lea    -0x30(%edx),%eax
    389d:	3c 09                	cmp    $0x9,%al
    389f:	b8 00 00 00 00       	mov    $0x0,%eax
    38a4:	77 1f                	ja     38c5 <atoi+0x35>
    38a6:	8d 76 00             	lea    0x0(%esi),%esi
    38a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    38b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    38b3:	83 c1 01             	add    $0x1,%ecx
    38b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    38ba:	0f be 11             	movsbl (%ecx),%edx
    38bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    38c0:	80 fb 09             	cmp    $0x9,%bl
    38c3:	76 eb                	jbe    38b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    38c5:	5b                   	pop    %ebx
    38c6:	5d                   	pop    %ebp
    38c7:	c3                   	ret    
    38c8:	90                   	nop
    38c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000038d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    38d0:	55                   	push   %ebp
    38d1:	89 e5                	mov    %esp,%ebp
    38d3:	56                   	push   %esi
    38d4:	53                   	push   %ebx
    38d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    38d8:	8b 45 08             	mov    0x8(%ebp),%eax
    38db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38de:	85 db                	test   %ebx,%ebx
    38e0:	7e 14                	jle    38f6 <memmove+0x26>
    38e2:	31 d2                	xor    %edx,%edx
    38e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    38e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    38ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    38ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38f2:	39 da                	cmp    %ebx,%edx
    38f4:	75 f2                	jne    38e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    38f6:	5b                   	pop    %ebx
    38f7:	5e                   	pop    %esi
    38f8:	5d                   	pop    %ebp
    38f9:	c3                   	ret    

000038fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    38fa:	b8 01 00 00 00       	mov    $0x1,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <exit>:
SYSCALL(exit)
    3902:	b8 02 00 00 00       	mov    $0x2,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <wait>:
SYSCALL(wait)
    390a:	b8 03 00 00 00       	mov    $0x3,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <pipe>:
SYSCALL(pipe)
    3912:	b8 04 00 00 00       	mov    $0x4,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <read>:
SYSCALL(read)
    391a:	b8 05 00 00 00       	mov    $0x5,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <write>:
SYSCALL(write)
    3922:	b8 10 00 00 00       	mov    $0x10,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <close>:
SYSCALL(close)
    392a:	b8 15 00 00 00       	mov    $0x15,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <kill>:
SYSCALL(kill)
    3932:	b8 06 00 00 00       	mov    $0x6,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <exec>:
SYSCALL(exec)
    393a:	b8 07 00 00 00       	mov    $0x7,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <open>:
SYSCALL(open)
    3942:	b8 0f 00 00 00       	mov    $0xf,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    

0000394a <mknod>:
SYSCALL(mknod)
    394a:	b8 11 00 00 00       	mov    $0x11,%eax
    394f:	cd 40                	int    $0x40
    3951:	c3                   	ret    

00003952 <unlink>:
SYSCALL(unlink)
    3952:	b8 12 00 00 00       	mov    $0x12,%eax
    3957:	cd 40                	int    $0x40
    3959:	c3                   	ret    

0000395a <fstat>:
SYSCALL(fstat)
    395a:	b8 08 00 00 00       	mov    $0x8,%eax
    395f:	cd 40                	int    $0x40
    3961:	c3                   	ret    

00003962 <link>:
SYSCALL(link)
    3962:	b8 13 00 00 00       	mov    $0x13,%eax
    3967:	cd 40                	int    $0x40
    3969:	c3                   	ret    

0000396a <mkdir>:
SYSCALL(mkdir)
    396a:	b8 14 00 00 00       	mov    $0x14,%eax
    396f:	cd 40                	int    $0x40
    3971:	c3                   	ret    

00003972 <chdir>:
SYSCALL(chdir)
    3972:	b8 09 00 00 00       	mov    $0x9,%eax
    3977:	cd 40                	int    $0x40
    3979:	c3                   	ret    

0000397a <dup>:
SYSCALL(dup)
    397a:	b8 0a 00 00 00       	mov    $0xa,%eax
    397f:	cd 40                	int    $0x40
    3981:	c3                   	ret    

00003982 <getpid>:
SYSCALL(getpid)
    3982:	b8 0b 00 00 00       	mov    $0xb,%eax
    3987:	cd 40                	int    $0x40
    3989:	c3                   	ret    

0000398a <sbrk>:
SYSCALL(sbrk)
    398a:	b8 0c 00 00 00       	mov    $0xc,%eax
    398f:	cd 40                	int    $0x40
    3991:	c3                   	ret    

00003992 <sleep>:
SYSCALL(sleep)
    3992:	b8 0d 00 00 00       	mov    $0xd,%eax
    3997:	cd 40                	int    $0x40
    3999:	c3                   	ret    

0000399a <uptime>:
SYSCALL(uptime)
    399a:	b8 0e 00 00 00       	mov    $0xe,%eax
    399f:	cd 40                	int    $0x40
    39a1:	c3                   	ret    

000039a2 <setVariable>:
SYSCALL(setVariable)
    39a2:	b8 17 00 00 00       	mov    $0x17,%eax
    39a7:	cd 40                	int    $0x40
    39a9:	c3                   	ret    

000039aa <getVariable>:
SYSCALL(getVariable)
    39aa:	b8 18 00 00 00       	mov    $0x18,%eax
    39af:	cd 40                	int    $0x40
    39b1:	c3                   	ret    

000039b2 <remVariable>:
SYSCALL(remVariable)
    39b2:	b8 19 00 00 00       	mov    $0x19,%eax
    39b7:	cd 40                	int    $0x40
    39b9:	c3                   	ret    

000039ba <wait2>:
SYSCALL(wait2)
    39ba:	b8 1a 00 00 00       	mov    $0x1a,%eax
    39bf:	cd 40                	int    $0x40
    39c1:	c3                   	ret    

000039c2 <set_priority>:
SYSCALL(set_priority)
    39c2:	b8 1b 00 00 00       	mov    $0x1b,%eax
    39c7:	cd 40                	int    $0x40
    39c9:	c3                   	ret    
    39ca:	66 90                	xchg   %ax,%ax
    39cc:	66 90                	xchg   %ax,%ax
    39ce:	66 90                	xchg   %ax,%ax

000039d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39d0:	55                   	push   %ebp
    39d1:	89 e5                	mov    %esp,%ebp
    39d3:	57                   	push   %edi
    39d4:	56                   	push   %esi
    39d5:	53                   	push   %ebx
    39d6:	89 c6                	mov    %eax,%esi
    39d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    39db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    39de:	85 db                	test   %ebx,%ebx
    39e0:	74 7e                	je     3a60 <printint+0x90>
    39e2:	89 d0                	mov    %edx,%eax
    39e4:	c1 e8 1f             	shr    $0x1f,%eax
    39e7:	84 c0                	test   %al,%al
    39e9:	74 75                	je     3a60 <printint+0x90>
    neg = 1;
    x = -xx;
    39eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    39ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    39f4:	f7 d8                	neg    %eax
    39f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    39f9:	31 ff                	xor    %edi,%edi
    39fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    39fe:	89 ce                	mov    %ecx,%esi
    3a00:	eb 08                	jmp    3a0a <printint+0x3a>
    3a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3a08:	89 cf                	mov    %ecx,%edi
    3a0a:	31 d2                	xor    %edx,%edx
    3a0c:	8d 4f 01             	lea    0x1(%edi),%ecx
    3a0f:	f7 f6                	div    %esi
    3a11:	0f b6 92 30 55 00 00 	movzbl 0x5530(%edx),%edx
  }while((x /= base) != 0);
    3a18:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3a1a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    3a1d:	75 e9                	jne    3a08 <printint+0x38>
  if(neg)
    3a1f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3a22:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3a25:	85 c0                	test   %eax,%eax
    3a27:	74 08                	je     3a31 <printint+0x61>
    buf[i++] = '-';
    3a29:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3a2e:	8d 4f 02             	lea    0x2(%edi),%ecx
    3a31:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    3a35:	8d 76 00             	lea    0x0(%esi),%esi
    3a38:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a3b:	83 ec 04             	sub    $0x4,%esp
    3a3e:	83 ef 01             	sub    $0x1,%edi
    3a41:	6a 01                	push   $0x1
    3a43:	53                   	push   %ebx
    3a44:	56                   	push   %esi
    3a45:	88 45 d7             	mov    %al,-0x29(%ebp)
    3a48:	e8 d5 fe ff ff       	call   3922 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3a4d:	83 c4 10             	add    $0x10,%esp
    3a50:	39 df                	cmp    %ebx,%edi
    3a52:	75 e4                	jne    3a38 <printint+0x68>
    putc(fd, buf[i]);
}
    3a54:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a57:	5b                   	pop    %ebx
    3a58:	5e                   	pop    %esi
    3a59:	5f                   	pop    %edi
    3a5a:	5d                   	pop    %ebp
    3a5b:	c3                   	ret    
    3a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3a60:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3a62:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3a69:	eb 8b                	jmp    39f6 <printint+0x26>
    3a6b:	90                   	nop
    3a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003a70 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a70:	55                   	push   %ebp
    3a71:	89 e5                	mov    %esp,%ebp
    3a73:	57                   	push   %edi
    3a74:	56                   	push   %esi
    3a75:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a76:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a79:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a7f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a82:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a85:	0f b6 1e             	movzbl (%esi),%ebx
    3a88:	83 c6 01             	add    $0x1,%esi
    3a8b:	84 db                	test   %bl,%bl
    3a8d:	0f 84 b0 00 00 00    	je     3b43 <printf+0xd3>
    3a93:	31 d2                	xor    %edx,%edx
    3a95:	eb 39                	jmp    3ad0 <printf+0x60>
    3a97:	89 f6                	mov    %esi,%esi
    3a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3aa0:	83 f8 25             	cmp    $0x25,%eax
    3aa3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3aa6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3aab:	74 18                	je     3ac5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3aad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3ab0:	83 ec 04             	sub    $0x4,%esp
    3ab3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3ab6:	6a 01                	push   $0x1
    3ab8:	50                   	push   %eax
    3ab9:	57                   	push   %edi
    3aba:	e8 63 fe ff ff       	call   3922 <write>
    3abf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3ac2:	83 c4 10             	add    $0x10,%esp
    3ac5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ac8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3acc:	84 db                	test   %bl,%bl
    3ace:	74 73                	je     3b43 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3ad0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3ad2:	0f be cb             	movsbl %bl,%ecx
    3ad5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3ad8:	74 c6                	je     3aa0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3ada:	83 fa 25             	cmp    $0x25,%edx
    3add:	75 e6                	jne    3ac5 <printf+0x55>
      if(c == 'd'){
    3adf:	83 f8 64             	cmp    $0x64,%eax
    3ae2:	0f 84 f8 00 00 00    	je     3be0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3ae8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3aee:	83 f9 70             	cmp    $0x70,%ecx
    3af1:	74 5d                	je     3b50 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3af3:	83 f8 73             	cmp    $0x73,%eax
    3af6:	0f 84 84 00 00 00    	je     3b80 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3afc:	83 f8 63             	cmp    $0x63,%eax
    3aff:	0f 84 ea 00 00 00    	je     3bef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3b05:	83 f8 25             	cmp    $0x25,%eax
    3b08:	0f 84 c2 00 00 00    	je     3bd0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b0e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3b11:	83 ec 04             	sub    $0x4,%esp
    3b14:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3b18:	6a 01                	push   $0x1
    3b1a:	50                   	push   %eax
    3b1b:	57                   	push   %edi
    3b1c:	e8 01 fe ff ff       	call   3922 <write>
    3b21:	83 c4 0c             	add    $0xc,%esp
    3b24:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3b27:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3b2a:	6a 01                	push   $0x1
    3b2c:	50                   	push   %eax
    3b2d:	57                   	push   %edi
    3b2e:	83 c6 01             	add    $0x1,%esi
    3b31:	e8 ec fd ff ff       	call   3922 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b36:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b3a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b3d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b3f:	84 db                	test   %bl,%bl
    3b41:	75 8d                	jne    3ad0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3b43:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b46:	5b                   	pop    %ebx
    3b47:	5e                   	pop    %esi
    3b48:	5f                   	pop    %edi
    3b49:	5d                   	pop    %ebp
    3b4a:	c3                   	ret    
    3b4b:	90                   	nop
    3b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3b50:	83 ec 0c             	sub    $0xc,%esp
    3b53:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b58:	6a 00                	push   $0x0
    3b5a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3b5d:	89 f8                	mov    %edi,%eax
    3b5f:	8b 13                	mov    (%ebx),%edx
    3b61:	e8 6a fe ff ff       	call   39d0 <printint>
        ap++;
    3b66:	89 d8                	mov    %ebx,%eax
    3b68:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b6b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3b6d:	83 c0 04             	add    $0x4,%eax
    3b70:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3b73:	e9 4d ff ff ff       	jmp    3ac5 <printf+0x55>
    3b78:	90                   	nop
    3b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3b80:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b83:	8b 18                	mov    (%eax),%ebx
        ap++;
    3b85:	83 c0 04             	add    $0x4,%eax
    3b88:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3b8b:	b8 28 55 00 00       	mov    $0x5528,%eax
    3b90:	85 db                	test   %ebx,%ebx
    3b92:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    3b95:	0f b6 03             	movzbl (%ebx),%eax
    3b98:	84 c0                	test   %al,%al
    3b9a:	74 23                	je     3bbf <printf+0x14f>
    3b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3ba0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ba3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3ba6:	83 ec 04             	sub    $0x4,%esp
    3ba9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3bab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bae:	50                   	push   %eax
    3baf:	57                   	push   %edi
    3bb0:	e8 6d fd ff ff       	call   3922 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3bb5:	0f b6 03             	movzbl (%ebx),%eax
    3bb8:	83 c4 10             	add    $0x10,%esp
    3bbb:	84 c0                	test   %al,%al
    3bbd:	75 e1                	jne    3ba0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3bbf:	31 d2                	xor    %edx,%edx
    3bc1:	e9 ff fe ff ff       	jmp    3ac5 <printf+0x55>
    3bc6:	8d 76 00             	lea    0x0(%esi),%esi
    3bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bd0:	83 ec 04             	sub    $0x4,%esp
    3bd3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3bd6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3bd9:	6a 01                	push   $0x1
    3bdb:	e9 4c ff ff ff       	jmp    3b2c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3be0:	83 ec 0c             	sub    $0xc,%esp
    3be3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3be8:	6a 01                	push   $0x1
    3bea:	e9 6b ff ff ff       	jmp    3b5a <printf+0xea>
    3bef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bf2:	83 ec 04             	sub    $0x4,%esp
    3bf5:	8b 03                	mov    (%ebx),%eax
    3bf7:	6a 01                	push   $0x1
    3bf9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3bfc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3bff:	50                   	push   %eax
    3c00:	57                   	push   %edi
    3c01:	e8 1c fd ff ff       	call   3922 <write>
    3c06:	e9 5b ff ff ff       	jmp    3b66 <printf+0xf6>
    3c0b:	66 90                	xchg   %ax,%ax
    3c0d:	66 90                	xchg   %ax,%ax
    3c0f:	90                   	nop

00003c10 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c10:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c11:	a1 00 5f 00 00       	mov    0x5f00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c16:	89 e5                	mov    %esp,%ebp
    3c18:	57                   	push   %edi
    3c19:	56                   	push   %esi
    3c1a:	53                   	push   %ebx
    3c1b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c1e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3c20:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c23:	39 c8                	cmp    %ecx,%eax
    3c25:	73 19                	jae    3c40 <free+0x30>
    3c27:	89 f6                	mov    %esi,%esi
    3c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3c30:	39 d1                	cmp    %edx,%ecx
    3c32:	72 1c                	jb     3c50 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c34:	39 d0                	cmp    %edx,%eax
    3c36:	73 18                	jae    3c50 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c38:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c3a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c3c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c3e:	72 f0                	jb     3c30 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c40:	39 d0                	cmp    %edx,%eax
    3c42:	72 f4                	jb     3c38 <free+0x28>
    3c44:	39 d1                	cmp    %edx,%ecx
    3c46:	73 f0                	jae    3c38 <free+0x28>
    3c48:	90                   	nop
    3c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c50:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c53:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c56:	39 d7                	cmp    %edx,%edi
    3c58:	74 19                	je     3c73 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3c5a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c5d:	8b 50 04             	mov    0x4(%eax),%edx
    3c60:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c63:	39 f1                	cmp    %esi,%ecx
    3c65:	74 23                	je     3c8a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c67:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c69:	a3 00 5f 00 00       	mov    %eax,0x5f00
}
    3c6e:	5b                   	pop    %ebx
    3c6f:	5e                   	pop    %esi
    3c70:	5f                   	pop    %edi
    3c71:	5d                   	pop    %ebp
    3c72:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3c73:	03 72 04             	add    0x4(%edx),%esi
    3c76:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c79:	8b 10                	mov    (%eax),%edx
    3c7b:	8b 12                	mov    (%edx),%edx
    3c7d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c80:	8b 50 04             	mov    0x4(%eax),%edx
    3c83:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c86:	39 f1                	cmp    %esi,%ecx
    3c88:	75 dd                	jne    3c67 <free+0x57>
    p->s.size += bp->s.size;
    3c8a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c8d:	a3 00 5f 00 00       	mov    %eax,0x5f00
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3c92:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c95:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c98:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3c9a:	5b                   	pop    %ebx
    3c9b:	5e                   	pop    %esi
    3c9c:	5f                   	pop    %edi
    3c9d:	5d                   	pop    %ebp
    3c9e:	c3                   	ret    
    3c9f:	90                   	nop

00003ca0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3ca0:	55                   	push   %ebp
    3ca1:	89 e5                	mov    %esp,%ebp
    3ca3:	57                   	push   %edi
    3ca4:	56                   	push   %esi
    3ca5:	53                   	push   %ebx
    3ca6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3ca9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3cac:	8b 15 00 5f 00 00    	mov    0x5f00,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cb2:	8d 78 07             	lea    0x7(%eax),%edi
    3cb5:	c1 ef 03             	shr    $0x3,%edi
    3cb8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3cbb:	85 d2                	test   %edx,%edx
    3cbd:	0f 84 a3 00 00 00    	je     3d66 <malloc+0xc6>
    3cc3:	8b 02                	mov    (%edx),%eax
    3cc5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3cc8:	39 cf                	cmp    %ecx,%edi
    3cca:	76 74                	jbe    3d40 <malloc+0xa0>
    3ccc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3cd2:	be 00 10 00 00       	mov    $0x1000,%esi
    3cd7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    3cde:	0f 43 f7             	cmovae %edi,%esi
    3ce1:	ba 00 80 00 00       	mov    $0x8000,%edx
    3ce6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    3cec:	0f 46 da             	cmovbe %edx,%ebx
    3cef:	eb 10                	jmp    3d01 <malloc+0x61>
    3cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cf8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3cfa:	8b 48 04             	mov    0x4(%eax),%ecx
    3cfd:	39 cf                	cmp    %ecx,%edi
    3cff:	76 3f                	jbe    3d40 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d01:	39 05 00 5f 00 00    	cmp    %eax,0x5f00
    3d07:	89 c2                	mov    %eax,%edx
    3d09:	75 ed                	jne    3cf8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3d0b:	83 ec 0c             	sub    $0xc,%esp
    3d0e:	53                   	push   %ebx
    3d0f:	e8 76 fc ff ff       	call   398a <sbrk>
  if(p == (char*)-1)
    3d14:	83 c4 10             	add    $0x10,%esp
    3d17:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d1a:	74 1c                	je     3d38 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3d1c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    3d1f:	83 ec 0c             	sub    $0xc,%esp
    3d22:	83 c0 08             	add    $0x8,%eax
    3d25:	50                   	push   %eax
    3d26:	e8 e5 fe ff ff       	call   3c10 <free>
  return freep;
    3d2b:	8b 15 00 5f 00 00    	mov    0x5f00,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3d31:	83 c4 10             	add    $0x10,%esp
    3d34:	85 d2                	test   %edx,%edx
    3d36:	75 c0                	jne    3cf8 <malloc+0x58>
        return 0;
    3d38:	31 c0                	xor    %eax,%eax
    3d3a:	eb 1c                	jmp    3d58 <malloc+0xb8>
    3d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3d40:	39 cf                	cmp    %ecx,%edi
    3d42:	74 1c                	je     3d60 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3d44:	29 f9                	sub    %edi,%ecx
    3d46:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3d49:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3d4c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3d4f:	89 15 00 5f 00 00    	mov    %edx,0x5f00
      return (void*)(p + 1);
    3d55:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3d58:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3d5b:	5b                   	pop    %ebx
    3d5c:	5e                   	pop    %esi
    3d5d:	5f                   	pop    %edi
    3d5e:	5d                   	pop    %ebp
    3d5f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d60:	8b 08                	mov    (%eax),%ecx
    3d62:	89 0a                	mov    %ecx,(%edx)
    3d64:	eb e9                	jmp    3d4f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3d66:	c7 05 00 5f 00 00 04 	movl   $0x5f04,0x5f00
    3d6d:	5f 00 00 
    3d70:	c7 05 04 5f 00 00 04 	movl   $0x5f04,0x5f04
    3d77:	5f 00 00 
    base.s.size = 0;
    3d7a:	b8 04 5f 00 00       	mov    $0x5f04,%eax
    3d7f:	c7 05 08 5f 00 00 00 	movl   $0x0,0x5f08
    3d86:	00 00 00 
    3d89:	e9 3e ff ff ff       	jmp    3ccc <malloc+0x2c>
