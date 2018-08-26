#include "types.h"
#include "user.h"
#include "stat.h"
#include "fcntl.h"


int main(int argc, char *argv[]){

  char buf[1024];
  for(int i = 0; i<1024; i++){
    buf[i] = 'a';
  }

  int fd = open("test1", O_RDWR | O_CREATE);
  for(int i = 0; i < 6; i++){
    // printf(1, "inside loop\n");
    if(write(fd,buf,1024) != 1024){
        printf(1, "error!\n");
        exit();
    }
  }
  printf(1, "Finished writing 6KB (direct)\n");  
  
  for(int i = 0; i < 64; i++){
    // printf(1, "inside loop\n");
    if(write(fd,buf,1024) != 1024){
        printf(1, "error!\n");
        exit();
    }
  }
  printf(1, "Finished writing 70KB (single indirect)\n");

  for(int i = 0; i < 954; i++){
    // printf(1, "inside loop\n");
    if(write(fd,buf,1024) != 1024){
        printf(1, "error!\n");
        exit();
    }
  }
  printf(1, "Finished writing 1MB\n");
  close(fd);
  exit();
}
