
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}


int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	83 ec 18             	sub    $0x18,%esp
  static char buf[100];
  int fd;
  history = historycmd();
      14:	e8 07 08 00 00       	call   820 <historycmd>
      19:	a3 90 22 00 00       	mov    %eax,0x2290
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      1e:	eb 09                	jmp    29 <main+0x29>
    if(fd >= 3){
      20:	83 f8 02             	cmp    $0x2,%eax
      23:	0f 8f e2 00 00 00    	jg     10b <main+0x10b>
{
  static char buf[100];
  int fd;
  history = historycmd();
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      29:	83 ec 08             	sub    $0x8,%esp
      2c:	6a 02                	push   $0x2
      2e:	68 a8 19 00 00       	push   $0x19a8
      33:	e8 7a 14 00 00       	call   14b2 <open>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	79 e1                	jns    20 <main+0x20>

    int wtime = -1;
    int rtime = -1;
    int iotime = -1;

    wait2(chPID, &wtime, &rtime, &iotime);
      3f:	8d 7d e4             	lea    -0x1c(%ebp),%edi
      42:	8d 75 e0             	lea    -0x20(%ebp),%esi
      45:	eb 55                	jmp    9c <main+0x9c>
      47:	89 f6                	mov    %esi,%esi
      49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 15 14 00 00       	call   146a <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
int
fork1(void)
{
  int pid;

  pid = fork();
      58:	89 c3                	mov    %eax,%ebx
  if(pid == -1)
      5a:	0f 84 c1 00 00 00    	je     121 <main+0x121>
      continue;
    }

    int chPID = fork1();
    
    addCmdToHistory(buf);
      60:	83 ec 0c             	sub    $0xc,%esp
      63:	68 20 22 00 00       	push   $0x2220
      68:	e8 73 01 00 00       	call   1e0 <addCmdToHistory>

    if(chPID == 0){
      6d:	83 c4 10             	add    $0x10,%esp
      70:	85 db                	test   %ebx,%ebx
      72:	0f 84 b6 00 00 00    	je     12e <main+0x12e>

    int wtime = -1;
    int rtime = -1;
    int iotime = -1;

    wait2(chPID, &wtime, &rtime, &iotime);
      78:	8d 45 dc             	lea    -0x24(%ebp),%eax
      7b:	57                   	push   %edi
      7c:	56                   	push   %esi

    if(chPID == 0){
        runcmd(parsecmd(buf));
    }

    int wtime = -1;
      7d:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%ebp)
    int rtime = -1;
      84:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
    int iotime = -1;

    wait2(chPID, &wtime, &rtime, &iotime);
      8b:	50                   	push   %eax
      8c:	53                   	push   %ebx
        runcmd(parsecmd(buf));
    }

    int wtime = -1;
    int rtime = -1;
    int iotime = -1;
      8d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)

    wait2(chPID, &wtime, &rtime, &iotime);
      94:	e8 91 14 00 00       	call   152a <wait2>
      99:	83 c4 10             	add    $0x10,%esp
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      9c:	83 ec 08             	sub    $0x8,%esp
      9f:	6a 64                	push   $0x64
      a1:	68 20 22 00 00       	push   $0x2220
      a6:	e8 a5 00 00 00       	call   150 <getcmd>
      ab:	83 c4 10             	add    $0x10,%esp
      ae:	85 c0                	test   %eax,%eax
      b0:	78 6a                	js     11c <main+0x11c>

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      b2:	80 3d 20 22 00 00 63 	cmpb   $0x63,0x2220
      b9:	75 95                	jne    50 <main+0x50>
      bb:	80 3d 21 22 00 00 64 	cmpb   $0x64,0x2221
      c2:	75 8c                	jne    50 <main+0x50>
      c4:	80 3d 22 22 00 00 20 	cmpb   $0x20,0x2222
      cb:	75 83                	jne    50 <main+0x50>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      cd:	83 ec 0c             	sub    $0xc,%esp
      d0:	68 20 22 00 00       	push   $0x2220
      d5:	e8 d6 11 00 00       	call   12b0 <strlen>
      if(chdir(buf+3) < 0)
      da:	c7 04 24 23 22 00 00 	movl   $0x2223,(%esp)
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      e1:	c6 80 1f 22 00 00 00 	movb   $0x0,0x221f(%eax)
      if(chdir(buf+3) < 0)
      e8:	e8 f5 13 00 00       	call   14e2 <chdir>
      ed:	83 c4 10             	add    $0x10,%esp
      f0:	85 c0                	test   %eax,%eax
      f2:	79 a8                	jns    9c <main+0x9c>
        printf(2, "cannot cd %s\n", buf+3);
      f4:	50                   	push   %eax
      f5:	68 23 22 00 00       	push   $0x2223
      fa:	68 b0 19 00 00       	push   $0x19b0
      ff:	6a 02                	push   $0x2
     101:	e8 da 14 00 00       	call   15e0 <printf>
     106:	83 c4 10             	add    $0x10,%esp
     109:	eb 91                	jmp    9c <main+0x9c>
  int fd;
  history = historycmd();
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     10b:	83 ec 0c             	sub    $0xc,%esp
     10e:	50                   	push   %eax
     10f:	e8 86 13 00 00       	call   149a <close>
      break;
     114:	83 c4 10             	add    $0x10,%esp
     117:	e9 23 ff ff ff       	jmp    3f <main+0x3f>
    int rtime = -1;
    int iotime = -1;

    wait2(chPID, &wtime, &rtime, &iotime);
  }
  exit();
     11c:	e8 51 13 00 00       	call   1472 <exit>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     121:	83 ec 0c             	sub    $0xc,%esp
     124:	68 03 19 00 00       	push   $0x1903
     129:	e8 72 00 00 00       	call   1a0 <panic>
    int chPID = fork1();
    
    addCmdToHistory(buf);

    if(chPID == 0){
        runcmd(parsecmd(buf));
     12e:	83 ec 0c             	sub    $0xc,%esp
     131:	68 20 22 00 00       	push   $0x2220
     136:	e8 45 0e 00 00       	call   f80 <parsecmd>
     13b:	89 04 24             	mov    %eax,(%esp)
     13e:	e8 6d 01 00 00       	call   2b0 <runcmd>
     143:	66 90                	xchg   %ax,%ax
     145:	66 90                	xchg   %ax,%ax
     147:	66 90                	xchg   %ax,%ax
     149:	66 90                	xchg   %ax,%ax
     14b:	66 90                	xchg   %ax,%ax
     14d:	66 90                	xchg   %ax,%ax
     14f:	90                   	nop

00000150 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	56                   	push   %esi
     154:	53                   	push   %ebx
     155:	8b 75 0c             	mov    0xc(%ebp),%esi
     158:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     15b:	83 ec 08             	sub    $0x8,%esp
     15e:	68 00 19 00 00       	push   $0x1900
     163:	6a 02                	push   $0x2
     165:	e8 76 14 00 00       	call   15e0 <printf>
  memset(buf, 0, nbuf);
     16a:	83 c4 0c             	add    $0xc,%esp
     16d:	56                   	push   %esi
     16e:	6a 00                	push   $0x0
     170:	53                   	push   %ebx
     171:	e8 6a 11 00 00       	call   12e0 <memset>
  gets(buf, nbuf);
     176:	58                   	pop    %eax
     177:	5a                   	pop    %edx
     178:	56                   	push   %esi
     179:	53                   	push   %ebx
     17a:	e8 c1 11 00 00       	call   1340 <gets>
     17f:	83 c4 10             	add    $0x10,%esp
     182:	31 c0                	xor    %eax,%eax
     184:	80 3b 00             	cmpb   $0x0,(%ebx)
     187:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     18a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     18d:	f7 d8                	neg    %eax
     18f:	5b                   	pop    %ebx
     190:	5e                   	pop    %esi
     191:	5d                   	pop    %ebp
     192:	c3                   	ret    
     193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <panic>:
  exit();
}

void
panic(char *s)
{
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     1a6:	ff 75 08             	pushl  0x8(%ebp)
     1a9:	68 a4 19 00 00       	push   $0x19a4
     1ae:	6a 02                	push   $0x2
     1b0:	e8 2b 14 00 00       	call   15e0 <printf>
  exit();
     1b5:	e8 b8 12 00 00       	call   1472 <exit>
     1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <fork1>:
}

int
fork1(void)
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     1c6:	e8 9f 12 00 00       	call   146a <fork>
  if(pid == -1)
     1cb:	83 f8 ff             	cmp    $0xffffffff,%eax
     1ce:	74 02                	je     1d2 <fork1+0x12>
    panic("fork");
  return pid;
}
     1d0:	c9                   	leave  
     1d1:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     1d2:	83 ec 0c             	sub    $0xc,%esp
     1d5:	68 03 19 00 00       	push   $0x1903
     1da:	e8 c1 ff ff ff       	call   1a0 <panic>
     1df:	90                   	nop

000001e0 <addCmdToHistory>:
  return pid;
}

void
addCmdToHistory(char *cmdString)
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	56                   	push   %esi
     1e4:	53                   	push   %ebx
     1e5:	83 ec 4c             	sub    $0x4c,%esp
     1e8:	8b 75 08             	mov    0x8(%ebp),%esi
  char *commandName = malloc(strlen(cmdString));
     1eb:	56                   	push   %esi
     1ec:	e8 bf 10 00 00       	call   12b0 <strlen>
     1f1:	89 04 24             	mov    %eax,(%esp)
     1f4:	e8 17 16 00 00       	call   1810 <malloc>
  strcpy(commandName, cmdString);
     1f9:	5a                   	pop    %edx
     1fa:	59                   	pop    %ecx
     1fb:	56                   	push   %esi
     1fc:	50                   	push   %eax
}

