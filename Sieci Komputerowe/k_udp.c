#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char* argv[]){
    int rc, cfd;
    char buf[256];
    struct hostent* hst = gethostbyname(argv[1]);
    socklen_t sl;
    struct sockaddr_in saddr;
    memset(&saddr, 0, sizeof(saddr));
    cfd = socket(PF_INET, SOCK_DGRAM,  IPPROTO_UDP)
    saddr.sin_family = AF_INET;
    saadr.sin_port = htons(atoi(argv[2]));
    memcpy(&saddr.sin_addr.s_addr, hst->h_addr, hst->h_length);
    sendto(cfd, "dupa", 4, 0,(struct sockaddr*) &saddr, sizeof(saddr));
    sl = sizeof(saddr);
    rc = recvfrom(cfd, buf, sizeof(buf), 0, (struct sockaddr*) &saddr, &sl);
    write(1, buf, rc);
    close(cfd);

}