#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
	char buf[64];
	readlink(argv[1], buf, (size_t)64);
	exit();
}