void
addCmdToHistory(char *cmdString)
{
  char *commandName = malloc(strlen(cmdString));
     1fd:	89 c3                	mov    %eax,%ebx
  strcpy(commandName, cmdString);
     1ff:	e8 cc 0f 00 00       	call   11d0 <strcpy>
  if(history->lastFreeIndex == (MAX_HISTORY)){
     204:	8b 15 90 22 00 00    	mov    0x2290,%edx
     20a:	83 c4 10             	add    $0x10,%esp
     20d:	8b 42 44             	mov    0x44(%edx),%eax
     210:	83 f8 10             	cmp    $0x10,%eax
     213:	74 1b                	je     230 <addCmdToHistory+0x50>
      history->commands[i]=tempCmdStrings[i];
    }
    history->commands[history->lastFreeIndex-1] = commandName;
  }
  else{
    history->commands[history->lastFreeIndex] = commandName;
     215:	89 5c 82 04          	mov    %ebx,0x4(%edx,%eax,4)
    history->lastFreeIndex++;
     219:	83 c0 01             	add    $0x1,%eax
     21c:	89 42 44             	mov    %eax,0x44(%edx)
  }
}
     21f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     222:	5b                   	pop    %ebx
     223:	5e                   	pop    %esi
     224:	5d                   	pop    %ebp
     225:	c3                   	ret    
     226:	8d 76 00             	lea    0x0(%esi),%esi
     229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     230:	31 c0                	xor    %eax,%eax
     232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  char *commandName = malloc(strlen(cmdString));
  strcpy(commandName, cmdString);
  if(history->lastFreeIndex == (MAX_HISTORY)){
    char *tempCmdStrings[MAX_HISTORY-1];
    for(int i=1 ,j=0; j<(MAX_HISTORY-1); i++, j++){
      tempCmdStrings[j] = history->commands[i];
     238:	8b 4c 82 08          	mov    0x8(%edx,%eax,4),%ecx
     23c:	89 4c 85 bc          	mov    %ecx,-0x44(%ebp,%eax,4)
{
  char *commandName = malloc(strlen(cmdString));
  strcpy(commandName, cmdString);
  if(history->lastFreeIndex == (MAX_HISTORY)){
    char *tempCmdStrings[MAX_HISTORY-1];
    for(int i=1 ,j=0; j<(MAX_HISTORY-1); i++, j++){
     240:	83 c0 01             	add    $0x1,%eax
     243:	83 f8 0f             	cmp    $0xf,%eax
     246:	75 f0                	jne    238 <addCmdToHistory+0x58>
     248:	31 c0                	xor    %eax,%eax
     24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      tempCmdStrings[j] = history->commands[i];
    }
    for(int i=0; i<(MAX_HISTORY-1); i++){
      history->commands[i]=tempCmdStrings[i];
     250:	8b 4c 85 bc          	mov    -0x44(%ebp,%eax,4),%ecx
     254:	89 4c 82 04          	mov    %ecx,0x4(%edx,%eax,4)
  if(history->lastFreeIndex == (MAX_HISTORY)){
    char *tempCmdStrings[MAX_HISTORY-1];
    for(int i=1 ,j=0; j<(MAX_HISTORY-1); i++, j++){
      tempCmdStrings[j] = history->commands[i];
    }
    for(int i=0; i<(MAX_HISTORY-1); i++){
     258:	83 c0 01             	add    $0x1,%eax
     25b:	83 f8 0f             	cmp    $0xf,%eax
     25e:	75 f0                	jne    250 <addCmdToHistory+0x70>
      history->commands[i]=tempCmdStrings[i];
    }
    history->commands[history->lastFreeIndex-1] = commandName;
     260:	89 5a 40             	mov    %ebx,0x40(%edx)
  }
  else{
    history->commands[history->lastFreeIndex] = commandName;
    history->lastFreeIndex++;
  }
}
     263:	8d 65 f8             	lea    -0x8(%ebp),%esp
     266:	5b                   	pop    %ebx
     267:	5e                   	pop    %esi
     268:	5d                   	pop    %ebp
     269:	c3                   	ret    
     26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <showHistory>:

void
showHistory()
{
    for(int i=0; i<history->lastFreeIndex; i++){
     270:	a1 90 22 00 00       	mov    0x2290,%eax
     275:	8b 50 44             	mov    0x44(%eax),%edx
     278:	85 d2                	test   %edx,%edx
     27a:	7e 32                	jle    2ae <showHistory+0x3e>
  }
}

void
showHistory()
{
     27c:	55                   	push   %ebp
     27d:	89 e5                	mov    %esp,%ebp
     27f:	53                   	push   %ebx
     280:	31 db                	xor    %ebx,%ebx
     282:	83 ec 04             	sub    $0x4,%esp
     285:	8d 76 00             	lea    0x0(%esi),%esi
    for(int i=0; i<history->lastFreeIndex; i++){
      printf(2, "%d. %s", i+1, history->commands[i]);
     288:	8b 44 98 04          	mov    0x4(%eax,%ebx,4),%eax
     28c:	83 c3 01             	add    $0x1,%ebx
     28f:	50                   	push   %eax
     290:	53                   	push   %ebx
     291:	68 08 19 00 00       	push   $0x1908
     296:	6a 02                	push   $0x2
     298:	e8 43 13 00 00       	call   15e0 <printf>
}

void
showHistory()
{
    for(int i=0; i<history->lastFreeIndex; i++){
     29d:	a1 90 22 00 00       	mov    0x2290,%eax
     2a2:	83 c4 10             	add    $0x10,%esp
     2a5:	39 58 44             	cmp    %ebx,0x44(%eax)
     2a8:	7f de                	jg     288 <showHistory+0x18>
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}
     2aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2ad:	c9                   	leave  
     2ae:	f3 c3                	repz ret 

000002b0 <runcmd>:


// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     2b0:	55                   	push   %ebp
     2b1:	89 e5                	mov    %esp,%ebp
     2b3:	53                   	push   %ebx
     2b4:	83 ec 14             	sub    $0x14,%esp
     2b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  struct setvariablecmd *svcmd;
  // struct getvariablecmd *gvcmd;

  if(cmd == 0)
     2ba:	85 db                	test   %ebx,%ebx
     2bc:	74 42                	je     300 <runcmd+0x50>
    exit();

  switch(cmd->type){
     2be:	83 3b 07             	cmpl   $0x7,(%ebx)
     2c1:	0f 87 20 01 00 00    	ja     3e7 <runcmd+0x137>
     2c7:	8b 03                	mov    (%ebx),%eax
     2c9:	ff 24 85 c0 19 00 00 	jmp    *0x19c0(,%eax,4)
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     2d0:	8b 43 04             	mov    0x4(%ebx),%eax
     2d3:	85 c0                	test   %eax,%eax
     2d5:	74 29                	je     300 <runcmd+0x50>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     2d7:	8d 53 04             	lea    0x4(%ebx),%edx
     2da:	51                   	push   %ecx
     2db:	51                   	push   %ecx
     2dc:	52                   	push   %edx
     2dd:	50                   	push   %eax
     2de:	e8 c7 11 00 00       	call   14aa <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     2e3:	83 c4 0c             	add    $0xc,%esp
     2e6:	ff 73 04             	pushl  0x4(%ebx)
     2e9:	68 16 19 00 00       	push   $0x1916
     2ee:	6a 02                	push   $0x2
     2f0:	e8 eb 12 00 00       	call   15e0 <printf>
    break;
     2f5:	83 c4 10             	add    $0x10,%esp
     2f8:	90                   	nop
     2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct redircmd *rcmd;
  struct setvariablecmd *svcmd;
  // struct getvariablecmd *gvcmd;

  if(cmd == 0)
    exit();
     300:	e8 6d 11 00 00       	call   1472 <exit>
    showHistory();
    break;

  case SETVAR:
  	svcmd = (struct setvariablecmd*)cmd;
  	struct variable* varSet = svcmd->var;
     305:	8b 43 04             	mov    0x4(%ebx),%eax
  	setVariable(varSet->name, varSet->value);
     308:	52                   	push   %edx
     309:	52                   	push   %edx
     30a:	8d 50 20             	lea    0x20(%eax),%edx
     30d:	52                   	push   %edx
     30e:	50                   	push   %eax
     30f:	e8 fe 11 00 00       	call   1512 <setVariable>
  	break;
     314:	83 c4 10             	add    $0x10,%esp
     317:	eb e7                	jmp    300 <runcmd+0x50>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     319:	83 ec 0c             	sub    $0xc,%esp
     31c:	ff 73 14             	pushl  0x14(%ebx)
     31f:	e8 76 11 00 00       	call   149a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     324:	58                   	pop    %eax
     325:	5a                   	pop    %edx
     326:	ff 73 10             	pushl  0x10(%ebx)
     329:	ff 73 08             	pushl  0x8(%ebx)
     32c:	e8 81 11 00 00       	call   14b2 <open>
     331:	83 c4 10             	add    $0x10,%esp
     334:	85 c0                	test   %eax,%eax
     336:	0f 88 00 01 00 00    	js     43c <runcmd+0x18c>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     33c:	83 ec 0c             	sub    $0xc,%esp
     33f:	ff 73 04             	pushl  0x4(%ebx)
     342:	e8 69 ff ff ff       	call   2b0 <runcmd>
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     347:	8d 45 f0             	lea    -0x10(%ebp),%eax
     34a:	83 ec 0c             	sub    $0xc,%esp
     34d:	50                   	push   %eax
     34e:	e8 2f 11 00 00       	call   1482 <pipe>
     353:	83 c4 10             	add    $0x10,%esp
     356:	85 c0                	test   %eax,%eax
     358:	0f 88 d1 00 00 00    	js     42f <runcmd+0x17f>
int
fork1(void)
{
  int pid;

  pid = fork();
     35e:	e8 07 11 00 00       	call   146a <fork>
  if(pid == -1)
     363:	83 f8 ff             	cmp    $0xffffffff,%eax
     366:	0f 84 88 00 00 00    	je     3f4 <runcmd+0x144>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     36c:	85 c0                	test   %eax,%eax
     36e:	0f 84 dd 00 00 00    	je     451 <runcmd+0x1a1>
int
fork1(void)
{
  int pid;

  pid = fork();
     374:	e8 f1 10 00 00       	call   146a <fork>
  if(pid == -1)
     379:	83 f8 ff             	cmp    $0xffffffff,%eax
     37c:	74 76                	je     3f4 <runcmd+0x144>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     37e:	85 c0                	test   %eax,%eax
     380:	74 7f                	je     401 <runcmd+0x151>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     382:	83 ec 0c             	sub    $0xc,%esp
     385:	ff 75 f0             	pushl  -0x10(%ebp)
     388:	e8 0d 11 00 00       	call   149a <close>
    close(p[1]);
     38d:	59                   	pop    %ecx
     38e:	ff 75 f4             	pushl  -0xc(%ebp)
     391:	e8 04 11 00 00       	call   149a <close>
    wait();
     396:	e8 df 10 00 00       	call   147a <wait>
    wait();
     39b:	e8 da 10 00 00       	call   147a <wait>
    break;
     3a0:	83 c4 10             	add    $0x10,%esp
     3a3:	e9 58 ff ff ff       	jmp    300 <runcmd+0x50>
int
fork1(void)
{
  int pid;

  pid = fork();
     3a8:	e8 bd 10 00 00       	call   146a <fork>
  if(pid == -1)
     3ad:	83 f8 ff             	cmp    $0xffffffff,%eax
     3b0:	74 42                	je     3f4 <runcmd+0x144>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     3b2:	85 c0                	test   %eax,%eax
     3b4:	74 86                	je     33c <runcmd+0x8c>
      runcmd(lcmd->left);
    wait();
     3b6:	e8 bf 10 00 00       	call   147a <wait>
    runcmd(lcmd->right);
     3bb:	83 ec 0c             	sub    $0xc,%esp
     3be:	ff 73 08             	pushl  0x8(%ebx)
     3c1:	e8 ea fe ff ff       	call   2b0 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     3c6:	e8 9f 10 00 00       	call   146a <fork>
  if(pid == -1)
     3cb:	83 f8 ff             	cmp    $0xffffffff,%eax
     3ce:	74 24                	je     3f4 <runcmd+0x144>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     3d0:	85 c0                	test   %eax,%eax
     3d2:	0f 85 28 ff ff ff    	jne    300 <runcmd+0x50>
     3d8:	e9 5f ff ff ff       	jmp    33c <runcmd+0x8c>
      runcmd(bcmd->cmd);
    break;

  case HISTORY:
    showHistory();
     3dd:	e8 8e fe ff ff       	call   270 <showHistory>
    break;
     3e2:	e9 19 ff ff ff       	jmp    300 <runcmd+0x50>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     3e7:	83 ec 0c             	sub    $0xc,%esp
     3ea:	68 0f 19 00 00       	push   $0x190f
     3ef:	e8 ac fd ff ff       	call   1a0 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     3f4:	83 ec 0c             	sub    $0xc,%esp
     3f7:	68 03 19 00 00       	push   $0x1903
     3fc:	e8 9f fd ff ff       	call   1a0 <panic>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     401:	83 ec 0c             	sub    $0xc,%esp
     404:	6a 00                	push   $0x0
     406:	e8 8f 10 00 00       	call   149a <close>
      dup(p[0]);
     40b:	58                   	pop    %eax
     40c:	ff 75 f0             	pushl  -0x10(%ebp)
     40f:	e8 d6 10 00 00       	call   14ea <dup>
      close(p[0]);
     414:	58                   	pop    %eax
     415:	ff 75 f0             	pushl  -0x10(%ebp)
     418:	e8 7d 10 00 00       	call   149a <close>
      close(p[1]);
     41d:	58                   	pop    %eax
     41e:	ff 75 f4             	pushl  -0xc(%ebp)
     421:	e8 74 10 00 00       	call   149a <close>
      runcmd(pcmd->right);
     426:	58                   	pop    %eax
     427:	ff 73 08             	pushl  0x8(%ebx)
     42a:	e8 81 fe ff ff       	call   2b0 <runcmd>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     42f:	83 ec 0c             	sub    $0xc,%esp
     432:	68 36 19 00 00       	push   $0x1936
     437:	e8 64 fd ff ff       	call   1a0 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     43c:	50                   	push   %eax
     43d:	ff 73 08             	pushl  0x8(%ebx)
     440:	68 26 19 00 00       	push   $0x1926
     445:	6a 02                	push   $0x2
     447:	e8 94 11 00 00       	call   15e0 <printf>
      exit();
     44c:	e8 21 10 00 00       	call   1472 <exit>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     451:	83 ec 0c             	sub    $0xc,%esp
     454:	6a 01                	push   $0x1
     456:	e8 3f 10 00 00       	call   149a <close>
      dup(p[1]);
     45b:	58                   	pop    %eax
     45c:	ff 75 f4             	pushl  -0xc(%ebp)
     45f:	e8 86 10 00 00       	call   14ea <dup>
      close(p[0]);
     464:	58                   	pop    %eax
     465:	ff 75 f0             	pushl  -0x10(%ebp)
     468:	e8 2d 10 00 00       	call   149a <close>
      close(p[1]);
     46d:	5a                   	pop    %edx
     46e:	ff 75 f4             	pushl  -0xc(%ebp)
     471:	e8 24 10 00 00       	call   149a <close>
      runcmd(pcmd->left);
     476:	59                   	pop    %ecx
     477:	ff 73 04             	pushl  0x4(%ebx)
     47a:	e8 31 fe ff ff       	call   2b0 <runcmd>
     47f:	90                   	nop

00000480 <isInString>:
    for(int i=0; i<history->lastFreeIndex; i++){
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}

int isInString(char* s, char c){
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	57                   	push   %edi
     484:	56                   	push   %esi
     485:	53                   	push   %ebx
  for(int i = 0; i< strlen(s); i++){
     486:	31 db                	xor    %ebx,%ebx
    for(int i=0; i<history->lastFreeIndex; i++){
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}

int isInString(char* s, char c){
     488:	83 ec 0c             	sub    $0xc,%esp
     48b:	8b 75 08             	mov    0x8(%ebp),%esi
     48e:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
  for(int i = 0; i< strlen(s); i++){
     492:	eb 0e                	jmp    4a2 <isInString+0x22>
     494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(s[i] == c){
     498:	89 f8                	mov    %edi,%eax
     49a:	38 04 1e             	cmp    %al,(%esi,%ebx,1)
     49d:	74 21                	je     4c0 <isInString+0x40>
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}

int isInString(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
     49f:	83 c3 01             	add    $0x1,%ebx
     4a2:	83 ec 0c             	sub    $0xc,%esp
     4a5:	56                   	push   %esi
     4a6:	e8 05 0e 00 00       	call   12b0 <strlen>
     4ab:	83 c4 10             	add    $0x10,%esp
     4ae:	39 d8                	cmp    %ebx,%eax
     4b0:	77 e6                	ja     498 <isInString+0x18>
    if(s[i] == c){
      return 1;
    }
  }
  return 0;
}
     4b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return 1;
    }
  }
  return 0;
     4b5:	31 c0                	xor    %eax,%eax
}
     4b7:	5b                   	pop    %ebx
     4b8:	5e                   	pop    %esi
     4b9:	5f                   	pop    %edi
     4ba:	5d                   	pop    %ebp
     4bb:	c3                   	ret    
     4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
}

int isInString(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return 1;
     4c3:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  return 0;
}
     4c8:	5b                   	pop    %ebx
     4c9:	5e                   	pop    %esi
     4ca:	5f                   	pop    %edi
     4cb:	5d                   	pop    %ebp
     4cc:	c3                   	ret    
     4cd:	8d 76 00             	lea    0x0(%esi),%esi

000004d0 <indexOf>:

int indexOf(char* s, char c){
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	57                   	push   %edi
     4d4:	56                   	push   %esi
     4d5:	53                   	push   %ebx
  for(int i = 0; i< strlen(s); i++){
     4d6:	31 db                	xor    %ebx,%ebx
    }
  }
  return 0;
}

int indexOf(char* s, char c){
     4d8:	83 ec 0c             	sub    $0xc,%esp
     4db:	8b 75 08             	mov    0x8(%ebp),%esi
     4de:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
  for(int i = 0; i< strlen(s); i++){
     4e2:	eb 0e                	jmp    4f2 <indexOf+0x22>
     4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(s[i] == c){
     4e8:	89 f8                	mov    %edi,%eax
     4ea:	38 04 1e             	cmp    %al,(%esi,%ebx,1)
     4ed:	74 21                	je     510 <indexOf+0x40>
  }
  return 0;
}

int indexOf(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
     4ef:	83 c3 01             	add    $0x1,%ebx
     4f2:	83 ec 0c             	sub    $0xc,%esp
     4f5:	56                   	push   %esi
     4f6:	e8 b5 0d 00 00       	call   12b0 <strlen>
     4fb:	83 c4 10             	add    $0x10,%esp
     4fe:	39 d8                	cmp    %ebx,%eax
     500:	77 e6                	ja     4e8 <indexOf+0x18>
    if(s[i] == c){
      return i;
    }
  }
  return -1;
}
     502:	8d 65 f4             	lea    -0xc(%ebp),%esp
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return i;
    }
  }
  return -1;
     505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     50a:	5b                   	pop    %ebx
     50b:	5e                   	pop    %esi
     50c:	5f                   	pop    %edi
     50d:	5d                   	pop    %ebp
     50e:	c3                   	ret    
     50f:	90                   	nop
     510:	8d 65 f4             	lea    -0xc(%ebp),%esp
     513:	89 d8                	mov    %ebx,%eax
     515:	5b                   	pop    %ebx
     516:	5e                   	pop    %esi
     517:	5f                   	pop    %edi
     518:	5d                   	pop    %ebp
     519:	c3                   	ret    
     51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000520 <getVariableName>:

char* getVariableName(char* s){
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	57                   	push   %edi
     524:	56                   	push   %esi
     525:	53                   	push   %ebx
     526:	83 ec 0c             	sub    $0xc,%esp
     529:	8b 75 08             	mov    0x8(%ebp),%esi
  int i = 0;
  while(s[i] != '='){
     52c:	80 3e 3d             	cmpb   $0x3d,(%esi)
     52f:	74 49                	je     57a <getVariableName+0x5a>
     531:	31 c0                	xor    %eax,%eax
     533:	eb 05                	jmp    53a <getVariableName+0x1a>
     535:	8d 76 00             	lea    0x0(%esi),%esi
    i++;
     538:	89 d8                	mov    %ebx,%eax
  return -1;
}

char* getVariableName(char* s){
  int i = 0;
  while(s[i] != '='){
     53a:	80 7c 06 01 3d       	cmpb   $0x3d,0x1(%esi,%eax,1)
    i++;
     53f:	8d 58 01             	lea    0x1(%eax),%ebx
  return -1;
}

char* getVariableName(char* s){
  int i = 0;
  while(s[i] != '='){
     542:	89 df                	mov    %ebx,%edi
     544:	75 f2                	jne    538 <getVariableName+0x18>
    i++;
  }
  char* name = malloc(i+1);
     546:	83 ec 0c             	sub    $0xc,%esp
     549:	83 c0 02             	add    $0x2,%eax
     54c:	50                   	push   %eax
     54d:	e8 be 12 00 00       	call   1810 <malloc>
     552:	83 c4 10             	add    $0x10,%esp
     555:	31 d2                	xor    %edx,%edx
     557:	89 f6                	mov    %esi,%esi
     559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(int j=0; j<i; j++){
    name[j] = s[j];
     560:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     564:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* name = malloc(i+1);
  for(int j=0; j<i; j++){
     567:	83 c2 01             	add    $0x1,%edx
     56a:	39 d3                	cmp    %edx,%ebx
     56c:	75 f2                	jne    560 <getVariableName+0x40>
    name[j] = s[j];
  }
  name[i]='\n';
     56e:	c6 04 38 0a          	movb   $0xa,(%eax,%edi,1)
  return name;
}
     572:	8d 65 f4             	lea    -0xc(%ebp),%esp
     575:	5b                   	pop    %ebx
     576:	5e                   	pop    %esi
     577:	5f                   	pop    %edi
     578:	5d                   	pop    %ebp
     579:	c3                   	ret    
char* getVariableName(char* s){
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* name = malloc(i+1);
     57a:	83 ec 0c             	sub    $0xc,%esp
  return -1;
}

char* getVariableName(char* s){
  int i = 0;
  while(s[i] != '='){
     57d:	31 ff                	xor    %edi,%edi
    i++;
  }
  char* name = malloc(i+1);
     57f:	6a 01                	push   $0x1
     581:	e8 8a 12 00 00       	call   1810 <malloc>
     586:	83 c4 10             	add    $0x10,%esp
     589:	eb e3                	jmp    56e <getVariableName+0x4e>
     58b:	90                   	nop
     58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <getVariableValue>:
  }
  name[i]='\n';
  return name;
}

char* getVariableValue(char* s){
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	57                   	push   %edi
     594:	56                   	push   %esi
     595:	53                   	push   %ebx
     596:	83 ec 1c             	sub    $0x1c,%esp
     599:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i = 0;
  while(s[i] != '='){
     59c:	80 3f 3d             	cmpb   $0x3d,(%edi)
     59f:	74 64                	je     605 <getVariableValue+0x75>
     5a1:	31 db                	xor    %ebx,%ebx
     5a3:	eb 05                	jmp    5aa <getVariableValue+0x1a>
     5a5:	8d 76 00             	lea    0x0(%esi),%esi
    i++;
     5a8:	89 c3                	mov    %eax,%ebx
  return name;
}

char* getVariableValue(char* s){
  int i = 0;
  while(s[i] != '='){
     5aa:	80 7c 1f 01 3d       	cmpb   $0x3d,0x1(%edi,%ebx,1)
    i++;
     5af:	8d 43 01             	lea    0x1(%ebx),%eax
  return name;
}

char* getVariableValue(char* s){
  int i = 0;
  while(s[i] != '='){
     5b2:	89 c6                	mov    %eax,%esi
     5b4:	75 f2                	jne    5a8 <getVariableValue+0x18>
     5b6:	83 c3 02             	add    $0x2,%ebx
    i++;
  }
  char* value = malloc(strlen(s)-i-1);
     5b9:	83 ec 0c             	sub    $0xc,%esp
     5bc:	57                   	push   %edi
     5bd:	e8 ee 0c 00 00       	call   12b0 <strlen>
     5c2:	83 e8 01             	sub    $0x1,%eax
     5c5:	29 f0                	sub    %esi,%eax
     5c7:	89 04 24             	mov    %eax,(%esp)
     5ca:	e8 41 12 00 00       	call   1810 <malloc>
  for(int j=i+1, k=0; j<strlen(s); j++, k++){
    value[k] = s[j];
     5cf:	89 c6                	mov    %eax,%esi
char* getVariableValue(char* s){
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* value = malloc(strlen(s)-i-1);
     5d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(int j=i+1, k=0; j<strlen(s); j++, k++){
     5d4:	83 c4 10             	add    $0x10,%esp
    value[k] = s[j];
     5d7:	29 de                	sub    %ebx,%esi
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* value = malloc(strlen(s)-i-1);
  for(int j=i+1, k=0; j<strlen(s); j++, k++){
     5d9:	eb 0f                	jmp    5ea <getVariableValue+0x5a>
     5db:	90                   	nop
     5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    value[k] = s[j];
     5e0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
     5e4:	88 04 1e             	mov    %al,(%esi,%ebx,1)
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* value = malloc(strlen(s)-i-1);
  for(int j=i+1, k=0; j<strlen(s); j++, k++){
     5e7:	83 c3 01             	add    $0x1,%ebx
     5ea:	83 ec 0c             	sub    $0xc,%esp
     5ed:	57                   	push   %edi
     5ee:	e8 bd 0c 00 00       	call   12b0 <strlen>
     5f3:	83 c4 10             	add    $0x10,%esp
     5f6:	39 d8                	cmp    %ebx,%eax
     5f8:	77 e6                	ja     5e0 <getVariableValue+0x50>
    value[k] = s[j];
  }
  return value;
}
     5fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     600:	5b                   	pop    %ebx
     601:	5e                   	pop    %esi
     602:	5f                   	pop    %edi
     603:	5d                   	pop    %ebp
     604:	c3                   	ret    
  return name;
}

char* getVariableValue(char* s){
  int i = 0;
  while(s[i] != '='){
     605:	bb 01 00 00 00       	mov    $0x1,%ebx
     60a:	31 f6                	xor    %esi,%esi
     60c:	eb ab                	jmp    5b9 <getVariableValue+0x29>
     60e:	66 90                	xchg   %ax,%ax

00000610 <getVariableByDollarIndex>:
  }
  return value;
}

char*
getVariableByDollarIndex(char* s, int dollarIndex){
     610:	55                   	push   %ebp
     611:	89 e5                	mov    %esp,%ebp
     613:	57                   	push   %edi
     614:	56                   	push   %esi
     615:	53                   	push   %ebx
     616:	83 ec 1c             	sub    $0x1c,%esp
     619:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     61c:	8b 75 08             	mov    0x8(%ebp),%esi
  int i =  dollarIndex + 1;
  while(s[i] != '\n' && s[i] != ' ' && s[i] != '$'){
     61f:	0f b6 54 1e 01       	movzbl 0x1(%esi,%ebx,1),%edx
  return value;
}

char*
getVariableByDollarIndex(char* s, int dollarIndex){
  int i =  dollarIndex + 1;
     624:	8d 7b 01             	lea    0x1(%ebx),%edi
     627:	89 f8                	mov    %edi,%eax
  while(s[i] != '\n' && s[i] != ' ' && s[i] != '$'){
     629:	89 d1                	mov    %edx,%ecx
     62b:	83 e1 fb             	and    $0xfffffffb,%ecx
     62e:	80 f9 20             	cmp    $0x20,%cl
     631:	75 16                	jne    649 <getVariableByDollarIndex+0x39>
     633:	eb 19                	jmp    64e <getVariableByDollarIndex+0x3e>
     635:	8d 76 00             	lea    0x0(%esi),%esi
	i++;
     638:	83 c0 01             	add    $0x1,%eax
}

char*
getVariableByDollarIndex(char* s, int dollarIndex){
  int i =  dollarIndex + 1;
  while(s[i] != '\n' && s[i] != ' ' && s[i] != '$'){
     63b:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
     63f:	89 d1                	mov    %edx,%ecx
     641:	83 e1 fb             	and    $0xfffffffb,%ecx
     644:	80 f9 20             	cmp    $0x20,%cl
     647:	74 05                	je     64e <getVariableByDollarIndex+0x3e>
     649:	80 fa 0a             	cmp    $0xa,%dl
     64c:	75 ea                	jne    638 <getVariableByDollarIndex+0x28>
	i++;
  }
  char* ans = malloc(i - dollarIndex + 1);
     64e:	29 d8                	sub    %ebx,%eax
     650:	83 ec 0c             	sub    $0xc,%esp
  strncpy(ans, s + dollarIndex + 1, i - dollarIndex);
     653:	01 fe                	add    %edi,%esi
getVariableByDollarIndex(char* s, int dollarIndex){
  int i =  dollarIndex + 1;
  while(s[i] != '\n' && s[i] != ' ' && s[i] != '$'){
	i++;
  }
  char* ans = malloc(i - dollarIndex + 1);
     655:	89 c3                	mov    %eax,%ebx
     657:	8d 40 01             	lea    0x1(%eax),%eax
     65a:	50                   	push   %eax
     65b:	e8 b0 11 00 00       	call   1810 <malloc>
  strncpy(ans, s + dollarIndex + 1, i - dollarIndex);
     660:	83 c4 0c             	add    $0xc,%esp
     663:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     666:	53                   	push   %ebx
     667:	56                   	push   %esi
     668:	50                   	push   %eax
     669:	e8 92 0b 00 00       	call   1200 <strncpy>
  return ans;
}
     66e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     671:	8d 65 f4             	lea    -0xc(%ebp),%esp
     674:	5b                   	pop    %ebx
     675:	89 d0                	mov    %edx,%eax
     677:	5e                   	pop    %esi
     678:	5f                   	pop    %edi
     679:	5d                   	pop    %ebp
     67a:	c3                   	ret    
     67b:	90                   	nop
     67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <replaceVariable>:

char* 
replaceVariable(char* s, char* variable, char* value)
{
     680:	55                   	push   %ebp
     681:	89 e5                	mov    %esp,%ebp
     683:	57                   	push   %edi
     684:	56                   	push   %esi
     685:	53                   	push   %ebx
     686:	83 ec 1c             	sub    $0x1c,%esp
     689:	8b 75 08             	mov    0x8(%ebp),%esi
  int i = 0;
  while(s[i] != '$'){
     68c:	80 3e 24             	cmpb   $0x24,(%esi)
     68f:	0f 84 02 01 00 00    	je     797 <replaceVariable+0x117>
     695:	31 ff                	xor    %edi,%edi
     697:	89 f6                	mov    %esi,%esi
     699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    i++;
     6a0:	83 c7 01             	add    $0x1,%edi

char* 
replaceVariable(char* s, char* variable, char* value)
{
  int i = 0;
  while(s[i] != '$'){
     6a3:	80 3c 3e 24          	cmpb   $0x24,(%esi,%edi,1)
     6a7:	89 fb                	mov    %edi,%ebx
     6a9:	75 f5                	jne    6a0 <replaceVariable+0x20>
    i++;
  }
  char* before$ = malloc(i);
     6ab:	83 ec 0c             	sub    $0xc,%esp
     6ae:	53                   	push   %ebx
     6af:	e8 5c 11 00 00       	call   1810 <malloc>
  strncpy(before$, s, i);
     6b4:	83 c4 0c             	add    $0xc,%esp
     6b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     6ba:	57                   	push   %edi
     6bb:	56                   	push   %esi
     6bc:	50                   	push   %eax
     6bd:	e8 3e 0b 00 00       	call   1200 <strncpy>
  i = i + strlen(variable);
     6c2:	58                   	pop    %eax
     6c3:	ff 75 0c             	pushl  0xc(%ebp)
     6c6:	e8 e5 0b 00 00       	call   12b0 <strlen>
     6cb:	01 c3                	add    %eax,%ebx
  char* after$ = malloc(strlen(s)-i);
     6cd:	89 34 24             	mov    %esi,(%esp)
     6d0:	e8 db 0b 00 00       	call   12b0 <strlen>
     6d5:	29 d8                	sub    %ebx,%eax
     6d7:	89 04 24             	mov    %eax,(%esp)
     6da:	e8 31 11 00 00       	call   1810 <malloc>
  strncpy(after$, s+i, strlen(s)-i);
     6df:	89 34 24             	mov    %esi,(%esp)
    i++;
  }
  char* before$ = malloc(i);
  strncpy(before$, s, i);
  i = i + strlen(variable);
  char* after$ = malloc(strlen(s)-i);
     6e2:	89 c7                	mov    %eax,%edi
  strncpy(after$, s+i, strlen(s)-i);
     6e4:	e8 c7 0b 00 00       	call   12b0 <strlen>
     6e9:	83 c4 0c             	add    $0xc,%esp
     6ec:	29 d8                	sub    %ebx,%eax
     6ee:	01 f3                	add    %esi,%ebx
     6f0:	50                   	push   %eax
     6f1:	53                   	push   %ebx
     6f2:	57                   	push   %edi
     6f3:	e8 08 0b 00 00       	call   1200 <strncpy>
  char* answer = malloc(strlen(before$)+strlen(value)+strlen(after$));
     6f8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     6fb:	89 34 24             	mov    %esi,(%esp)
     6fe:	e8 ad 0b 00 00       	call   12b0 <strlen>
     703:	5a                   	pop    %edx
     704:	ff 75 10             	pushl  0x10(%ebp)
     707:	89 c3                	mov    %eax,%ebx
     709:	e8 a2 0b 00 00       	call   12b0 <strlen>
     70e:	01 c3                	add    %eax,%ebx
     710:	89 3c 24             	mov    %edi,(%esp)
     713:	e8 98 0b 00 00       	call   12b0 <strlen>
     718:	01 c3                	add    %eax,%ebx
     71a:	89 1c 24             	mov    %ebx,(%esp)
     71d:	e8 ee 10 00 00       	call   1810 <malloc>
  strncpy(answer, before$, strlen(before$));
     722:	89 34 24             	mov    %esi,(%esp)
  char* before$ = malloc(i);
  strncpy(before$, s, i);
  i = i + strlen(variable);
  char* after$ = malloc(strlen(s)-i);
  strncpy(after$, s+i, strlen(s)-i);
  char* answer = malloc(strlen(before$)+strlen(value)+strlen(after$));
     725:	89 c3                	mov    %eax,%ebx
  strncpy(answer, before$, strlen(before$));
     727:	e8 84 0b 00 00       	call   12b0 <strlen>
     72c:	83 c4 0c             	add    $0xc,%esp
     72f:	50                   	push   %eax
     730:	56                   	push   %esi
     731:	53                   	push   %ebx
     732:	e8 c9 0a 00 00       	call   1200 <strncpy>
  strncpy(answer + strlen(before$), value, strlen(value));
     737:	59                   	pop    %ecx
     738:	ff 75 10             	pushl  0x10(%ebp)
     73b:	e8 70 0b 00 00       	call   12b0 <strlen>
     740:	89 34 24             	mov    %esi,(%esp)
     743:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     746:	e8 65 0b 00 00       	call   12b0 <strlen>
     74b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     74e:	83 c4 0c             	add    $0xc,%esp
     751:	01 d8                	add    %ebx,%eax
     753:	52                   	push   %edx
     754:	ff 75 10             	pushl  0x10(%ebp)
     757:	50                   	push   %eax
     758:	e8 a3 0a 00 00       	call   1200 <strncpy>
  strncpy(answer+strlen(before$)+strlen(value), after$, strlen(after$));
     75d:	89 3c 24             	mov    %edi,(%esp)
     760:	e8 4b 0b 00 00       	call   12b0 <strlen>
     765:	89 34 24             	mov    %esi,(%esp)
     768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     76b:	e8 40 0b 00 00       	call   12b0 <strlen>
     770:	89 c6                	mov    %eax,%esi
     772:	58                   	pop    %eax
     773:	ff 75 10             	pushl  0x10(%ebp)
     776:	e8 35 0b 00 00       	call   12b0 <strlen>
     77b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     77e:	83 c4 0c             	add    $0xc,%esp
     781:	01 c6                	add    %eax,%esi
     783:	01 de                	add    %ebx,%esi
     785:	52                   	push   %edx
     786:	57                   	push   %edi
     787:	56                   	push   %esi
     788:	e8 73 0a 00 00       	call   1200 <strncpy>
  return answer;
}
     78d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     790:	89 d8                	mov    %ebx,%eax
     792:	5b                   	pop    %ebx
     793:	5e                   	pop    %esi
     794:	5f                   	pop    %edi
     795:	5d                   	pop    %ebp
     796:	c3                   	ret    

char* 
replaceVariable(char* s, char* variable, char* value)
{
  int i = 0;
  while(s[i] != '$'){
     797:	31 db                	xor    %ebx,%ebx
}

char* 
replaceVariable(char* s, char* variable, char* value)
{
  int i = 0;
     799:	31 ff                	xor    %edi,%edi
     79b:	e9 0b ff ff ff       	jmp    6ab <replaceVariable+0x2b>

000007a0 <variable>:
//PAGEBREAK!
// Constructors

struct variable*
variable(char* name, char* value)
{
     7a0:	55                   	push   %ebp
     7a1:	89 e5                	mov    %esp,%ebp
     7a3:	53                   	push   %ebx
     7a4:	83 ec 10             	sub    $0x10,%esp
  struct variable *var;

  var = malloc(sizeof(*var));
     7a7:	68 a0 00 00 00       	push   $0xa0
     7ac:	e8 5f 10 00 00       	call   1810 <malloc>
  memset(var, 0, sizeof(*var));
     7b1:	83 c4 0c             	add    $0xc,%esp
struct variable*
variable(char* name, char* value)
{
  struct variable *var;

  var = malloc(sizeof(*var));
     7b4:	89 c3                	mov    %eax,%ebx
  memset(var, 0, sizeof(*var));
     7b6:	68 a0 00 00 00       	push   $0xa0
     7bb:	6a 00                	push   $0x0
     7bd:	50                   	push   %eax
     7be:	e8 1d 0b 00 00       	call   12e0 <memset>
  strcpy(var->name, name);
     7c3:	58                   	pop    %eax
     7c4:	5a                   	pop    %edx
     7c5:	ff 75 08             	pushl  0x8(%ebp)
     7c8:	53                   	push   %ebx
     7c9:	e8 02 0a 00 00       	call   11d0 <strcpy>
  strcpy(var->value, value);
     7ce:	59                   	pop    %ecx
     7cf:	58                   	pop    %eax
     7d0:	8d 43 20             	lea    0x20(%ebx),%eax
     7d3:	ff 75 0c             	pushl  0xc(%ebp)
     7d6:	50                   	push   %eax
     7d7:	e8 f4 09 00 00       	call   11d0 <strcpy>
  return var;
}
     7dc:	89 d8                	mov    %ebx,%eax
     7de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     7e1:	c9                   	leave  
     7e2:	c3                   	ret    
     7e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007f0 <setvariablecmd>:

struct cmd*
setvariablecmd(struct variable *var)
{
     7f0:	55                   	push   %ebp
     7f1:	89 e5                	mov    %esp,%ebp
     7f3:	53                   	push   %ebx
     7f4:	83 ec 10             	sub    $0x10,%esp
  struct setvariablecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     7f7:	6a 08                	push   $0x8
     7f9:	e8 12 10 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7fe:	83 c4 0c             	add    $0xc,%esp
struct cmd*
setvariablecmd(struct variable *var)
{
  struct setvariablecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     801:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     803:	6a 08                	push   $0x8
     805:	6a 00                	push   $0x0
     807:	50                   	push   %eax
     808:	e8 d3 0a 00 00       	call   12e0 <memset>
  cmd->type = SETVAR;
  cmd->var = var;
     80d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct setvariablecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = SETVAR;
     810:	c7 03 07 00 00 00    	movl   $0x7,(%ebx)
  cmd->var = var;
     816:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     819:	89 d8                	mov    %ebx,%eax
     81b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     81e:	c9                   	leave  
     81f:	c3                   	ret    

00000820 <historycmd>:

struct histcmd*
historycmd(void)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	53                   	push   %ebx
     824:	83 ec 10             	sub    $0x10,%esp
  struct histcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     827:	6a 48                	push   $0x48
     829:	e8 e2 0f 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     82e:	83 c4 0c             	add    $0xc,%esp
struct histcmd*
historycmd(void)
{
  struct histcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     831:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     833:	6a 48                	push   $0x48
     835:	6a 00                	push   $0x0
     837:	50                   	push   %eax
     838:	e8 a3 0a 00 00       	call   12e0 <memset>
  cmd->type = HISTORY;
     83d:	c7 03 06 00 00 00    	movl   $0x6,(%ebx)
  cmd->lastFreeIndex = 0;
     843:	c7 43 44 00 00 00 00 	movl   $0x0,0x44(%ebx)
  return cmd;
}
     84a:	89 d8                	mov    %ebx,%eax
     84c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     84f:	c9                   	leave  
     850:	c3                   	ret    
     851:	eb 0d                	jmp    860 <execcmd>
     853:	90                   	nop
     854:	90                   	nop
     855:	90                   	nop
     856:	90                   	nop
     857:	90                   	nop
     858:	90                   	nop
     859:	90                   	nop
     85a:	90                   	nop
     85b:	90                   	nop
     85c:	90                   	nop
     85d:	90                   	nop
     85e:	90                   	nop
     85f:	90                   	nop

00000860 <execcmd>:

struct cmd*
execcmd(void)
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	53                   	push   %ebx
     864:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     867:	6a 54                	push   $0x54
     869:	e8 a2 0f 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     86e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     871:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     873:	6a 54                	push   $0x54
     875:	6a 00                	push   $0x0
     877:	50                   	push   %eax
     878:	e8 63 0a 00 00       	call   12e0 <memset>
  cmd->type = EXEC;
     87d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     883:	89 d8                	mov    %ebx,%eax
     885:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     888:	c9                   	leave  
     889:	c3                   	ret    
     88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000890 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	53                   	push   %ebx
     894:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     897:	6a 18                	push   $0x18
     899:	e8 72 0f 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     89e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8a1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     8a3:	6a 18                	push   $0x18
     8a5:	6a 00                	push   $0x0
     8a7:	50                   	push   %eax
     8a8:	e8 33 0a 00 00       	call   12e0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     8ad:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     8b0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     8b6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     8b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     8bf:	8b 45 10             	mov    0x10(%ebp),%eax
     8c2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     8c5:	8b 45 14             	mov    0x14(%ebp),%eax
     8c8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     8cb:	8b 45 18             	mov    0x18(%ebp),%eax
     8ce:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     8d1:	89 d8                	mov    %ebx,%eax
     8d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d6:	c9                   	leave  
     8d7:	c3                   	ret    
     8d8:	90                   	nop
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	53                   	push   %ebx
     8e4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8e7:	6a 0c                	push   $0xc
     8e9:	e8 22 0f 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8ee:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     8f1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     8f3:	6a 0c                	push   $0xc
     8f5:	6a 00                	push   $0x0
     8f7:	50                   	push   %eax
     8f8:	e8 e3 09 00 00       	call   12e0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     8fd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     900:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     906:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     909:	8b 45 0c             	mov    0xc(%ebp),%eax
     90c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     90f:	89 d8                	mov    %ebx,%eax
     911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     914:	c9                   	leave  
     915:	c3                   	ret    
     916:	8d 76 00             	lea    0x0(%esi),%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	53                   	push   %ebx
     924:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     927:	6a 0c                	push   $0xc
     929:	e8 e2 0e 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     92e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     931:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     933:	6a 0c                	push   $0xc
     935:	6a 00                	push   $0x0
     937:	50                   	push   %eax
     938:	e8 a3 09 00 00       	call   12e0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     93d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     940:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     946:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     949:	8b 45 0c             	mov    0xc(%ebp),%eax
     94c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     94f:	89 d8                	mov    %ebx,%eax
     951:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     954:	c9                   	leave  
     955:	c3                   	ret    
     956:	8d 76 00             	lea    0x0(%esi),%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	53                   	push   %ebx
     964:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     967:	6a 08                	push   $0x8
     969:	e8 a2 0e 00 00       	call   1810 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     96e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     971:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     973:	6a 08                	push   $0x8
     975:	6a 00                	push   $0x0
     977:	50                   	push   %eax
     978:	e8 63 09 00 00       	call   12e0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     97d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     980:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     986:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     989:	89 d8                	mov    %ebx,%eax
     98b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     98e:	c9                   	leave  
     98f:	c3                   	ret    

00000990 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     990:	55                   	push   %ebp
     991:	89 e5                	mov    %esp,%ebp
     993:	57                   	push   %edi
     994:	56                   	push   %esi
     995:	53                   	push   %ebx
     996:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     999:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     99c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     99f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     9a2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     9a4:	39 df                	cmp    %ebx,%edi
     9a6:	72 13                	jb     9bb <gettoken+0x2b>
     9a8:	eb 29                	jmp    9d3 <gettoken+0x43>
     9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     9b0:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     9b3:	39 fb                	cmp    %edi,%ebx
     9b5:	0f 84 ed 00 00 00    	je     aa8 <gettoken+0x118>
     9bb:	0f be 07             	movsbl (%edi),%eax
     9be:	83 ec 08             	sub    $0x8,%esp
     9c1:	50                   	push   %eax
     9c2:	68 fc 21 00 00       	push   $0x21fc
     9c7:	e8 34 09 00 00       	call   1300 <strchr>
     9cc:	83 c4 10             	add    $0x10,%esp
     9cf:	85 c0                	test   %eax,%eax
     9d1:	75 dd                	jne    9b0 <gettoken+0x20>
    s++;
  if(q)
     9d3:	85 f6                	test   %esi,%esi
     9d5:	74 02                	je     9d9 <gettoken+0x49>
    *q = s;
     9d7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     9d9:	0f be 37             	movsbl (%edi),%esi
     9dc:	89 f1                	mov    %esi,%ecx
     9de:	89 f0                	mov    %esi,%eax
  switch(*s){
     9e0:	80 f9 29             	cmp    $0x29,%cl
     9e3:	7f 5b                	jg     a40 <gettoken+0xb0>
     9e5:	80 f9 28             	cmp    $0x28,%cl
     9e8:	7d 61                	jge    a4b <gettoken+0xbb>
     9ea:	84 c9                	test   %cl,%cl
     9ec:	0f 85 de 00 00 00    	jne    ad0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     9f2:	8b 55 14             	mov    0x14(%ebp),%edx
     9f5:	85 d2                	test   %edx,%edx
     9f7:	74 05                	je     9fe <gettoken+0x6e>
    *eq = s;
     9f9:	8b 45 14             	mov    0x14(%ebp),%eax
     9fc:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     9fe:	39 fb                	cmp    %edi,%ebx
     a00:	77 0d                	ja     a0f <gettoken+0x7f>
     a02:	eb 23                	jmp    a27 <gettoken+0x97>
     a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     a08:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     a0b:	39 fb                	cmp    %edi,%ebx
     a0d:	74 18                	je     a27 <gettoken+0x97>
     a0f:	0f be 07             	movsbl (%edi),%eax
     a12:	83 ec 08             	sub    $0x8,%esp
     a15:	50                   	push   %eax
     a16:	68 fc 21 00 00       	push   $0x21fc
     a1b:	e8 e0 08 00 00       	call   1300 <strchr>
     a20:	83 c4 10             	add    $0x10,%esp
     a23:	85 c0                	test   %eax,%eax
     a25:	75 e1                	jne    a08 <gettoken+0x78>
    s++;
  *ps = s;
     a27:	8b 45 08             	mov    0x8(%ebp),%eax
     a2a:	89 38                	mov    %edi,(%eax)
  return ret;
}
     a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a2f:	89 f0                	mov    %esi,%eax
     a31:	5b                   	pop    %ebx
     a32:	5e                   	pop    %esi
     a33:	5f                   	pop    %edi
     a34:	5d                   	pop    %ebp
     a35:	c3                   	ret    
     a36:	8d 76 00             	lea    0x0(%esi),%esi
     a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a40:	80 f9 3e             	cmp    $0x3e,%cl
     a43:	75 0b                	jne    a50 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     a45:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     a49:	74 75                	je     ac0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     a4b:	83 c7 01             	add    $0x1,%edi
     a4e:	eb a2                	jmp    9f2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     a50:	7f 5e                	jg     ab0 <gettoken+0x120>
     a52:	83 e9 3b             	sub    $0x3b,%ecx
     a55:	80 f9 01             	cmp    $0x1,%cl
     a58:	76 f1                	jbe    a4b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     a5a:	39 fb                	cmp    %edi,%ebx
     a5c:	77 24                	ja     a82 <gettoken+0xf2>
     a5e:	eb 7c                	jmp    adc <gettoken+0x14c>
     a60:	0f be 07             	movsbl (%edi),%eax
     a63:	83 ec 08             	sub    $0x8,%esp
     a66:	50                   	push   %eax
     a67:	68 f4 21 00 00       	push   $0x21f4
     a6c:	e8 8f 08 00 00       	call   1300 <strchr>
     a71:	83 c4 10             	add    $0x10,%esp
     a74:	85 c0                	test   %eax,%eax
     a76:	75 1f                	jne    a97 <gettoken+0x107>
      s++;
     a78:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     a7b:	39 fb                	cmp    %edi,%ebx
     a7d:	74 5b                	je     ada <gettoken+0x14a>
     a7f:	0f be 07             	movsbl (%edi),%eax
     a82:	83 ec 08             	sub    $0x8,%esp
     a85:	50                   	push   %eax
     a86:	68 fc 21 00 00       	push   $0x21fc
     a8b:	e8 70 08 00 00       	call   1300 <strchr>
     a90:	83 c4 10             	add    $0x10,%esp
     a93:	85 c0                	test   %eax,%eax
     a95:	74 c9                	je     a60 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     a97:	be 61 00 00 00       	mov    $0x61,%esi
     a9c:	e9 51 ff ff ff       	jmp    9f2 <gettoken+0x62>
     aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aa8:	89 df                	mov    %ebx,%edi
     aaa:	e9 24 ff ff ff       	jmp    9d3 <gettoken+0x43>
     aaf:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     ab0:	80 f9 7c             	cmp    $0x7c,%cl
     ab3:	74 96                	je     a4b <gettoken+0xbb>
     ab5:	eb a3                	jmp    a5a <gettoken+0xca>
     ab7:	89 f6                	mov    %esi,%esi
     ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     ac0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     ac3:	be 2b 00 00 00       	mov    $0x2b,%esi
     ac8:	e9 25 ff ff ff       	jmp    9f2 <gettoken+0x62>
     acd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     ad0:	80 f9 26             	cmp    $0x26,%cl
     ad3:	75 85                	jne    a5a <gettoken+0xca>
     ad5:	e9 71 ff ff ff       	jmp    a4b <gettoken+0xbb>
     ada:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     adc:	8b 45 14             	mov    0x14(%ebp),%eax
     adf:	be 61 00 00 00       	mov    $0x61,%esi
     ae4:	85 c0                	test   %eax,%eax
     ae6:	0f 85 0d ff ff ff    	jne    9f9 <gettoken+0x69>
     aec:	e9 36 ff ff ff       	jmp    a27 <gettoken+0x97>
     af1:	eb 0d                	jmp    b00 <peek>
     af3:	90                   	nop
     af4:	90                   	nop
     af5:	90                   	nop
     af6:	90                   	nop
     af7:	90                   	nop
     af8:	90                   	nop
     af9:	90                   	nop
     afa:	90                   	nop
     afb:	90                   	nop
     afc:	90                   	nop
     afd:	90                   	nop
     afe:	90                   	nop
     aff:	90                   	nop

00000b00 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	57                   	push   %edi
     b04:	56                   	push   %esi
     b05:	53                   	push   %ebx
     b06:	83 ec 0c             	sub    $0xc,%esp
     b09:	8b 7d 08             	mov    0x8(%ebp),%edi
     b0c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     b0f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     b11:	39 f3                	cmp    %esi,%ebx
     b13:	72 12                	jb     b27 <peek+0x27>
     b15:	eb 28                	jmp    b3f <peek+0x3f>
     b17:	89 f6                	mov    %esi,%esi
     b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     b20:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     b23:	39 de                	cmp    %ebx,%esi
     b25:	74 18                	je     b3f <peek+0x3f>
     b27:	0f be 03             	movsbl (%ebx),%eax
     b2a:	83 ec 08             	sub    $0x8,%esp
     b2d:	50                   	push   %eax
     b2e:	68 fc 21 00 00       	push   $0x21fc
     b33:	e8 c8 07 00 00       	call   1300 <strchr>
     b38:	83 c4 10             	add    $0x10,%esp
     b3b:	85 c0                	test   %eax,%eax
     b3d:	75 e1                	jne    b20 <peek+0x20>
    s++;
  *ps = s;
     b3f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     b41:	0f be 13             	movsbl (%ebx),%edx
     b44:	31 c0                	xor    %eax,%eax
     b46:	84 d2                	test   %dl,%dl
     b48:	74 17                	je     b61 <peek+0x61>
     b4a:	83 ec 08             	sub    $0x8,%esp
     b4d:	52                   	push   %edx
     b4e:	ff 75 10             	pushl  0x10(%ebp)
     b51:	e8 aa 07 00 00       	call   1300 <strchr>
     b56:	83 c4 10             	add    $0x10,%esp
     b59:	85 c0                	test   %eax,%eax
     b5b:	0f 95 c0             	setne  %al
     b5e:	0f b6 c0             	movzbl %al,%eax
}
     b61:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b64:	5b                   	pop    %ebx
     b65:	5e                   	pop    %esi
     b66:	5f                   	pop    %edi
     b67:	5d                   	pop    %ebp
     b68:	c3                   	ret    
     b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b70 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	57                   	push   %edi
     b74:	56                   	push   %esi
     b75:	53                   	push   %ebx
     b76:	83 ec 1c             	sub    $0x1c,%esp
     b79:	8b 75 0c             	mov    0xc(%ebp),%esi
     b7c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     b7f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     b80:	83 ec 04             	sub    $0x4,%esp
     b83:	68 58 19 00 00       	push   $0x1958
     b88:	53                   	push   %ebx
     b89:	56                   	push   %esi
     b8a:	e8 71 ff ff ff       	call   b00 <peek>
     b8f:	83 c4 10             	add    $0x10,%esp
     b92:	85 c0                	test   %eax,%eax
     b94:	74 6a                	je     c00 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     b96:	6a 00                	push   $0x0
     b98:	6a 00                	push   $0x0
     b9a:	53                   	push   %ebx
     b9b:	56                   	push   %esi
     b9c:	e8 ef fd ff ff       	call   990 <gettoken>
     ba1:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     ba3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     ba6:	50                   	push   %eax
     ba7:	8d 45 e0             	lea    -0x20(%ebp),%eax
     baa:	50                   	push   %eax
     bab:	53                   	push   %ebx
     bac:	56                   	push   %esi
     bad:	e8 de fd ff ff       	call   990 <gettoken>
     bb2:	83 c4 20             	add    $0x20,%esp
     bb5:	83 f8 61             	cmp    $0x61,%eax
     bb8:	75 51                	jne    c0b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     bba:	83 ff 3c             	cmp    $0x3c,%edi
     bbd:	74 31                	je     bf0 <parseredirs+0x80>
     bbf:	83 ff 3e             	cmp    $0x3e,%edi
     bc2:	74 05                	je     bc9 <parseredirs+0x59>
     bc4:	83 ff 2b             	cmp    $0x2b,%edi
     bc7:	75 b7                	jne    b80 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     bc9:	83 ec 0c             	sub    $0xc,%esp
     bcc:	6a 01                	push   $0x1
     bce:	68 01 02 00 00       	push   $0x201
     bd3:	ff 75 e4             	pushl  -0x1c(%ebp)
     bd6:	ff 75 e0             	pushl  -0x20(%ebp)
     bd9:	ff 75 08             	pushl  0x8(%ebp)
     bdc:	e8 af fc ff ff       	call   890 <redircmd>
      break;
     be1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     be4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     be7:	eb 97                	jmp    b80 <parseredirs+0x10>
     be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     bf0:	83 ec 0c             	sub    $0xc,%esp
     bf3:	6a 00                	push   $0x0
     bf5:	6a 00                	push   $0x0
     bf7:	eb da                	jmp    bd3 <parseredirs+0x63>
     bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     c00:	8b 45 08             	mov    0x8(%ebp),%eax
     c03:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c06:	5b                   	pop    %ebx
     c07:	5e                   	pop    %esi
     c08:	5f                   	pop    %edi
     c09:	5d                   	pop    %ebp
     c0a:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     c0b:	83 ec 0c             	sub    $0xc,%esp
     c0e:	68 3b 19 00 00       	push   $0x193b
     c13:	e8 88 f5 ff ff       	call   1a0 <panic>
     c18:	90                   	nop
     c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c20 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	57                   	push   %edi
     c24:	56                   	push   %esi
     c25:	53                   	push   %ebx
     c26:	83 ec 30             	sub    $0x30,%esp
     c29:	8b 75 08             	mov    0x8(%ebp),%esi
     c2c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     c2f:	68 5b 19 00 00       	push   $0x195b
     c34:	57                   	push   %edi
     c35:	56                   	push   %esi
     c36:	e8 c5 fe ff ff       	call   b00 <peek>
     c3b:	83 c4 10             	add    $0x10,%esp
     c3e:	85 c0                	test   %eax,%eax
     c40:	0f 85 9a 00 00 00    	jne    ce0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     c46:	e8 15 fc ff ff       	call   860 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     c4b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     c4e:	89 c3                	mov    %eax,%ebx
     c50:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     c53:	57                   	push   %edi
     c54:	56                   	push   %esi
     c55:	8d 5b 04             	lea    0x4(%ebx),%ebx
     c58:	50                   	push   %eax
     c59:	e8 12 ff ff ff       	call   b70 <parseredirs>
     c5e:	83 c4 10             	add    $0x10,%esp
     c61:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     c64:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     c6b:	eb 16                	jmp    c83 <parseexec+0x63>
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     c70:	83 ec 04             	sub    $0x4,%esp
     c73:	57                   	push   %edi
     c74:	56                   	push   %esi
     c75:	ff 75 d0             	pushl  -0x30(%ebp)
     c78:	e8 f3 fe ff ff       	call   b70 <parseredirs>
     c7d:	83 c4 10             	add    $0x10,%esp
     c80:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     c83:	83 ec 04             	sub    $0x4,%esp
     c86:	68 72 19 00 00       	push   $0x1972
     c8b:	57                   	push   %edi
     c8c:	56                   	push   %esi
     c8d:	e8 6e fe ff ff       	call   b00 <peek>
     c92:	83 c4 10             	add    $0x10,%esp
     c95:	85 c0                	test   %eax,%eax
     c97:	75 5f                	jne    cf8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     c99:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     c9c:	50                   	push   %eax
     c9d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     ca0:	50                   	push   %eax
     ca1:	57                   	push   %edi
     ca2:	56                   	push   %esi
     ca3:	e8 e8 fc ff ff       	call   990 <gettoken>
     ca8:	83 c4 10             	add    $0x10,%esp
     cab:	85 c0                	test   %eax,%eax
     cad:	74 49                	je     cf8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     caf:	83 f8 61             	cmp    $0x61,%eax
     cb2:	75 66                	jne    d1a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     cb4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     cb7:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     cbb:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     cbe:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cc4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     cc7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     cca:	83 f8 0a             	cmp    $0xa,%eax
     ccd:	75 a1                	jne    c70 <parseexec+0x50>
      panic("too many args");
     ccf:	83 ec 0c             	sub    $0xc,%esp
     cd2:	68 64 19 00 00       	push   $0x1964
     cd7:	e8 c4 f4 ff ff       	call   1a0 <panic>
     cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     ce0:	83 ec 08             	sub    $0x8,%esp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
     ce5:	e8 56 01 00 00       	call   e40 <parseblock>
     cea:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ced:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cf0:	5b                   	pop    %ebx
     cf1:	5e                   	pop    %esi
     cf2:	5f                   	pop    %edi
     cf3:	5d                   	pop    %ebp
     cf4:	c3                   	ret    
     cf5:	8d 76 00             	lea    0x0(%esi),%esi
     cf8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     cfb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     cfe:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     d01:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     d08:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     d0f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     d12:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d15:	5b                   	pop    %ebx
     d16:	5e                   	pop    %esi
     d17:	5f                   	pop    %edi
     d18:	5d                   	pop    %ebp
     d19:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     d1a:	83 ec 0c             	sub    $0xc,%esp
     d1d:	68 5d 19 00 00       	push   $0x195d
     d22:	e8 79 f4 ff ff       	call   1a0 <panic>
     d27:	89 f6                	mov    %esi,%esi
     d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d30 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	83 ec 14             	sub    $0x14,%esp
     d39:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     d3f:	56                   	push   %esi
     d40:	53                   	push   %ebx
     d41:	e8 da fe ff ff       	call   c20 <parseexec>
  if(peek(ps, es, "|")){
     d46:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     d49:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     d4b:	68 77 19 00 00       	push   $0x1977
     d50:	56                   	push   %esi
     d51:	53                   	push   %ebx
     d52:	e8 a9 fd ff ff       	call   b00 <peek>
     d57:	83 c4 10             	add    $0x10,%esp
     d5a:	85 c0                	test   %eax,%eax
     d5c:	75 12                	jne    d70 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     d5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d61:	89 f8                	mov    %edi,%eax
     d63:	5b                   	pop    %ebx
     d64:	5e                   	pop    %esi
     d65:	5f                   	pop    %edi
     d66:	5d                   	pop    %ebp
     d67:	c3                   	ret    
     d68:	90                   	nop
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     d70:	6a 00                	push   $0x0
     d72:	6a 00                	push   $0x0
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	e8 15 fc ff ff       	call   990 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d7b:	58                   	pop    %eax
     d7c:	5a                   	pop    %edx
     d7d:	56                   	push   %esi
     d7e:	53                   	push   %ebx
     d7f:	e8 ac ff ff ff       	call   d30 <parsepipe>
     d84:	89 7d 08             	mov    %edi,0x8(%ebp)
     d87:	89 45 0c             	mov    %eax,0xc(%ebp)
     d8a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     d8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d90:	5b                   	pop    %ebx
     d91:	5e                   	pop    %esi
     d92:	5f                   	pop    %edi
     d93:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     d94:	e9 47 fb ff ff       	jmp    8e0 <pipecmd>
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000da0 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
     da5:	53                   	push   %ebx
     da6:	83 ec 14             	sub    $0x14,%esp
     da9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dac:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     daf:	56                   	push   %esi
     db0:	53                   	push   %ebx
     db1:	e8 7a ff ff ff       	call   d30 <parsepipe>
  while(peek(ps, es, "&")){
     db6:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     db9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     dbb:	eb 1b                	jmp    dd8 <parseline+0x38>
     dbd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     dc0:	6a 00                	push   $0x0
     dc2:	6a 00                	push   $0x0
     dc4:	56                   	push   %esi
     dc5:	53                   	push   %ebx
     dc6:	e8 c5 fb ff ff       	call   990 <gettoken>
    cmd = backcmd(cmd);
     dcb:	89 3c 24             	mov    %edi,(%esp)
     dce:	e8 8d fb ff ff       	call   960 <backcmd>
     dd3:	83 c4 10             	add    $0x10,%esp
     dd6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     dd8:	83 ec 04             	sub    $0x4,%esp
     ddb:	68 79 19 00 00       	push   $0x1979
     de0:	56                   	push   %esi
     de1:	53                   	push   %ebx
     de2:	e8 19 fd ff ff       	call   b00 <peek>
     de7:	83 c4 10             	add    $0x10,%esp
     dea:	85 c0                	test   %eax,%eax
     dec:	75 d2                	jne    dc0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     dee:	83 ec 04             	sub    $0x4,%esp
     df1:	68 75 19 00 00       	push   $0x1975
     df6:	56                   	push   %esi
     df7:	53                   	push   %ebx
     df8:	e8 03 fd ff ff       	call   b00 <peek>
     dfd:	83 c4 10             	add    $0x10,%esp
     e00:	85 c0                	test   %eax,%eax
     e02:	75 0c                	jne    e10 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     e04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e07:	89 f8                	mov    %edi,%eax
     e09:	5b                   	pop    %ebx
     e0a:	5e                   	pop    %esi
     e0b:	5f                   	pop    %edi
     e0c:	5d                   	pop    %ebp
     e0d:	c3                   	ret    
     e0e:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     e10:	6a 00                	push   $0x0
     e12:	6a 00                	push   $0x0
     e14:	56                   	push   %esi
     e15:	53                   	push   %ebx
     e16:	e8 75 fb ff ff       	call   990 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     e1b:	58                   	pop    %eax
     e1c:	5a                   	pop    %edx
     e1d:	56                   	push   %esi
     e1e:	53                   	push   %ebx
     e1f:	e8 7c ff ff ff       	call   da0 <parseline>
     e24:	89 7d 08             	mov    %edi,0x8(%ebp)
     e27:	89 45 0c             	mov    %eax,0xc(%ebp)
     e2a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     e2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e30:	5b                   	pop    %ebx
     e31:	5e                   	pop    %esi
     e32:	5f                   	pop    %edi
     e33:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     e34:	e9 e7 fa ff ff       	jmp    920 <listcmd>
     e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e40 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 10             	sub    $0x10,%esp
     e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
     e4c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     e4f:	68 5b 19 00 00       	push   $0x195b
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	e8 a5 fc ff ff       	call   b00 <peek>
     e5b:	83 c4 10             	add    $0x10,%esp
     e5e:	85 c0                	test   %eax,%eax
     e60:	74 4a                	je     eac <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     e62:	6a 00                	push   $0x0
     e64:	6a 00                	push   $0x0
     e66:	56                   	push   %esi
     e67:	53                   	push   %ebx
     e68:	e8 23 fb ff ff       	call   990 <gettoken>
  cmd = parseline(ps, es);
     e6d:	58                   	pop    %eax
     e6e:	5a                   	pop    %edx
     e6f:	56                   	push   %esi
     e70:	53                   	push   %ebx
     e71:	e8 2a ff ff ff       	call   da0 <parseline>
  if(!peek(ps, es, ")"))
     e76:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     e79:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     e7b:	68 97 19 00 00       	push   $0x1997
     e80:	56                   	push   %esi
     e81:	53                   	push   %ebx
     e82:	e8 79 fc ff ff       	call   b00 <peek>
     e87:	83 c4 10             	add    $0x10,%esp
     e8a:	85 c0                	test   %eax,%eax
     e8c:	74 2b                	je     eb9 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     e8e:	6a 00                	push   $0x0
     e90:	6a 00                	push   $0x0
     e92:	56                   	push   %esi
     e93:	53                   	push   %ebx
     e94:	e8 f7 fa ff ff       	call   990 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     e99:	83 c4 0c             	add    $0xc,%esp
     e9c:	56                   	push   %esi
     e9d:	53                   	push   %ebx
     e9e:	57                   	push   %edi
     e9f:	e8 cc fc ff ff       	call   b70 <parseredirs>
  return cmd;
}
     ea4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ea7:	5b                   	pop    %ebx
     ea8:	5e                   	pop    %esi
     ea9:	5f                   	pop    %edi
     eaa:	5d                   	pop    %ebp
     eab:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     eac:	83 ec 0c             	sub    $0xc,%esp
     eaf:	68 7b 19 00 00       	push   $0x197b
     eb4:	e8 e7 f2 ff ff       	call   1a0 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     eb9:	83 ec 0c             	sub    $0xc,%esp
     ebc:	68 86 19 00 00       	push   $0x1986
     ec1:	e8 da f2 ff ff       	call   1a0 <panic>
     ec6:	8d 76 00             	lea    0x0(%esi),%esi
     ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ed0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	53                   	push   %ebx
     ed4:	83 ec 04             	sub    $0x4,%esp
     ed7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     eda:	85 db                	test   %ebx,%ebx
     edc:	0f 84 96 00 00 00    	je     f78 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     ee2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ee5:	77 48                	ja     f2f <nulterminate+0x5f>
     ee7:	8b 03                	mov    (%ebx),%eax
     ee9:	ff 24 85 e0 19 00 00 	jmp    *0x19e0(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ef0:	83 ec 0c             	sub    $0xc,%esp
     ef3:	ff 73 04             	pushl  0x4(%ebx)
     ef6:	e8 d5 ff ff ff       	call   ed0 <nulterminate>
    nulterminate(lcmd->right);
     efb:	58                   	pop    %eax
     efc:	ff 73 08             	pushl  0x8(%ebx)
     eff:	e8 cc ff ff ff       	call   ed0 <nulterminate>
    break;
     f04:	83 c4 10             	add    $0x10,%esp
     f07:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f0c:	c9                   	leave  
     f0d:	c3                   	ret    
     f0e:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     f10:	8b 4b 04             	mov    0x4(%ebx),%ecx
     f13:	8d 43 2c             	lea    0x2c(%ebx),%eax
     f16:	85 c9                	test   %ecx,%ecx
     f18:	74 15                	je     f2f <nulterminate+0x5f>
     f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     f20:	8b 10                	mov    (%eax),%edx
     f22:	83 c0 04             	add    $0x4,%eax
     f25:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     f28:	8b 50 d8             	mov    -0x28(%eax),%edx
     f2b:	85 d2                	test   %edx,%edx
     f2d:	75 f1                	jne    f20 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     f2f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f34:	c9                   	leave  
     f35:	c3                   	ret    
     f36:	8d 76 00             	lea    0x0(%esi),%esi
     f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     f40:	83 ec 0c             	sub    $0xc,%esp
     f43:	ff 73 04             	pushl  0x4(%ebx)
     f46:	e8 85 ff ff ff       	call   ed0 <nulterminate>
    break;
     f4b:	89 d8                	mov    %ebx,%eax
     f4d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     f50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f53:	c9                   	leave  
     f54:	c3                   	ret    
     f55:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     f58:	83 ec 0c             	sub    $0xc,%esp
     f5b:	ff 73 04             	pushl  0x4(%ebx)
     f5e:	e8 6d ff ff ff       	call   ed0 <nulterminate>
    *rcmd->efile = 0;
     f63:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     f66:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     f69:	c6 00 00             	movb   $0x0,(%eax)
    break;
     f6c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     f6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f71:	c9                   	leave  
     f72:	c3                   	ret    
     f73:	90                   	nop
     f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     f78:	31 c0                	xor    %eax,%eax
     f7a:	eb 8d                	jmp    f09 <nulterminate+0x39>
     f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f80 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	56                   	push   %esi
     f84:	53                   	push   %ebx
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
     f85:	8b 75 08             	mov    0x8(%ebp),%esi
  }
  return 0;
}

int indexOf(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
     f88:	31 db                	xor    %ebx,%ebx
     f8a:	eb 11                	jmp    f9d <parsecmd+0x1d>
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(s[i] == c){
     f90:	80 3c 1e 24          	cmpb   $0x24,(%esi,%ebx,1)
     f94:	0f 84 96 00 00 00    	je     1030 <parsecmd+0xb0>
  }
  return 0;
}

int indexOf(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
     f9a:	83 c3 01             	add    $0x1,%ebx
     f9d:	83 ec 0c             	sub    $0xc,%esp
     fa0:	56                   	push   %esi
     fa1:	e8 0a 03 00 00       	call   12b0 <strlen>
     fa6:	83 c4 10             	add    $0x10,%esp
     fa9:	39 c3                	cmp    %eax,%ebx
     fab:	72 e3                	jb     f90 <parsecmd+0x10>
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
     fad:	8b 75 08             	mov    0x8(%ebp),%esi
     fb0:	80 3e 68             	cmpb   $0x68,(%esi)
     fb3:	0f 84 07 01 00 00    	je     10c0 <parsecmd+0x140>
     fb9:	31 db                	xor    %ebx,%ebx
     fbb:	eb 10                	jmp    fcd <parsecmd+0x4d>
     fbd:	8d 76 00             	lea    0x0(%esi),%esi
    }
}

int isInString(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
     fc0:	80 3c 1e 3d          	cmpb   $0x3d,(%esi,%ebx,1)
     fc4:	0f 84 be 00 00 00    	je     1088 <parsecmd+0x108>
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}

int isInString(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
     fca:	83 c3 01             	add    $0x1,%ebx
     fcd:	83 ec 0c             	sub    $0xc,%esp
     fd0:	56                   	push   %esi
     fd1:	e8 da 02 00 00       	call   12b0 <strlen>
     fd6:	83 c4 10             	add    $0x10,%esp
     fd9:	39 c3                	cmp    %eax,%ebx
     fdb:	72 e3                	jb     fc0 <parsecmd+0x40>
  	struct variable *var = variable(getVariableName(s),getVariableValue(s));
  	cmd = (struct cmd*)setvariablecmd(var);
  }
  else{
    char *es;
    es = s + strlen(s);
     fdd:	8b 5d 08             	mov    0x8(%ebp),%ebx
     fe0:	83 ec 0c             	sub    $0xc,%esp
     fe3:	53                   	push   %ebx
     fe4:	e8 c7 02 00 00       	call   12b0 <strlen>
     fe9:	01 c3                	add    %eax,%ebx
    cmd = parseline(&s, es);
     feb:	58                   	pop    %eax
     fec:	8d 45 08             	lea    0x8(%ebp),%eax
     fef:	5a                   	pop    %edx
     ff0:	53                   	push   %ebx
     ff1:	50                   	push   %eax
     ff2:	e8 a9 fd ff ff       	call   da0 <parseline>
     ff7:	89 c6                	mov    %eax,%esi
    peek(&s, es, "");
     ff9:	8d 45 08             	lea    0x8(%ebp),%eax
     ffc:	83 c4 0c             	add    $0xc,%esp
     fff:	68 25 19 00 00       	push   $0x1925
    1004:	53                   	push   %ebx
    1005:	50                   	push   %eax
    1006:	e8 f5 fa ff ff       	call   b00 <peek>
    if(s != es){
    100b:	8b 45 08             	mov    0x8(%ebp),%eax
    100e:	83 c4 10             	add    $0x10,%esp
    1011:	39 c3                	cmp    %eax,%ebx
    1013:	0f 85 77 01 00 00    	jne    1190 <parsecmd+0x210>
      printf(2, "leftovers: %s\n", s);
      panic("syntax");
    }
    nulterminate(cmd);
    1019:	83 ec 0c             	sub    $0xc,%esp
    101c:	56                   	push   %esi
    101d:	e8 ae fe ff ff       	call   ed0 <nulterminate>
    1022:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
    1025:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1028:	89 f0                	mov    %esi,%eax
    102a:	5b                   	pop    %ebx
    102b:	5e                   	pop    %esi
    102c:	5d                   	pop    %ebp
    102d:	c3                   	ret    
    102e:	66 90                	xchg   %ax,%ax
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    1030:	8b 75 08             	mov    0x8(%ebp),%esi
    1033:	80 3e 68             	cmpb   $0x68,(%esi)
    1036:	0f 84 bc 00 00 00    	je     10f8 <parsecmd+0x178>
  else if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    && (s[6] == 'y')){
    cmd = (struct cmd*)history;
  }
  else if(dollarIndex > -1){
    char* value = malloc(MAX_VARIABLE_VALUE);
    103c:	83 ec 0c             	sub    $0xc,%esp
    103f:	68 80 00 00 00       	push   $0x80
    1044:	e8 c7 07 00 00       	call   1810 <malloc>
    char* variable = getVariableByDollarIndex(s, dollarIndex);
    1049:	59                   	pop    %ecx
  else if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    && (s[6] == 'y')){
    cmd = (struct cmd*)history;
  }
  else if(dollarIndex > -1){
    char* value = malloc(MAX_VARIABLE_VALUE);
    104a:	89 c6                	mov    %eax,%esi
    char* variable = getVariableByDollarIndex(s, dollarIndex);
    104c:	58                   	pop    %eax
    104d:	53                   	push   %ebx
    104e:	ff 75 08             	pushl  0x8(%ebp)
    1051:	e8 ba f5 ff ff       	call   610 <getVariableByDollarIndex>
    1056:	89 c3                	mov    %eax,%ebx
    getVariable(variable, value);
    1058:	58                   	pop    %eax
    1059:	5a                   	pop    %edx
    105a:	56                   	push   %esi
    105b:	53                   	push   %ebx
    105c:	e8 b9 04 00 00       	call   151a <getVariable>
    char* buf = replaceVariable(s, variable, value);
    1061:	83 c4 0c             	add    $0xc,%esp
    1064:	56                   	push   %esi
    1065:	53                   	push   %ebx
    1066:	ff 75 08             	pushl  0x8(%ebp)
    1069:	e8 12 f6 ff ff       	call   680 <replaceVariable>
    cmd = parsecmd(buf);
    106e:	89 04 24             	mov    %eax,(%esp)
    1071:	e8 0a ff ff ff       	call   f80 <parsecmd>
    1076:	83 c4 10             	add    $0x10,%esp
      panic("syntax");
    }
    nulterminate(cmd);
  }
  return cmd;
}
    1079:	8d 65 f8             	lea    -0x8(%ebp),%esp
  else if(dollarIndex > -1){
    char* value = malloc(MAX_VARIABLE_VALUE);
    char* variable = getVariableByDollarIndex(s, dollarIndex);
    getVariable(variable, value);
    char* buf = replaceVariable(s, variable, value);
    cmd = parsecmd(buf);
    107c:	89 c6                	mov    %eax,%esi
      panic("syntax");
    }
    nulterminate(cmd);
  }
  return cmd;
}
    107e:	89 f0                	mov    %esi,%eax
    1080:	5b                   	pop    %ebx
    1081:	5e                   	pop    %esi
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    getVariable(variable, value);
    char* buf = replaceVariable(s, variable, value);
    cmd = parsecmd(buf);
  }
  else if(isInString(s, '=') == 1){
  	struct variable *var = variable(getVariableName(s),getVariableValue(s));
    1088:	83 ec 0c             	sub    $0xc,%esp
    108b:	ff 75 08             	pushl  0x8(%ebp)
    108e:	e8 fd f4 ff ff       	call   590 <getVariableValue>
    1093:	59                   	pop    %ecx
    1094:	ff 75 08             	pushl  0x8(%ebp)
    1097:	89 c3                	mov    %eax,%ebx
    1099:	e8 82 f4 ff ff       	call   520 <getVariableName>
    109e:	5e                   	pop    %esi
    109f:	5a                   	pop    %edx
    10a0:	53                   	push   %ebx
    10a1:	50                   	push   %eax
    10a2:	e8 f9 f6 ff ff       	call   7a0 <variable>
  	cmd = (struct cmd*)setvariablecmd(var);
    10a7:	89 04 24             	mov    %eax,(%esp)
    10aa:	e8 41 f7 ff ff       	call   7f0 <setvariablecmd>
    10af:	83 c4 10             	add    $0x10,%esp
      panic("syntax");
    }
    nulterminate(cmd);
  }
  return cmd;
}
    10b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    char* buf = replaceVariable(s, variable, value);
    cmd = parsecmd(buf);
  }
  else if(isInString(s, '=') == 1){
  	struct variable *var = variable(getVariableName(s),getVariableValue(s));
  	cmd = (struct cmd*)setvariablecmd(var);
    10b5:	89 c6                	mov    %eax,%esi
      panic("syntax");
    }
    nulterminate(cmd);
  }
  return cmd;
}
    10b7:	89 f0                	mov    %esi,%eax
    10b9:	5b                   	pop    %ebx
    10ba:	5e                   	pop    %esi
    10bb:	5d                   	pop    %ebp
    10bc:	c3                   	ret    
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    10c0:	80 7e 01 69          	cmpb   $0x69,0x1(%esi)
    10c4:	0f 85 ef fe ff ff    	jne    fb9 <parsecmd+0x39>
    10ca:	80 7e 02 73          	cmpb   $0x73,0x2(%esi)
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return i;
    }
  }
  return -1;
    10ce:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    10d3:	0f 85 e0 fe ff ff    	jne    fb9 <parsecmd+0x39>
    10d9:	80 7e 03 74          	cmpb   $0x74,0x3(%esi)
    10dd:	74 51                	je     1130 <parsecmd+0x1b0>
    }
    else{
      cmd = parsecmd(history->commands[s[11]-'0'-1]);
    }
  }
  else if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    10df:	80 7e 03 74          	cmpb   $0x74,0x3(%esi)
    10e3:	74 2b                	je     1110 <parsecmd+0x190>
    && (s[6] == 'y')){
    cmd = (struct cmd*)history;
  }
  else if(dollarIndex > -1){
    10e5:	83 fb ff             	cmp    $0xffffffff,%ebx
    10e8:	0f 84 cb fe ff ff    	je     fb9 <parsecmd+0x39>
    10ee:	e9 49 ff ff ff       	jmp    103c <parsecmd+0xbc>
    10f3:	90                   	nop
    10f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    10f8:	80 7e 01 69          	cmpb   $0x69,0x1(%esi)
    10fc:	0f 85 3a ff ff ff    	jne    103c <parsecmd+0xbc>
    1102:	80 7e 02 73          	cmpb   $0x73,0x2(%esi)
    1106:	0f 85 30 ff ff ff    	jne    103c <parsecmd+0xbc>
    110c:	eb cb                	jmp    10d9 <parsecmd+0x159>
    110e:	66 90                	xchg   %ax,%ax
    }
    else{
      cmd = parsecmd(history->commands[s[11]-'0'-1]);
    }
  }
  else if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    1110:	80 7e 04 6f          	cmpb   $0x6f,0x4(%esi)
    1114:	75 cf                	jne    10e5 <parsecmd+0x165>
    1116:	80 7e 05 72          	cmpb   $0x72,0x5(%esi)
    111a:	75 c9                	jne    10e5 <parsecmd+0x165>
    && (s[6] == 'y')){
    111c:	80 7e 06 79          	cmpb   $0x79,0x6(%esi)
    1120:	75 c3                	jne    10e5 <parsecmd+0x165>
    cmd = (struct cmd*)history;
    1122:	8b 35 90 22 00 00    	mov    0x2290,%esi
    1128:	e9 f8 fe ff ff       	jmp    1025 <parsecmd+0xa5>
    112d:	8d 76 00             	lea    0x0(%esi),%esi
struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    1130:	80 7e 04 6f          	cmpb   $0x6f,0x4(%esi)
    1134:	75 a9                	jne    10df <parsecmd+0x15f>
    1136:	80 7e 05 72          	cmpb   $0x72,0x5(%esi)
    113a:	75 a3                	jne    10df <parsecmd+0x15f>
    && (s[6] == 'y') && (s[7] == ' ') && (s[8] == '-') && (s[9] == 'l') && (s[10] == ' ')){
    113c:	80 7e 06 79          	cmpb   $0x79,0x6(%esi)
    1140:	75 9d                	jne    10df <parsecmd+0x15f>
    1142:	80 7e 07 20          	cmpb   $0x20,0x7(%esi)
    1146:	75 97                	jne    10df <parsecmd+0x15f>
    1148:	80 7e 08 2d          	cmpb   $0x2d,0x8(%esi)
    114c:	75 91                	jne    10df <parsecmd+0x15f>
    114e:	80 7e 09 6c          	cmpb   $0x6c,0x9(%esi)
    1152:	75 8b                	jne    10df <parsecmd+0x15f>
    1154:	80 7e 0a 20          	cmpb   $0x20,0xa(%esi)
    1158:	0f 85 81 ff ff ff    	jne    10df <parsecmd+0x15f>
    if(s[12] != 10){ //10 = '\0'
    115e:	0f be 46 0c          	movsbl 0xc(%esi),%eax
    1162:	3c 0a                	cmp    $0xa,%al
    1164:	74 46                	je     11ac <parsecmd+0x22c>
      cmd = parsecmd(history->commands[(s[11]-'0')*10+(s[12]-'0')-1]);
    1166:	0f be 56 0b          	movsbl 0xb(%esi),%edx
    116a:	83 ec 0c             	sub    $0xc,%esp
    116d:	8d 94 92 10 ff ff ff 	lea    -0xf0(%edx,%edx,4),%edx
    1174:	8d 54 50 cf          	lea    -0x31(%eax,%edx,2),%edx
    1178:	a1 90 22 00 00       	mov    0x2290,%eax
    117d:	ff 74 90 04          	pushl  0x4(%eax,%edx,4)
    1181:	e8 fa fd ff ff       	call   f80 <parsecmd>
    1186:	83 c4 10             	add    $0x10,%esp
    1189:	89 c6                	mov    %eax,%esi
    118b:	e9 95 fe ff ff       	jmp    1025 <parsecmd+0xa5>
    char *es;
    es = s + strlen(s);
    cmd = parseline(&s, es);
    peek(&s, es, "");
    if(s != es){
      printf(2, "leftovers: %s\n", s);
    1190:	83 ec 04             	sub    $0x4,%esp
    1193:	50                   	push   %eax
    1194:	68 99 19 00 00       	push   $0x1999
    1199:	6a 02                	push   $0x2
    119b:	e8 40 04 00 00       	call   15e0 <printf>
      panic("syntax");
    11a0:	c7 04 24 5d 19 00 00 	movl   $0x195d,(%esp)
    11a7:	e8 f4 ef ff ff       	call   1a0 <panic>
    && (s[6] == 'y') && (s[7] == ' ') && (s[8] == '-') && (s[9] == 'l') && (s[10] == ' ')){
    if(s[12] != 10){ //10 = '\0'
      cmd = parsecmd(history->commands[(s[11]-'0')*10+(s[12]-'0')-1]);
    }
    else{
      cmd = parsecmd(history->commands[s[11]-'0'-1]);
    11ac:	0f be 56 0b          	movsbl 0xb(%esi),%edx
    11b0:	a1 90 22 00 00       	mov    0x2290,%eax
    11b5:	83 ec 0c             	sub    $0xc,%esp
    11b8:	ff b4 90 40 ff ff ff 	pushl  -0xc0(%eax,%edx,4)
    11bf:	e8 bc fd ff ff       	call   f80 <parsecmd>
    11c4:	83 c4 10             	add    $0x10,%esp
    11c7:	89 c6                	mov    %eax,%esi
    11c9:	e9 57 fe ff ff       	jmp    1025 <parsecmd+0xa5>
    11ce:	66 90                	xchg   %ax,%ax

000011d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	53                   	push   %ebx
    11d4:	8b 45 08             	mov    0x8(%ebp),%eax
    11d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    11da:	89 c2                	mov    %eax,%edx
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e0:	83 c1 01             	add    $0x1,%ecx
    11e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    11e7:	83 c2 01             	add    $0x1,%edx
    11ea:	84 db                	test   %bl,%bl
    11ec:	88 5a ff             	mov    %bl,-0x1(%edx)
    11ef:	75 ef                	jne    11e0 <strcpy+0x10>
    ;
  return os;
}
    11f1:	5b                   	pop    %ebx
    11f2:	5d                   	pop    %ebp
    11f3:	c3                   	ret    
    11f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001200 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	56                   	push   %esi
    1204:	53                   	push   %ebx
    1205:	8b 45 08             	mov    0x8(%ebp),%eax
    1208:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    120b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    120e:	89 c2                	mov    %eax,%edx
    1210:	eb 19                	jmp    122b <strncpy+0x2b>
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1218:	83 c3 01             	add    $0x1,%ebx
    121b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
    121f:	83 c2 01             	add    $0x1,%edx
    1222:	84 c9                	test   %cl,%cl
    1224:	88 4a ff             	mov    %cl,-0x1(%edx)
    1227:	74 09                	je     1232 <strncpy+0x32>
    1229:	89 f1                	mov    %esi,%ecx
    122b:	85 c9                	test   %ecx,%ecx
    122d:	8d 71 ff             	lea    -0x1(%ecx),%esi
    1230:	7f e6                	jg     1218 <strncpy+0x18>
    ;
  while(n-- > 0)
    1232:	31 c9                	xor    %ecx,%ecx
    1234:	85 f6                	test   %esi,%esi
    1236:	7e 17                	jle    124f <strncpy+0x4f>
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
    1240:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
    1244:	89 f3                	mov    %esi,%ebx
    1246:	83 c1 01             	add    $0x1,%ecx
    1249:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    124b:	85 db                	test   %ebx,%ebx
    124d:	7f f1                	jg     1240 <strncpy+0x40>
    *s++ = 0;
  return os;
}
    124f:	5b                   	pop    %ebx
    1250:	5e                   	pop    %esi
    1251:	5d                   	pop    %ebp
    1252:	c3                   	ret    
    1253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	56                   	push   %esi
    1264:	53                   	push   %ebx
    1265:	8b 55 08             	mov    0x8(%ebp),%edx
    1268:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    126b:	0f b6 02             	movzbl (%edx),%eax
    126e:	0f b6 19             	movzbl (%ecx),%ebx
    1271:	84 c0                	test   %al,%al
    1273:	75 1e                	jne    1293 <strcmp+0x33>
    1275:	eb 29                	jmp    12a0 <strcmp+0x40>
    1277:	89 f6                	mov    %esi,%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1280:	83 c2 01             	add    $0x1,%edx


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1283:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1286:	8d 71 01             	lea    0x1(%ecx),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1289:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    128d:	84 c0                	test   %al,%al
    128f:	74 0f                	je     12a0 <strcmp+0x40>
    1291:	89 f1                	mov    %esi,%ecx
    1293:	38 d8                	cmp    %bl,%al
    1295:	74 e9                	je     1280 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1297:	29 d8                	sub    %ebx,%eax
}
    1299:	5b                   	pop    %ebx
    129a:	5e                   	pop    %esi
    129b:	5d                   	pop    %ebp
    129c:	c3                   	ret    
    129d:	8d 76 00             	lea    0x0(%esi),%esi


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    12a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    12a2:	29 d8                	sub    %ebx,%eax
}
    12a4:	5b                   	pop    %ebx
    12a5:	5e                   	pop    %esi
    12a6:	5d                   	pop    %ebp
    12a7:	c3                   	ret    
    12a8:	90                   	nop
    12a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012b0 <strlen>:

uint
strlen(char *s)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    12b6:	80 39 00             	cmpb   $0x0,(%ecx)
    12b9:	74 12                	je     12cd <strlen+0x1d>
    12bb:	31 d2                	xor    %edx,%edx
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    12c0:	83 c2 01             	add    $0x1,%edx
    12c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    12c7:	89 d0                	mov    %edx,%eax
    12c9:	75 f5                	jne    12c0 <strlen+0x10>
    ;
  return n;
}
    12cb:	5d                   	pop    %ebp
    12cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    12cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    12cf:	5d                   	pop    %ebp
    12d0:	c3                   	ret    
    12d1:	eb 0d                	jmp    12e0 <memset>
    12d3:	90                   	nop
    12d4:	90                   	nop
    12d5:	90                   	nop
    12d6:	90                   	nop
    12d7:	90                   	nop
    12d8:	90                   	nop
    12d9:	90                   	nop
    12da:	90                   	nop
    12db:	90                   	nop
    12dc:	90                   	nop
    12dd:	90                   	nop
    12de:	90                   	nop
    12df:	90                   	nop

000012e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    12e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    12ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    12ed:	89 d7                	mov    %edx,%edi
    12ef:	fc                   	cld    
    12f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    12f2:	89 d0                	mov    %edx,%eax
    12f4:	5f                   	pop    %edi
    12f5:	5d                   	pop    %ebp
    12f6:	c3                   	ret    
    12f7:	89 f6                	mov    %esi,%esi
    12f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001300 <strchr>:

char*
strchr(const char *s, char c)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	53                   	push   %ebx
    1304:	8b 45 08             	mov    0x8(%ebp),%eax
    1307:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    130a:	0f b6 10             	movzbl (%eax),%edx
    130d:	84 d2                	test   %dl,%dl
    130f:	74 1d                	je     132e <strchr+0x2e>
    if(*s == c)
    1311:	38 d3                	cmp    %dl,%bl
    1313:	89 d9                	mov    %ebx,%ecx
    1315:	75 0d                	jne    1324 <strchr+0x24>
    1317:	eb 17                	jmp    1330 <strchr+0x30>
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1320:	38 ca                	cmp    %cl,%dl
    1322:	74 0c                	je     1330 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1324:	83 c0 01             	add    $0x1,%eax
    1327:	0f b6 10             	movzbl (%eax),%edx
    132a:	84 d2                	test   %dl,%dl
    132c:	75 f2                	jne    1320 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    132e:	31 c0                	xor    %eax,%eax
}
    1330:	5b                   	pop    %ebx
    1331:	5d                   	pop    %ebp
    1332:	c3                   	ret    
    1333:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001340 <gets>:

char*
gets(char *buf, int max)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1346:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    1348:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    134b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    134e:	eb 29                	jmp    1379 <gets+0x39>
    cc = read(0, &c, 1);
    1350:	83 ec 04             	sub    $0x4,%esp
    1353:	6a 01                	push   $0x1
    1355:	57                   	push   %edi
    1356:	6a 00                	push   $0x0
    1358:	e8 2d 01 00 00       	call   148a <read>
    if(cc < 1)
    135d:	83 c4 10             	add    $0x10,%esp
    1360:	85 c0                	test   %eax,%eax
    1362:	7e 1d                	jle    1381 <gets+0x41>
      break;
    buf[i++] = c;
    1364:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1368:	8b 55 08             	mov    0x8(%ebp),%edx
    136b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    136d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    136f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    1373:	74 1b                	je     1390 <gets+0x50>
    1375:	3c 0d                	cmp    $0xd,%al
    1377:	74 17                	je     1390 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1379:	8d 5e 01             	lea    0x1(%esi),%ebx
    137c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    137f:	7c cf                	jl     1350 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1381:	8b 45 08             	mov    0x8(%ebp),%eax
    1384:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1388:	8d 65 f4             	lea    -0xc(%ebp),%esp
    138b:	5b                   	pop    %ebx
    138c:	5e                   	pop    %esi
    138d:	5f                   	pop    %edi
    138e:	5d                   	pop    %ebp
    138f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1390:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1393:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1395:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1399:	8d 65 f4             	lea    -0xc(%ebp),%esp
    139c:	5b                   	pop    %ebx
    139d:	5e                   	pop    %esi
    139e:	5f                   	pop    %edi
    139f:	5d                   	pop    %ebp
    13a0:	c3                   	ret    
    13a1:	eb 0d                	jmp    13b0 <stat>
    13a3:	90                   	nop
    13a4:	90                   	nop
    13a5:	90                   	nop
    13a6:	90                   	nop
    13a7:	90                   	nop
    13a8:	90                   	nop
    13a9:	90                   	nop
    13aa:	90                   	nop
    13ab:	90                   	nop
    13ac:	90                   	nop
    13ad:	90                   	nop
    13ae:	90                   	nop
    13af:	90                   	nop

000013b0 <stat>:

int
stat(char *n, struct stat *st)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	56                   	push   %esi
    13b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    13b5:	83 ec 08             	sub    $0x8,%esp
    13b8:	6a 00                	push   $0x0
    13ba:	ff 75 08             	pushl  0x8(%ebp)
    13bd:	e8 f0 00 00 00       	call   14b2 <open>
  if(fd < 0)
    13c2:	83 c4 10             	add    $0x10,%esp
    13c5:	85 c0                	test   %eax,%eax
    13c7:	78 27                	js     13f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    13c9:	83 ec 08             	sub    $0x8,%esp
    13cc:	ff 75 0c             	pushl  0xc(%ebp)
    13cf:	89 c3                	mov    %eax,%ebx
    13d1:	50                   	push   %eax
    13d2:	e8 f3 00 00 00       	call   14ca <fstat>
    13d7:	89 c6                	mov    %eax,%esi
  close(fd);
    13d9:	89 1c 24             	mov    %ebx,(%esp)
    13dc:	e8 b9 00 00 00       	call   149a <close>
  return r;
    13e1:	83 c4 10             	add    $0x10,%esp
    13e4:	89 f0                	mov    %esi,%eax
}
    13e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    13e9:	5b                   	pop    %ebx
    13ea:	5e                   	pop    %esi
    13eb:	5d                   	pop    %ebp
    13ec:	c3                   	ret    
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    13f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    13f5:	eb ef                	jmp    13e6 <stat+0x36>
    13f7:	89 f6                	mov    %esi,%esi
    13f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001400 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	53                   	push   %ebx
    1404:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1407:	0f be 11             	movsbl (%ecx),%edx
    140a:	8d 42 d0             	lea    -0x30(%edx),%eax
    140d:	3c 09                	cmp    $0x9,%al
    140f:	b8 00 00 00 00       	mov    $0x0,%eax
    1414:	77 1f                	ja     1435 <atoi+0x35>
    1416:	8d 76 00             	lea    0x0(%esi),%esi
    1419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1420:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1423:	83 c1 01             	add    $0x1,%ecx
    1426:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    142a:	0f be 11             	movsbl (%ecx),%edx
    142d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1430:	80 fb 09             	cmp    $0x9,%bl
    1433:	76 eb                	jbe    1420 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1435:	5b                   	pop    %ebx
    1436:	5d                   	pop    %ebp
    1437:	c3                   	ret    
    1438:	90                   	nop
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001440 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	56                   	push   %esi
    1444:	53                   	push   %ebx
    1445:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1448:	8b 45 08             	mov    0x8(%ebp),%eax
    144b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    144e:	85 db                	test   %ebx,%ebx
    1450:	7e 14                	jle    1466 <memmove+0x26>
    1452:	31 d2                	xor    %edx,%edx
    1454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1458:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    145c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    145f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1462:	39 da                	cmp    %ebx,%edx
    1464:	75 f2                	jne    1458 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1466:	5b                   	pop    %ebx
    1467:	5e                   	pop    %esi
    1468:	5d                   	pop    %ebp
    1469:	c3                   	ret    

