#include "types.h"
#include "user.h"
#include "fcntl.h"


static char pathbuf[512];
int callfind(char *args[])
{
    if(exec("find",args)<0)
    {
        printf(2,"callfind failed");
        return -1;
    }
    printf(2,"ERROR: returned from exec");
    return 0;
}
int createfile(char * path,char * filename)
{
    int fd;
    char * data = "randomtextblahblah";
    if(strcmp(path,"")!=0)
    {
        if(strlen(path) + strlen(filename) + 1>512)
            return -1;
        strcpy(path+strlen(path), "/");
        strcpy(path+strlen(path), filename);
    }
    printf(1,"the path before error is: %s\n",path);
    fd = open(path, O_CREATE | O_RDWR);
    if(fd <  0) {
        printf(1, "error: creating text file failed\n");
        exit();
    }
    if(write(fd, &data, strlen(data)) != strlen(data)){
        printf(1, "error: write to backup file failed\n");
        exit();
    }
    close(fd);
    path[strlen(path) - strlen(filename) - 1] = '\0';
    return 0;
}
int simpleTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~simpleTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "/");
    printf(1,"calling find with the path: %s\n should get all the files in the system\n",pathbuf);
    static char *args[2];
    args[0] = "find";
    args[1]=pathbuf;
    callfind(args);
    return 0;
}
int Test1()
{
    printf(1,"~~~~~~~~~~~~~~~~~~Test1~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "Test1/a/b/c");
    printf(1,"creating the path Test1/a/b/c\n");
    mkdir("Test1");
    mkdir("Test1/a");
    mkdir("Test1/a/b");
    mkdir(pathbuf);
    printf(1,"calling find with the path: %s\n",pathbuf);
    static char *args[2];
    args[0] = "find";
    args[1]=pathbuf;
    callfind(args);
    return 0;
}
int DepthTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~DepthTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "DepthTest/a/b/c/d");
    printf(1,"creating the path %s\n",pathbuf);
    mkdir("DepthTest");
    mkdir("DepthTest/a");
    mkdir("DepthTest/a/b");
    mkdir("DepthTest/a/b/c");
    mkdir(pathbuf);
    printf(1,"calling find with the path: %s\n","/");
    static char *args[2];
    args[0] = "find";
    args[1]="/";
    callfind(args);
    return 0;
}
int filenameTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~filenameTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "filenameTest");
    printf(1,"creating the path %s\n",pathbuf);
    mkdir(pathbuf);
    createfile(pathbuf,"filename");
    printf(1,"calling find with the args: %s\n","/ -name filename");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-name";
    args[3]="filename";
    callfind(args);
    return 0;
}
int dirnameTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~dirnameTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "dirnameTest/a/b/thedir");
    printf(1,"creating the path %s\n",pathbuf);
    mkdir("dirnameTest");
    mkdir("dirnameTest/a");
    mkdir("dirnameTest/a/b");
    mkdir(pathbuf);
    printf(1,"calling find with the args: %s\n","/ -name thedir");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-name";
    args[3]="thedir";
    callfind(args);
    return 0;
}
int typeffileTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~typeffileTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "typeffileTest");
    mkdir(pathbuf);
    createfile(pathbuf,"has");
    createfile(pathbuf,"passed");
    printf(1,"calling find with the args: %s\n","/ -type f");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-type";
    args[3]="f";
    callfind(args);
    return 0;
}
int typedfileTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~typedfileTest~~~~~~~~~~~~~~\n");
    memset(pathbuf,0,512);
    strcpy(pathbuf, "typedfileTest");
    mkdir(pathbuf);
    mkdir("typedfileTest/has");
    mkdir("typedfileTest/passed");
    printf(1,"calling find with the args: %s\n","/ -type d");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-type";
    args[3]="d";
    callfind(args);
    return 0;
}
int abv2mbTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~abv2mbTest~~~~~~~~~~~~~~\n");
    printf(1,"calling find with the args: %s\n","/ -size +2048");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-size";
    args[3]="+2048";
    callfind(args);
    return 0;
}
int below2mbTest()
{
    printf(1,"~~~~~~~~~~~~~~~~~~below2mbTest~~~~~~~~~~~~~~\n");
    printf(1,"calling find with the args: %s\n","/ -size -2048");
    static char *args[4];
    args[0] = "find";
    args[1]="/";
    args[2]="-size";
    args[3]="-2048";
    callfind(args);
    return 0;
}
int main(int argc, char *argv[])
{
    /*if(fork() == 0)
        simpleTest();
    wait();
    if(fork() == 0)
        Test1();
    wait();
    if(fork() == 0)
        DepthTest();
    wait();
    if(fork() == 0)
        filenameTest();
    wait();*/
    if(fork() == 0)
        dirnameTest();
    wait();
    if(fork() == 0)
        typeffileTest();
    wait();
    if(fork() == 0)
        typedfileTest();
    wait();
    if(fork() == 0)
        abv2mbTest();
    wait();
    if(fork() == 0)
        below2mbTest();
    wait();
//TODO: tags tests
//TODO: symbol tests   
    exit();
    
} 
