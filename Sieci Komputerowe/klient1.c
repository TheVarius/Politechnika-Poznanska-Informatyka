#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	struct hostent* hst = gethostbyname(argv[1]);
    int cfd, rc;
    char buf[256];
    struct sockaddr_in saddr;
    cfd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(atoi(argv[2]));
    memcpy(&saddr.sin_addr.s_addr, hst->h_addr, hst->h_length);
    connect(cfd, (struct sockaddr*) &saddr, sizeof(saddr));
    rc = read(cfd, buf, sizeof(buf));
    write(1, buf, rc);
    close(cfd);
}