0000146a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    146a:	b8 01 00 00 00       	mov    $0x1,%eax
    146f:	cd 40                	int    $0x40
    1471:	c3                   	ret    

00001472 <exit>:
SYSCALL(exit)
    1472:	b8 02 00 00 00       	mov    $0x2,%eax
    1477:	cd 40                	int    $0x40
    1479:	c3                   	ret    

0000147a <wait>:
SYSCALL(wait)
    147a:	b8 03 00 00 00       	mov    $0x3,%eax
    147f:	cd 40                	int    $0x40
    1481:	c3                   	ret    

00001482 <pipe>:
SYSCALL(pipe)
    1482:	b8 04 00 00 00       	mov    $0x4,%eax
    1487:	cd 40                	int    $0x40
    1489:	c3                   	ret    

0000148a <read>:
SYSCALL(read)
    148a:	b8 05 00 00 00       	mov    $0x5,%eax
    148f:	cd 40                	int    $0x40
    1491:	c3                   	ret    

00001492 <write>:
SYSCALL(write)
    1492:	b8 10 00 00 00       	mov    $0x10,%eax
    1497:	cd 40                	int    $0x40
    1499:	c3                   	ret    

0000149a <close>:
SYSCALL(close)
    149a:	b8 15 00 00 00       	mov    $0x15,%eax
    149f:	cd 40                	int    $0x40
    14a1:	c3                   	ret    

