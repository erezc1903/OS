 
#include "types.h"
#include "user.h"
#include "fcntl.h"

void checktag(int fd,char* key, char* val)
{
    if (ftag(fd, key, val) == 0)
        printf(1, "tagging %s = %s successful\n",key, val);
    else
        printf(2, "tagging %s = %s failed \n",key, val);
}

void checkuntag(int fd,char* key)
{
   if (funtag(fd, key) == 0)
       printf(1, "untagging key = %s successful\n",key);
   else
       printf(2, "untagging key = %s failed \n",key);
}

void checkgettag(int fd,char* key)
{
    char buffer[30];
    //printf(1, "checkgettag: buf is %s\n", buffer);
    if (gettag(fd, key,buffer) > 0)
        printf(1, "gettag  successful, key = %s, val = %s\n",key,buffer);
    else
        printf(2, "gettag failed,key = %s \n",key);
}

int main(int argc, char *argv[])
{
    int fd;

    if ((fd = open("a", O_RDONLY | O_NTDRFCE)) < 0) {
        printf(2,"open failed\n");
        exit();
    }

    /*checktag(fd, "z", "x");
    checkgettag(fd,"z");
    checktag(fd, "z", "hello");
    checkgettag(fd,"z");
    checktag(fd, "c", "v");
    checkgettag(fd,"c");
    checktag(fd, "z", "hi");
    checkgettag(fd,"z");

    checktag(fd, "key1", "value1");
    checktag(fd, "key2", "value2");
    checktag(fd, "key3", "value3");
    checktag(fd, "key4", "value4");
    checktag(fd, "key5", "value5");
    checktag(fd, "key6", "value6");
    checktag(fd, "key7", "value7");

    checkgettag(fd,"key1");
    checkgettag(fd,"key2");
    checkgettag(fd,"key3");
    checkgettag(fd,"key4");
    checkgettag(fd,"key5");
    checkgettag(fd,"key6");
    checkgettag(fd,"key7");

    checktag(fd, "key3", "c3");
    checkgettag(fd,"key3");
   
    checkuntag(fd,"key1");
    checkuntag(fd,"key2");
    checkuntag(fd,"key3");*/
    /* checkuntag(fd,"key4"); */
    /* checkuntag(fd,"key5"); */
    /* checkuntag(fd,"key6"); */
    /* checkuntag(fd,"key7"); */

    /*checkgettag(fd,"key1");
    checkgettag(fd,"key2");
    checkgettag(fd,"key3");
    checkgettag(fd,"key4");
    checkgettag(fd,"key5");
    checkgettag(fd,"key6");
    checkgettag(fd,"key7");
    //checkgettag(fd,"key3");*/
    checkgettag(fd,"key4");


    close(fd);
    exit();
}
