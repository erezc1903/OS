// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"


// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5
#define HISTORY 6
#define SETVAR 7
#define GETVAR 8


#define MAXARGS 10
#define MAX_HISTORY 16
#define MAX_VARIABLES 32
#define MAX_VARIABLE_NAME 32
#define MAX_VARIABLE_VALUE 128

struct variable {
  char name[MAX_VARIABLE_NAME];
  char value[MAX_VARIABLE_VALUE];
};

struct cmd {
  int type;
};

struct setvariablecmd {
  int type;
  struct variable *var;
};

struct histcmd {
  int type;
  char *commands[MAX_HISTORY];
  int lastFreeIndex;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);
void showHistory(void);
struct histcmd* historycmd(void);
void addCmdToHistory(char*);
int isInString(char*, char);
char* getVariableName(char*);
char* getVariableValue(char*);
char* replaceVariable(char*, char*, char*);

//struct variable *variable(char*, char*);
struct histcmd *history;



// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  struct setvariablecmd *svcmd;
  // struct getvariablecmd *gvcmd;

  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    exec(ecmd->argv[0], ecmd->argv);
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
    }
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
    wait();
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
    close(p[1]);
    wait();
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;

  case HISTORY:
    showHistory();
    break;

  case SETVAR:
  	svcmd = (struct setvariablecmd*)cmd;
  	struct variable* varSet = svcmd->var;
  	setVariable(varSet->name, varSet->value);
  	break;
  }

  exit();
}

int
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}


int
main(void)
{
  static char buf[100];
  int fd;
  history = historycmd();
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }

    int chPID = fork1();
    
    addCmdToHistory(buf);

    if(chPID == 0){
        runcmd(parsecmd(buf));
    }

    int wtime = -1;
    int rtime = -1;
    int iotime = -1;

    wait2(chPID, &wtime, &rtime, &iotime);
  }
  exit();
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

void
addCmdToHistory(char *cmdString)
{
  char *commandName = malloc(strlen(cmdString));
  strcpy(commandName, cmdString);
  if(history->lastFreeIndex == (MAX_HISTORY)){
    char *tempCmdStrings[MAX_HISTORY-1];
    for(int i=1 ,j=0; j<(MAX_HISTORY-1); i++, j++){
      tempCmdStrings[j] = history->commands[i];
    }
    for(int i=0; i<(MAX_HISTORY-1); i++){
      history->commands[i]=tempCmdStrings[i];
    }
    history->commands[history->lastFreeIndex-1] = commandName;
  }
  else{
    history->commands[history->lastFreeIndex] = commandName;
    history->lastFreeIndex++;
  }
}

void
showHistory()
{
    for(int i=0; i<history->lastFreeIndex; i++){
      printf(2, "%d. %s", i+1, history->commands[i]);
    }
}

int isInString(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return 1;
    }
  }
  return 0;
}

int indexOf(char* s, char c){
  for(int i = 0; i< strlen(s); i++){
    if(s[i] == c){
      return i;
    }
  }
  return -1;
}

char* getVariableName(char* s){
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* name = malloc(i+1);
  for(int j=0; j<i; j++){
    name[j] = s[j];
  }
  name[i]='\n';
  return name;
}

char* getVariableValue(char* s){
  int i = 0;
  while(s[i] != '='){
    i++;
  }
  char* value = malloc(strlen(s)-i-1);
  for(int j=i+1, k=0; j<strlen(s); j++, k++){
    value[k] = s[j];
  }
  return value;
}

char*
getVariableByDollarIndex(char* s, int dollarIndex){
  int i =  dollarIndex + 1;
  while(s[i] != '\n' && s[i] != ' ' && s[i] != '$'){
	i++;
  }
  char* ans = malloc(i - dollarIndex + 1);
  strncpy(ans, s + dollarIndex + 1, i - dollarIndex);
  return ans;
}

char* 
replaceVariable(char* s, char* variable, char* value)
{
  int i = 0;
  while(s[i] != '$'){
    i++;
  }
  char* before$ = malloc(i);
  strncpy(before$, s, i);
  i = i + strlen(variable);
  char* after$ = malloc(strlen(s)-i);
  strncpy(after$, s+i, strlen(s)-i);
  char* answer = malloc(strlen(before$)+strlen(value)+strlen(after$));
  strncpy(answer, before$, strlen(before$));
  strncpy(answer + strlen(before$), value, strlen(value));
  strncpy(answer+strlen(before$)+strlen(value), after$, strlen(after$));
  return answer;
}
//PAGEBREAK!
// Constructors

struct variable*
variable(char* name, char* value)
{
  struct variable *var;

  var = malloc(sizeof(*var));
  memset(var, 0, sizeof(*var));
  strcpy(var->name, name);
  strcpy(var->value, value);
  return var;
}

struct cmd*
setvariablecmd(struct variable *var)
{
  struct setvariablecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = SETVAR;
  cmd->var = var;
  return (struct cmd*)cmd;
}

struct histcmd*
historycmd(void)
{
  struct histcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = HISTORY;
  cmd->lastFreeIndex = 0;
  return cmd;
}

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  struct cmd *cmd;
  int dollarIndex = indexOf(s, '$');
  if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    && (s[6] == 'y') && (s[7] == ' ') && (s[8] == '-') && (s[9] == 'l') && (s[10] == ' ')){
    if(s[12] != 10){ //10 = '\0'
      cmd = parsecmd(history->commands[(s[11]-'0')*10+(s[12]-'0')-1]);
    }
    else{
      cmd = parsecmd(history->commands[s[11]-'0'-1]);
    }
  }
  else if((s[0] == 'h') && (s[1] == 'i') && (s[2] == 's') && (s[3] == 't') && (s[4] == 'o') && (s[5] == 'r') 
    && (s[6] == 'y')){
    cmd = (struct cmd*)history;
  }
  else if(dollarIndex > -1){
    char* value = malloc(MAX_VARIABLE_VALUE);
    char* variable = getVariableByDollarIndex(s, dollarIndex);
    getVariable(variable, value);
    char* buf = replaceVariable(s, variable, value);
    cmd = parsecmd(buf);
  }
  else if(isInString(s, '=') == 1){
  	struct variable *var = variable(getVariableName(s),getVariableValue(s));
  	cmd = (struct cmd*)setvariablecmd(var);
  }
  else{
    char *es;
    es = s + strlen(s);
    cmd = parseline(&s, es);
    peek(&s, es, "");
    if(s != es){
      printf(2, "leftovers: %s\n", s);
      panic("syntax");
    }
    nulterminate(cmd);
  }
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