000014a2 <kill>:
SYSCALL(kill)
    14a2:	b8 06 00 00 00       	mov    $0x6,%eax
    14a7:	cd 40                	int    $0x40
    14a9:	c3                   	ret    

000014aa <exec>:
SYSCALL(exec)
    14aa:	b8 07 00 00 00       	mov    $0x7,%eax
    14af:	cd 40                	int    $0x40
    14b1:	c3                   	ret    

000014b2 <open>:
SYSCALL(open)
    14b2:	b8 0f 00 00 00       	mov    $0xf,%eax
    14b7:	cd 40                	int    $0x40
    14b9:	c3                   	ret    

000014ba <mknod>:
SYSCALL(mknod)
    14ba:	b8 11 00 00 00       	mov    $0x11,%eax
    14bf:	cd 40                	int    $0x40
    14c1:	c3                   	ret    

000014c2 <unlink>:
SYSCALL(unlink)
    14c2:	b8 12 00 00 00       	mov    $0x12,%eax
    14c7:	cd 40                	int    $0x40
    14c9:	c3                   	ret    

000014ca <fstat>:
SYSCALL(fstat)
    14ca:	b8 08 00 00 00       	mov    $0x8,%eax
    14cf:	cd 40                	int    $0x40
    14d1:	c3                   	ret    

