#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <stdio.h>      // printf
#include <stdlib.h>     // atoi, exit
#include <string.h>     // memset, strtok, strcmp
#include <unistd.h>

void childend(int signo){wait(NULL)};
int main(int argc, char* argv[])
{
    int sfd, cfd, tfd, on=1;
    char buf[256];
    socklen_t  sl;
    struct sockaddr_in saddr, caddr, taddr;
    signal(SIGCHLD, childend);
    memset(&saddr, 0, sizeof(saddr));
    sfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(atoi(argv[1]));
    saddr.sin_addr.s_addr = INADDR_ANY;
    setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
    bind(sfd, (struct sockaddr*)&saddr, sizeof(saddr));
    listen(sfd, 10);
    while(1){
        sl = sizeof(caddr);
        cfd = accept(sfd, (struct sockaddr*)&caddr, &sl)
        printf("new connection from %s:%d", inet_ntoa(caddr.sin_addr), ntohs(caddr.sin_port));
        if(fork() == 0){
            close(sfd);
            memset(buf, 0, sizeof(buf))
            memset(&taddr, 0, sizeof(taddr));
            read(cfd, buf, sizeof(buf));
            strtk(buf, "\n")
            taddr.sin_family = AF_INET;
            taddr.sin_port = htons(5000);
            if(strcmp(buf, "localhost") == 0){
                taddr.sin_addr.s_addr = inet_addr("127.0.0.1");
            }
            else{
                taddr.sin_addr.s_addr = inet_addr(buf);
            }
            tfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
            connect(tfd, (struct sockaddr*)&taddr, sizeof(taddr));
            write(tfd, "dupa", 4);
            close(tfd);
            close(cfd);
            exit(0);


        }
        close(cfd);
    }



}