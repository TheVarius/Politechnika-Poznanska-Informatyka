#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <stdio.h>      
#include <stdlib.h>     
#include <string.h>     
#include <unistd.h>
#include <netdb.h>      

void childend(int signo){ wait(NULL); }

int main(int argc, char* argv[])
{
    // BRAK if(argc < 2). Zakładamy, że argv[1] istnieje.
    
    int sfd, cfd, tfd, on=1;
    char buf[256];
    socklen_t sl;
    struct sockaddr_in saddr, caddr, taddr;
    struct hostent *h; 

    signal(SIGCHLD, childend);

    memset(&saddr, 0, sizeof(saddr));
    
    sfd = socket(PF_INET, SOCK_STREAM, 0);
    setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));

    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(atoi(argv[1]));
    saddr.sin_addr.s_addr = INADDR_ANY;

    bind(sfd, (struct sockaddr*)&saddr, sizeof(saddr));
    listen(sfd, 10);
    
    printf("Start na %s\n", argv[1]);

    while(1){
        sl = sizeof(caddr);
        cfd = accept(sfd, (struct sockaddr*)&caddr, &sl);
        
        printf("Klient: %s:%d\n", inet_ntoa(caddr.sin_addr), ntohs(caddr.sin_port));
        
        if(fork() == 0){
            close(sfd); 
            
            memset(buf, 0, sizeof(buf));
            read(cfd, buf, sizeof(buf));
            strtok(buf, "\n"); 

            tfd = socket(PF_INET, SOCK_STREAM, 0);
            memset(&taddr, 0, sizeof(taddr));
            taddr.sin_family = AF_INET;
            taddr.sin_port = htons(5000); 

            // BRAK if(h != NULL). Zakładamy sukces.
            // gethostbyname obsłuży "localhost" i zazwyczaj też "127.0.0.1"
            h = gethostbyname(buf); 
            
            // Kopiujemy w ciemno (jak h będzie NULL, tu będzie SegFault)
            memcpy(&taddr.sin_addr, h->h_addr, h->h_length);

            connect(tfd, (struct sockaddr*)&taddr, sizeof(taddr));
            write(tfd, "160179\n", 7);
            
            close(tfd);
            close(cfd);
            exit(0);
        }
        close(cfd); 
    }
}