000014d2 <link>:
SYSCALL(link)
    14d2:	b8 13 00 00 00       	mov    $0x13,%eax
    14d7:	cd 40                	int    $0x40
    14d9:	c3                   	ret    

000014da <mkdir>:
SYSCALL(mkdir)
    14da:	b8 14 00 00 00       	mov    $0x14,%eax
    14df:	cd 40                	int    $0x40
    14e1:	c3                   	ret    

000014e2 <chdir>:
SYSCALL(chdir)
    14e2:	b8 09 00 00 00       	mov    $0x9,%eax
    14e7:	cd 40                	int    $0x40
    14e9:	c3                   	ret    

000014ea <dup>:
SYSCALL(dup)
    14ea:	b8 0a 00 00 00       	mov    $0xa,%eax
    14ef:	cd 40                	int    $0x40
    14f1:	c3                   	ret    

000014f2 <getpid>:
SYSCALL(getpid)
    14f2:	b8 0b 00 00 00       	mov    $0xb,%eax
    14f7:	cd 40                	int    $0x40
    14f9:	c3                   	ret    

000014fa <sbrk>:
SYSCALL(sbrk)
    14fa:	b8 0c 00 00 00       	mov    $0xc,%eax
    14ff:	cd 40                	int    $0x40
    1501:	c3                   	ret    

