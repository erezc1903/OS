#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"

static char fname[BSIZE];
static int size;
static char size_modifier;
static char type;
static int follow;
static char key[MAX_TAG_KEY];
static char val[MAX_TAG_VAL];

char*
getNameFromPath(char *path) {
    char *p;
    // Find first character after last slash.
    for(p=path+strlen(path); p >= path && *p != '/'; p--)
        ;
    p++;

    return p;
}

int 
isqualified(int fd,struct stat st, char *name) {
    char buf[30];
    if ((fname[0] != 0) && (strcmp(fname, name) != 0))
        return 0;
    if (size != -1) {
        printf(1, "size: %d\n", st.size);
        switch(size_modifier) {
            case 0: 
                if (st.size != size) 
                    return 0;
                break;
            case '+' :  
                if (st.size <= size) 
                    return 0;
                break;
            case '-' :  
                if (st.size >= size) 
                    return 0;
                break;
            default: 
                break;
        }
    }
    switch (type) {
        case 'd': 
            if (st.type != T_DIR) 
                return 0; 
            break;
        case 'f': 
            if (st.type != T_FILE) 
                return 0; 
            break;
        case 's': 
            if (st.type != T_SYMLINK)
                return 0; 
            break;
        default: 
            break;
    }

    if (key[0] != 0 && val[0] != 0) {
        //printf(1,"key = %s , val = %s\n",key,val);
        if (gettag(fd,key,buf) > 0) {
            //printf(1,"key = %s , val = %s, buf = %s\n",key,val,buf);
            if (strcmp(val,"?") != 0 && strcmp(val,buf) != 0)
                return 0;
        }  
        else
        {
            //printf(1,"return 0. key = %s , val = %s, buf = %s\n",key,val,buf);
            return 0;
        }

    }
    return 1;
}

int 
find(char* path, char *name) {
    char buf[BSIZE], *p;
//    char sympath[BSIZE];
    int fd;
    struct dirent de;
    struct stat st;

    //printf(1, "find: path = %s, follow = %d\n", path, follow);

	if(follow == 1)
	{
	  readlink(path, buf, strlen(path));
	}
  
    if((fd = open(path, O_RDONLY | O_NTDRFCE)) < 0){
        printf(2, "find: cannot open %s\n", path);
        return -1;
    }

    if(fstat(fd, &st) < 0){
        printf(2, "find: cannot stat %s\n", path);
        close(fd);
        return -1;
    }

    //printf(1, "find: st.type is %d\n", st.type);
    switch(st.type){
        case T_FILE:
            //printf(1, "it's a file. name = %s\n", name);
            if (isqualified(fd,st,name)) {
                printf(1, "%s\n", name);
            }
            break;

        case T_DIR:
            //printf(1, "it's a directory.\n");
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
                printf(1, "find: path too long\n");
                break;
            }
            strcpy(buf, path);

            if (isqualified(fd,st, getNameFromPath(path))) {
                printf(1, "%s\n", path);
            }
            p = buf+strlen(buf);
	    
            if(strcmp(buf,"/") != 0)
	    	  *p++ = '/';

            while(read(fd, &de, sizeof(de)) == sizeof(de)){
                if(de.inum == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                p[DIRSIZ] = 0;
				
				if (de.name[0] == '.')
					continue;
                find(buf, de.name);
            }
            break;
		case T_SYMLINK:
			if (isqualified(fd,st, getNameFromPath(path))) {
                printf(1, "%s\n", path);
            }
			break;
    }
    close(fd);
    return 0;
}

int 
main(int argc, char *argv[]) {

    int i;
    char *delimiter;
    
    //initial values
    fname[0] = 0;
    size = -1;			
    size_modifier = 0;
    type = 0;
    follow = 0;
    key[0] = 0;
    val[0] = 0;

    if (argc == 1)
        exit();

    if (strcmp(argv[2], "-follow") == 0)
        follow = 1;		/* follow symlinks */

    for (i = 2 + follow; i < argc; i += 2) {
        if (strcmp(argv[i], "-name") == 0)
            strcpy(fname, argv[i+1]);
        else if (strcmp(argv[i], "-size")==0){
            switch(argv[i+1][0]) {
                case '+': 
                    size_modifier = '+'; 
                    size = atoi(&argv[i+1][1]); 
                    break;
                case '-': 
                    size_modifier = '-'; 
                    size = atoi(&argv[i+1][1]); 
                    break;
                default:  
                    size_modifier = 0; 
                    size = atoi(&argv[i+1][0]); 
                    break;
            }
        } 
        else if (strcmp(argv[i], "-type")==0) {
            switch (argv[i+1][0]) {
                case 'd': 
                    type = 'd'; 
                    break;
                case 'f': 
                    type = 'f'; 
                    break;
                case 's': 
                    type = 's'; 
                    break;
                default: 
                    printf(2, "illegal file type: %s\n", argv[i+1]); 
                    return -1;
            }
        } 
        else if (strcmp(argv[i], "-tag")==0) {
            delimiter = strchr(argv[i+1],'=');
            *delimiter = 0;
            strcpy(key,argv[i+1]);
            strcpy(val,delimiter+1);
            //printf(1,"find.c main: tag is: key = %s, val = %s\n",key,val);
        }
    }

    //printf(1, "find.c main: fname = %s, size = %d, size_modifier = %s, type = %c\n",fname, size, size_modifier, type);
    find(argv[1], getNameFromPath(argv[1]));
    exit();
}