#define SIG_DFL -1
#define SIG_IGN 1

#define SIGKILL 9
#define SIGSTOP 17
#define SIGCONT 19

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;
typedef void (*sighandler_t)(int);