00001502 <sleep>:
SYSCALL(sleep)
    1502:	b8 0d 00 00 00       	mov    $0xd,%eax
    1507:	cd 40                	int    $0x40
    1509:	c3                   	ret    

0000150a <uptime>:
SYSCALL(uptime)
    150a:	b8 0e 00 00 00       	mov    $0xe,%eax
    150f:	cd 40                	int    $0x40
    1511:	c3                   	ret    

00001512 <setVariable>:
SYSCALL(setVariable)
    1512:	b8 17 00 00 00       	mov    $0x17,%eax
    1517:	cd 40                	int    $0x40
    1519:	c3                   	ret    

0000151a <getVariable>:
SYSCALL(getVariable)
    151a:	b8 18 00 00 00       	mov    $0x18,%eax
    151f:	cd 40                	int    $0x40
    1521:	c3                   	ret    

00001522 <remVariable>:
SYSCALL(remVariable)
    1522:	b8 19 00 00 00       	mov    $0x19,%eax
    1527:	cd 40                	int    $0x40
    1529:	c3                   	ret    

0000152a <wait2>:
SYSCALL(wait2)
    152a:	b8 1a 00 00 00       	mov    $0x1a,%eax
    152f:	cd 40                	int    $0x40
    1531:	c3                   	ret    

