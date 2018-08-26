#include "types.h"
#include "user.h"
#include "fcntl.h"

#define MAX_VARIABLE_NAME 32

void stringCopy(const char*, char*);

void
stringCopy(const char* s, char* t)
{
	int i=0;
	while(s[i]){
		t[i]=s[i];
		i++;
	}
	return;
}
int
main(int argc, char const *argv[])
{
	char arg1[MAX_VARIABLE_NAME];
	// char arg2[5];
	stringCopy(argv[1], arg1);
	// strncpy(arg2, argv[2], 5);
	remVariable(arg1);
	// remVariable(arg2);
	exit();
}