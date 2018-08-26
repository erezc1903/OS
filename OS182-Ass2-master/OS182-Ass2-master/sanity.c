#include "types.h"
#include "user.h"
#include "stat.h"

char*
getSignalName(int signum){

	char* sigName = "";
	switch(signum){
      case SIGSTOP:
        sigName = "SIGSTOP";
        break;
      case SIGCONT:
        sigName = "SIGCONT";
        break;
      case SIGKILL:
        sigName = "SIGKILL";
        break;
      case SIG_IGN:
        sigName = "SIG_IGN";
        break;
      case SIG_DFL:
      	sigName = "SIG_DFL";
      	break;
    }
    return sigName;
}

void
SignalHandler(int signum)
{
	printf(1, "SignalHandler: signal: %s, pid: %d\n", getSignalName(signum), getpid());
	return;
}

void 
test1(){

	printf(1,"Test 1: Sending SIGSTOP and then SIGCONT\n");

	int pid_t1 = fork();
	if(pid_t1 == 0){
		printf(1,"In child process, pid: %d\n",getpid());
		signal(SIGCONT, SignalHandler);
		kill(getpid(), SIGSTOP);
		exit();
	} else{
		sleep(50);
		printf(1,"In father process, pid: %d\n",getpid());
		kill(pid_t1, SIGCONT);
		wait();
	}
	printf(1, "\n");
}

void 
test2(){

	printf(1,"Test 2: Sending SIGKILL and then SIGSTOP\n");
	int pid_t2 = fork();
	if(pid_t2 == 0){
		printf(1,"In child process, pid: %d\n",getpid());
		signal(SIGKILL, SignalHandler);
		kill(getpid(), SIGKILL);
		exit();
	} else{
		sleep(50);
		printf(1,"In father process, pid: %d\n",getpid());
		kill(pid_t2, SIGSTOP);
		wait();
	}
	printf(1, "\n");
}

void 
test3(){

	printf(1,"Test 3: Sending SIGSTOP with SIG_IGN handler\n");
	int pid_t3 = fork();
	if(pid_t3 == 0){
		printf(1,"In child process, pid: %d\n",getpid());
		signal(SIGSTOP, (void*) SIG_IGN);
		kill(getpid(), SIGSTOP);
		exit();
	} else{
		sleep(50);
		printf(1,"In father process, pid: %d\n",getpid());
		wait();
	}
	printf(1, "\n");
}

void 
test4(){
	printf(1,"Test 4: Sending SIGSTOP while mask bit is on\n");
	int pid_t4 = fork();
	if(pid_t4 == 0){
		printf(1,"In child process, pid: %d\n",getpid());
		signal(SIGSTOP, SignalHandler);
		sigprocmask(1UL << SIGSTOP);
		kill(getpid(), SIGSTOP);
		exit();
	} else{
		sleep(50);
		printf(1,"In father process, pid: %d\n",getpid());
		wait();
	}
	printf(1, "\n");
}

void 
test5(){
	printf(1,"Test 5: Sending SIGCONT to a process which isn't stopped\n");
	int pid_t5 = fork();
	if(pid_t5 == 0){
		printf(1,"In child process, pid: %d\n",getpid());
		signal(SIGCONT, (void*) SIG_DFL);
		exit();
	} else{
		printf(1,"In father process, pid: %d\n",getpid());
		kill(pid_t5, SIGCONT);
		sleep(50);
		wait();
	}
	printf(1, "\n");
}

void 
test6(){
	printf(1,"Test 6: Multiple processes. Sending SIGSTOP and then SIGCONT\n");
	int NUM_OF_CHILDREN = 20;
	int children[NUM_OF_CHILDREN];
	int pid;

	for(int i = 0; i < NUM_OF_CHILDREN; i++){
		pid = fork();
		if(pid == 0){
			printf(1,"In child process, pid: %d\n",getpid());
			signal(SIGCONT, SignalHandler);		
			kill(getpid(), SIGSTOP);
			exit();
		}
		else{	
			children[i] = pid;
		}
	}
	for(int i = 0; i < NUM_OF_CHILDREN; i++){
		sleep(50);
		kill(children[i], SIGCONT);
		wait();
	}
	printf(1, "\n");
}

int main(void){

	test1();
	test2();
	test3();
	test4();
	test5();
	test6();
	exit();
}