00001532 <set_priority>:
SYSCALL(set_priority)
    1532:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1537:	cd 40                	int    $0x40
    1539:	c3                   	ret    
    153a:	66 90                	xchg   %ax,%ax
    153c:	66 90                	xchg   %ax,%ax
    153e:	66 90                	xchg   %ax,%ax

00001540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1540:	55                   	push   %ebp
    1541:	89 e5                	mov    %esp,%ebp
    1543:	57                   	push   %edi
    1544:	56                   	push   %esi
    1545:	53                   	push   %ebx
    1546:	89 c6                	mov    %eax,%esi
    1548:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    154b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    154e:	85 db                	test   %ebx,%ebx
    1550:	74 7e                	je     15d0 <printint+0x90>
    1552:	89 d0                	mov    %edx,%eax
    1554:	c1 e8 1f             	shr    $0x1f,%eax
    1557:	84 c0                	test   %al,%al
    1559:	74 75                	je     15d0 <printint+0x90>
    neg = 1;
    x = -xx;
    155b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    155d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    1564:	f7 d8                	neg    %eax
    1566:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1569:	31 ff                	xor    %edi,%edi
    156b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    156e:	89 ce                	mov    %ecx,%esi
    1570:	eb 08                	jmp    157a <printint+0x3a>
    1572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1578:	89 cf                	mov    %ecx,%edi
    157a:	31 d2                	xor    %edx,%edx
    157c:	8d 4f 01             	lea    0x1(%edi),%ecx
    157f:	f7 f6                	div    %esi
    1581:	0f b6 92 00 1a 00 00 	movzbl 0x1a00(%edx),%edx
  }while((x /= base) != 0);
    1588:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    158a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    158d:	75 e9                	jne    1578 <printint+0x38>
  if(neg)
    158f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1592:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1595:	85 c0                	test   %eax,%eax
    1597:	74 08                	je     15a1 <printint+0x61>
    buf[i++] = '-';
    1599:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    159e:	8d 4f 02             	lea    0x2(%edi),%ecx
    15a1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    15a5:	8d 76 00             	lea    0x0(%esi),%esi
    15a8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15ab:	83 ec 04             	sub    $0x4,%esp
    15ae:	83 ef 01             	sub    $0x1,%edi
    15b1:	6a 01                	push   $0x1
    15b3:	53                   	push   %ebx
    15b4:	56                   	push   %esi
    15b5:	88 45 d7             	mov    %al,-0x29(%ebp)
    15b8:	e8 d5 fe ff ff       	call   1492 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15bd:	83 c4 10             	add    $0x10,%esp
    15c0:	39 df                	cmp    %ebx,%edi
    15c2:	75 e4                	jne    15a8 <printint+0x68>
    putc(fd, buf[i]);
}
    15c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15c7:	5b                   	pop    %ebx
    15c8:	5e                   	pop    %esi
    15c9:	5f                   	pop    %edi
    15ca:	5d                   	pop    %ebp
    15cb:	c3                   	ret    
    15cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    15d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    15d2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    15d9:	eb 8b                	jmp    1566 <printint+0x26>
    15db:	90                   	nop
    15dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000015e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	57                   	push   %edi
    15e4:	56                   	push   %esi
    15e5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15e6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15e9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15ec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15f5:	0f b6 1e             	movzbl (%esi),%ebx
    15f8:	83 c6 01             	add    $0x1,%esi
    15fb:	84 db                	test   %bl,%bl
    15fd:	0f 84 b0 00 00 00    	je     16b3 <printf+0xd3>
    1603:	31 d2                	xor    %edx,%edx
    1605:	eb 39                	jmp    1640 <printf+0x60>
    1607:	89 f6                	mov    %esi,%esi
    1609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1610:	83 f8 25             	cmp    $0x25,%eax
    1613:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1616:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    161b:	74 18                	je     1635 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    161d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1620:	83 ec 04             	sub    $0x4,%esp
    1623:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1626:	6a 01                	push   $0x1
    1628:	50                   	push   %eax
    1629:	57                   	push   %edi
    162a:	e8 63 fe ff ff       	call   1492 <write>
    162f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1632:	83 c4 10             	add    $0x10,%esp
    1635:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1638:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    163c:	84 db                	test   %bl,%bl
    163e:	74 73                	je     16b3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1640:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1642:	0f be cb             	movsbl %bl,%ecx
    1645:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1648:	74 c6                	je     1610 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    164a:	83 fa 25             	cmp    $0x25,%edx
    164d:	75 e6                	jne    1635 <printf+0x55>
      if(c == 'd'){
    164f:	83 f8 64             	cmp    $0x64,%eax
    1652:	0f 84 f8 00 00 00    	je     1750 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1658:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    165e:	83 f9 70             	cmp    $0x70,%ecx
    1661:	74 5d                	je     16c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1663:	83 f8 73             	cmp    $0x73,%eax
    1666:	0f 84 84 00 00 00    	je     16f0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    166c:	83 f8 63             	cmp    $0x63,%eax
    166f:	0f 84 ea 00 00 00    	je     175f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1675:	83 f8 25             	cmp    $0x25,%eax
    1678:	0f 84 c2 00 00 00    	je     1740 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    167e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1681:	83 ec 04             	sub    $0x4,%esp
    1684:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1688:	6a 01                	push   $0x1
    168a:	50                   	push   %eax
    168b:	57                   	push   %edi
    168c:	e8 01 fe ff ff       	call   1492 <write>
    1691:	83 c4 0c             	add    $0xc,%esp
    1694:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1697:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    169a:	6a 01                	push   $0x1
    169c:	50                   	push   %eax
    169d:	57                   	push   %edi
    169e:	83 c6 01             	add    $0x1,%esi
    16a1:	e8 ec fd ff ff       	call   1492 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16a6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    16aa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16ad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16af:	84 db                	test   %bl,%bl
    16b1:	75 8d                	jne    1640 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16b6:	5b                   	pop    %ebx
    16b7:	5e                   	pop    %esi
    16b8:	5f                   	pop    %edi
    16b9:	5d                   	pop    %ebp
    16ba:	c3                   	ret    
    16bb:	90                   	nop
    16bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    16c8:	6a 00                	push   $0x0
    16ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    16cd:	89 f8                	mov    %edi,%eax
    16cf:	8b 13                	mov    (%ebx),%edx
    16d1:	e8 6a fe ff ff       	call   1540 <printint>
        ap++;
    16d6:	89 d8                	mov    %ebx,%eax
    16d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    16db:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    16dd:	83 c0 04             	add    $0x4,%eax
    16e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    16e3:	e9 4d ff ff ff       	jmp    1635 <printf+0x55>
    16e8:	90                   	nop
    16e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    16f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16f3:	8b 18                	mov    (%eax),%ebx
        ap++;
    16f5:	83 c0 04             	add    $0x4,%eax
    16f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    16fb:	b8 f8 19 00 00       	mov    $0x19f8,%eax
    1700:	85 db                	test   %ebx,%ebx
    1702:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1705:	0f b6 03             	movzbl (%ebx),%eax
    1708:	84 c0                	test   %al,%al
    170a:	74 23                	je     172f <printf+0x14f>
    170c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1710:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1713:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1716:	83 ec 04             	sub    $0x4,%esp
    1719:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    171b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    171e:	50                   	push   %eax
    171f:	57                   	push   %edi
    1720:	e8 6d fd ff ff       	call   1492 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1725:	0f b6 03             	movzbl (%ebx),%eax
    1728:	83 c4 10             	add    $0x10,%esp
    172b:	84 c0                	test   %al,%al
    172d:	75 e1                	jne    1710 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    172f:	31 d2                	xor    %edx,%edx
    1731:	e9 ff fe ff ff       	jmp    1635 <printf+0x55>
    1736:	8d 76 00             	lea    0x0(%esi),%esi
    1739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1740:	83 ec 04             	sub    $0x4,%esp
    1743:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1746:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1749:	6a 01                	push   $0x1
    174b:	e9 4c ff ff ff       	jmp    169c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1750:	83 ec 0c             	sub    $0xc,%esp
    1753:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1758:	6a 01                	push   $0x1
    175a:	e9 6b ff ff ff       	jmp    16ca <printf+0xea>
    175f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1762:	83 ec 04             	sub    $0x4,%esp
    1765:	8b 03                	mov    (%ebx),%eax
    1767:	6a 01                	push   $0x1
    1769:	88 45 e4             	mov    %al,-0x1c(%ebp)
    176c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    176f:	50                   	push   %eax
    1770:	57                   	push   %edi
    1771:	e8 1c fd ff ff       	call   1492 <write>
    1776:	e9 5b ff ff ff       	jmp    16d6 <printf+0xf6>
    177b:	66 90                	xchg   %ax,%ax
    177d:	66 90                	xchg   %ax,%ax
    177f:	90                   	nop

00001780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1781:	a1 84 22 00 00       	mov    0x2284,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1786:	89 e5                	mov    %esp,%ebp
    1788:	57                   	push   %edi
    1789:	56                   	push   %esi
    178a:	53                   	push   %ebx
    178b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    178e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1790:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1793:	39 c8                	cmp    %ecx,%eax
    1795:	73 19                	jae    17b0 <free+0x30>
    1797:	89 f6                	mov    %esi,%esi
    1799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    17a0:	39 d1                	cmp    %edx,%ecx
    17a2:	72 1c                	jb     17c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17a4:	39 d0                	cmp    %edx,%eax
    17a6:	73 18                	jae    17c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    17a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17ae:	72 f0                	jb     17a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17b0:	39 d0                	cmp    %edx,%eax
    17b2:	72 f4                	jb     17a8 <free+0x28>
    17b4:	39 d1                	cmp    %edx,%ecx
    17b6:	73 f0                	jae    17a8 <free+0x28>
    17b8:	90                   	nop
    17b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    17c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    17c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    17c6:	39 d7                	cmp    %edx,%edi
    17c8:	74 19                	je     17e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    17ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    17cd:	8b 50 04             	mov    0x4(%eax),%edx
    17d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    17d3:	39 f1                	cmp    %esi,%ecx
    17d5:	74 23                	je     17fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    17d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    17d9:	a3 84 22 00 00       	mov    %eax,0x2284
}
    17de:	5b                   	pop    %ebx
    17df:	5e                   	pop    %esi
    17e0:	5f                   	pop    %edi
    17e1:	5d                   	pop    %ebp
    17e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    17e3:	03 72 04             	add    0x4(%edx),%esi
    17e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    17e9:	8b 10                	mov    (%eax),%edx
    17eb:	8b 12                	mov    (%edx),%edx
    17ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    17f0:	8b 50 04             	mov    0x4(%eax),%edx
    17f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    17f6:	39 f1                	cmp    %esi,%ecx
    17f8:	75 dd                	jne    17d7 <free+0x57>
    p->s.size += bp->s.size;
    17fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    17fd:	a3 84 22 00 00       	mov    %eax,0x2284
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1802:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1805:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1808:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    180a:	5b                   	pop    %ebx
    180b:	5e                   	pop    %esi
    180c:	5f                   	pop    %edi
    180d:	5d                   	pop    %ebp
    180e:	c3                   	ret    
    180f:	90                   	nop

