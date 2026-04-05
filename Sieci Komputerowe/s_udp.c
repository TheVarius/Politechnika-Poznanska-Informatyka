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
    int sfd, on = 1; 
    char buf[256];
    socklen_t sl;
    struct sockaddr_in saddr, caddr;
    
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(1234);
    saddr.sin_addr.s_addr = INADDR_ANY;
    
    sfd = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
    
    setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, (char*)&on, sizeof(on));
    bind(sfd, (struct sockaddr*) &saddr, sizeof(saddr));
    

    printf("Serwer UDP czeka na indeksy...\n");

    while(1){
        sl = sizeof(caddr);
        memset(buf, 0, sizeof(buf));
        int rc = recvfrom(sfd, buf, sizeof(buf) - 1, 0, (struct sockaddr*) &caddr, &sl);
        printf("Wiadomosc od %s:%d\n", inet_ntoa(caddr.sin_addr), ntohs(caddr.sin_port));
        if (strncmp(buf, "160146", 6) == 0) {
                sendto(sfd, "opd lech\n", 9, 0, (struct sockaddr*) &caddr, sl);
                printf(" -> Poprawny. Wyslano: opd lech\n")}
        else {
                sendto(sfd, "legia\n", 6, 0, (struct sockaddr*) &caddr, sl);
                printf(" -> Zly indeks (%s). Wyslano: legia\n", buf);
            }
        
    }
    
    close(sfd);
}