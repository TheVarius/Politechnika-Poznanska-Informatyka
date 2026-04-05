#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void){
    int cfd, sfd, on = 1;
    socklen_t sl;
    char buf[256];
    struct sockaddr_in saddr, caddr;
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = INADDR_ANY;
    saddr.sin_port = htons(1223);
    sfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, (char*) &on, sizeof(on));
    bind(sfd, (struct sockaddr*) &saddr, sizeof(saddr));
    listen(sfd, 10);
    while(1){
        sl = sizeof(caddr);
        cfd = accept(sfd, (struct sockaddr*) &caddr, &sl);
        printf("new connection from %s:%d", inet_ntoa(caddr.sin_saddr), ntohs(caddr.sin_port));
        write(cfd, "dupa\n", 5);
        close(cfd);
    }
}