00001810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1810:	55                   	push   %ebp
    1811:	89 e5                	mov    %esp,%ebp
    1813:	57                   	push   %edi
    1814:	56                   	push   %esi
    1815:	53                   	push   %ebx
    1816:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    181c:	8b 15 84 22 00 00    	mov    0x2284,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1822:	8d 78 07             	lea    0x7(%eax),%edi
    1825:	c1 ef 03             	shr    $0x3,%edi
    1828:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    182b:	85 d2                	test   %edx,%edx
    182d:	0f 84 a3 00 00 00    	je     18d6 <malloc+0xc6>
    1833:	8b 02                	mov    (%edx),%eax
    1835:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1838:	39 cf                	cmp    %ecx,%edi
    183a:	76 74                	jbe    18b0 <malloc+0xa0>
    183c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1842:	be 00 10 00 00       	mov    $0x1000,%esi
    1847:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    184e:	0f 43 f7             	cmovae %edi,%esi
    1851:	ba 00 80 00 00       	mov    $0x8000,%edx
    1856:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    185c:	0f 46 da             	cmovbe %edx,%ebx
    185f:	eb 10                	jmp    1871 <malloc+0x61>
    1861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    186a:	8b 48 04             	mov    0x4(%eax),%ecx
    186d:	39 cf                	cmp    %ecx,%edi
    186f:	76 3f                	jbe    18b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1871:	39 05 84 22 00 00    	cmp    %eax,0x2284
    1877:	89 c2                	mov    %eax,%edx
    1879:	75 ed                	jne    1868 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    187b:	83 ec 0c             	sub    $0xc,%esp
    187e:	53                   	push   %ebx
    187f:	e8 76 fc ff ff       	call   14fa <sbrk>
  if(p == (char*)-1)
    1884:	83 c4 10             	add    $0x10,%esp
    1887:	83 f8 ff             	cmp    $0xffffffff,%eax
    188a:	74 1c                	je     18a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    188c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    188f:	83 ec 0c             	sub    $0xc,%esp
    1892:	83 c0 08             	add    $0x8,%eax
    1895:	50                   	push   %eax
    1896:	e8 e5 fe ff ff       	call   1780 <free>
  return freep;
    189b:	8b 15 84 22 00 00    	mov    0x2284,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    18a1:	83 c4 10             	add    $0x10,%esp
    18a4:	85 d2                	test   %edx,%edx
    18a6:	75 c0                	jne    1868 <malloc+0x58>
        return 0;
    18a8:	31 c0                	xor    %eax,%eax
    18aa:	eb 1c                	jmp    18c8 <malloc+0xb8>
    18ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    18b0:	39 cf                	cmp    %ecx,%edi
    18b2:	74 1c                	je     18d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    18b4:	29 f9                	sub    %edi,%ecx
    18b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    18b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    18bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    18bf:	89 15 84 22 00 00    	mov    %edx,0x2284
      return (void*)(p + 1);
    18c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    18c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18cb:	5b                   	pop    %ebx
    18cc:	5e                   	pop    %esi
    18cd:	5f                   	pop    %edi
    18ce:	5d                   	pop    %ebp
    18cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    18d0:	8b 08                	mov    (%eax),%ecx
    18d2:	89 0a                	mov    %ecx,(%edx)
    18d4:	eb e9                	jmp    18bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    18d6:	c7 05 84 22 00 00 88 	movl   $0x2288,0x2284
    18dd:	22 00 00 
    18e0:	c7 05 88 22 00 00 88 	movl   $0x2288,0x2288
    18e7:	22 00 00 
    base.s.size = 0;
    18ea:	b8 88 22 00 00       	mov    $0x2288,%eax
    18ef:	c7 05 8c 22 00 00 00 	movl   $0x0,0x228c
    18f6:	00 00 00 
    18f9:	e9 3e ff ff ff       	jmp    183c <malloc+0x2c>
