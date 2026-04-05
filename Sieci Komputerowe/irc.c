#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/epoll.h>

#define PORT 1234
#define MAXEVENTS 32
#define MAXCLIENTS 64
#define MAXROOMS 8
#define MAXMSGS 256
#define BUFSZ 256
#define NAMELEN 32

typedef struct
{
    char text[BUFSZ];
} Message;

typedef struct
{
    char name[NAMELEN];
    char password[NAMELEN]; // empty => public, no password required
    char owner[NAMELEN];    // name of room owner: owner gives privilege to ban user or remove room
    int used;               // used to keep track which room array indices are used (especially after some are deleted)
    int banned[MAXCLIENTS]; // list of banned usernames
    Message msgs[MAXMSGS];  // messages stored as cyclic buffor
    int head, count;        // head contains index of newest message, count has max(number of messages, MAXMSGS)
} Room;

typedef struct
{
    int fd;                 // client descriptor
    char name[NAMELEN];     // username
    int room;               // current room index, -1 if not in room
    char buf[BUFSZ];        // buffor for received messages
    int len;                // current position in buffor (when receiving partial messages)
} Client;


Client clients[MAXCLIENTS];
Room rooms[MAXROOMS];


//helper functions
void setnonblock(int fd)
{
    int flags = fcntl(fd, F_GETFL, 0);
    fcntl(fd, F_SETFL, flags | O_NONBLOCK);
}

//return client of given descriptor
Client *get_client(int fd)
{
    for (int i = 0; i < MAXCLIENTS; i++)
        if (clients[i].fd == fd)
            return &clients[i];
    return NULL;
}

//add new client to global client list
Client *new_client(int fd)
{
    for (int i = 0; i < MAXCLIENTS; i++)
        if (clients[i].fd == 0) {
            clients[i].fd = fd;
            clients[i].room = -1;
            clients[i].len = 0;
            clients[i].name[0] = 0;
            return &clients[i];
        }
    return NULL;
}

//return client index of given username
int find_client_by_name(const char *name)
{
    for (int i = 0; i < MAXCLIENTS; i++)
        if (clients[i].fd && !strcmp(clients[i].name, name))
            return i;
    return -1;
}

//check if client is room owner
int is_owner(Client *c, Room *r)
{
    return !strcmp(c->name, r->owner);
}

//send message to a room
void room_add_msg(Room *r, const char *user, const char *msg)
{
    snprintf(r->msgs[r->head].text, BUFSZ, "%s: %s\n", user, msg);
    r->head = (r->head + 1) % MAXMSGS;
    if (r->count < MAXMSGS) r->count++;
}

//send whole message history to a joining client
void send_history(int fd, Room *r)
{
    int idx = (r->head - r->count + MAXMSGS) % MAXMSGS; //cyclic buffor- Send {count} number of messages ending with [head]
    for (int i = 0; i < r->count; i++) {
        Message *m = &r->msgs[(idx + i) % MAXMSGS];
        write(fd, m->text, strlen(m->text));
    }
}

void remove_room(int rid)
{
    for (int i = 0; i < MAXCLIENTS; i++)
        if (clients[i].fd && clients[i].room == rid)
            clients[i].room = -1;

    memset(&rooms[rid], 0, sizeof(Room)); //remove room data
}

void broadcast_user_list(int rid) {
    if (rid < 0) return;
    char list_msg[1024] = "START_USER_LIST\n";
    for (int j = 0; j < MAXCLIENTS; j++) {
        if (clients[j].fd > 0 && clients[j].room == rid) {
            strcat(list_msg, "USER_IN_ROOM: ");
            strcat(list_msg, clients[j].name);
            strcat(list_msg, "\n");
        }
    }
    strcat(list_msg, "END_USER_LIST\n");
    for (int j = 0; j < MAXCLIENTS; j++) {
        if (clients[j].fd > 0 && clients[j].room == rid) {
            write(clients[j].fd, list_msg, strlen(list_msg));
        }
    }
}

void send_help(int fd)
{
    const char *h =
        "/help                              - show this\n"
        "/rooms                             - show list of all rooms\n"                                  
        "/create <room> [password]          - make room (password optional)\n"
        "/join <room> [password]            - join room (password optional)\n"
        "/leave                             - leave current room\n"
        "/remove <room>      (owner only)   - delete room\n"
        "/ban <room> <user>  (owner only)   - ban/unban user from room (toggle)\n";
    write(fd, h, strlen(h));
}


//main
int main(void)
{
    int sfd, cfd, efd, nfds, i, on = 1;
    struct sockaddr_in saddr, caddr;
    struct epoll_event event, events[MAXEVENTS];
    socklen_t slt = sizeof(caddr);

    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = INADDR_ANY;
    saddr.sin_port = htons(PORT);

    sfd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));
    setnonblock(sfd);
    bind(sfd, (struct sockaddr*)&saddr, sizeof(saddr));
    listen(sfd, 10);

    efd = epoll_create1(0);
    event.events = EPOLLIN;
    event.data.fd = sfd;
    epoll_ctl(efd, EPOLL_CTL_ADD, sfd, &event);

    printf("Server listening on port %d\n", PORT);

    while (1)
    {
        nfds = epoll_wait(efd, events, MAXEVENTS, -1);

        for (i = 0; i < nfds; i++)
        {
            int fd = events[i].data.fd;

            if (fd == sfd)
            {
                cfd = accept(sfd, (struct sockaddr*)&caddr, &slt);
                setnonblock(cfd);

                event.events = EPOLLIN;
                event.data.fd = cfd;
                epoll_ctl(efd, EPOLL_CTL_ADD, cfd, &event);

                new_client(cfd);
                write(cfd, "Enter username:\n", 16);
                printf("Client connected from %s:%d (fd=%d)\n", inet_ntoa((struct in_addr)caddr.sin_addr),ntohs(caddr.sin_port), cfd);
            }
            else
            {
                Client *c = get_client(fd);
                if (!c) continue;

                int r = read(fd, c->buf + c->len, BUFSZ - c->len - 1); //len keeps track of position in buffor in case messages are sent partially
                if (r <= 0) {
                    printf("Client disconnected (%s)\n", c->name);
                    
                    int room_to_update = c->room; 

                    epoll_ctl(efd, EPOLL_CTL_DEL, fd, NULL);
                    close(fd);
                    memset(c, 0, sizeof(*c));

                    if (room_to_update != -1) {
                        broadcast_user_list(room_to_update); 
                    }
                    continue;
                }

                c->len += r;
                c->buf[c->len] = 0;

                char *nl;
                while ((nl = strchr(c->buf, '\n'))) //only process when \n is encountered so message is complete
                {
                    *nl = 0;
                    char line[BUFSZ];
                    strcpy(line, c->buf);
                    memmove(c->buf, nl + 1,
                            c->len - (nl - c->buf) - 1);
                    c->len -= (nl - c->buf) + 1;


                    //if name is null set username
                    if (!c->name[0])
                    {
                        strncpy(c->name, line, NAMELEN);
                        printf("User set name: %s\n", c->name);
                        write(fd, "Welcome! Type /help\n", 20);
                        continue;
                    }

                    //commands
                    if (!strcmp(line, "/help"))
                    {
                        send_help(fd);
                    }
                    else if (!strcmp(line, "/rooms"))
                    {
                        
                        int my_idx = -1;
                        for (int j = 0; j < MAXCLIENTS; j++) {
                            if (&clients[j] == c) { my_idx = j; break; }
                        }

                        for (int k = 0; k < MAXROOMS; k++)
                            if (rooms[k].used) {
                                
                                if (my_idx >= 0 && rooms[k].banned[my_idx]) continue;

                                write(fd, rooms[k].name, strlen(rooms[k].name));
                                if (rooms[k].password[0])
                                    write(fd, " (private)", 10);
                                write(fd, "\n", 1);
                            }
                    }
                   else if (!strncmp(line, "/create ", 8))
                    {
                        char rname[NAMELEN] = "", pass[NAMELEN] = "";
                        sscanf(line + 8, "%31s %31s", rname, pass);
                        for (int k = 0; k < MAXROOMS; k++)
                            if (!rooms[k].used) {
                                strcpy(rooms[k].name, rname);
                                strcpy(rooms[k].password, pass);
                                strcpy(rooms[k].owner, c->name);
                                rooms[k].used = 1;
                                rooms[k].head = rooms[k].count = 0;
                                c->room = k;
                                
                                printf("Room created: %s by %s\n", rname, c->name);
                                write(fd, "JOIN_SUCCESS\n", 13);
                                write(fd, "OWNER_STATUS: 1\n", 16); 
                                broadcast_user_list(k);
                                break;
                            }
                    }
                   else if (!strncmp(line, "/join ", 6))
                    {
                        char rname[NAMELEN] = "", pass[NAMELEN] = "";
                        memset(pass, 0, NAMELEN);
                        sscanf(line + 6, "%31s %31s", rname, pass);
                        int k;
                        for (k = 0; k < MAXROOMS; k++) {
                            if (rooms[k].used && !strcmp(rooms[k].name, rname)) {
                                int uidx = find_client_by_name(c->name);
                                if (uidx >= 0 && rooms[k].banned[uidx]) {
                                    write(fd, "ERROR: Banned\n", 15);
                                } else if (rooms[k].password[0] && strcmp(rooms[k].password, pass)) {
                                    write(fd, "ERROR: Wrong password\n", 22);
                                } else {
                                    c->room = k;
                                    write(fd, "JOIN_SUCCESS\n", 13);
                                    if (is_owner(c, &rooms[k])) {
                                        write(fd, "OWNER_STATUS: 1\n", 16);
                                    } else {
                                        write(fd, "OWNER_STATUS: 0\n", 16);
                                    }
                                    send_history(fd, &rooms[k]);
                                    broadcast_user_list(k);
                                }
                                break;
                            }
                        }
                        if (k == MAXROOMS) write(fd, "ERROR: Room not found\n", 22);
                    }
                    else if (!strcmp(line, "/leave"))
                    {
                        if(c->room == -1)
                        {
                            write(fd, "Not in any room\n", 16);
                        }
                        else
                        {
                            int old_rid = c->room;
                            printf("%s left room\n", c->name);
                            c->room = -1;
                            broadcast_user_list(old_rid);
                        }
                        
                    }
                    else if (!strncmp(line, "/remove ", 8))
                    {
                        char rname[NAMELEN];
                        sscanf(line + 8, "%31s", rname);
                        
                        int k;
                        for (k = 0; k < MAXROOMS; k++)
                        {
                            if (rooms[k].used && !strcmp(rooms[k].name, rname)) {

                                if (!is_owner(c, &rooms[k])) {
                                    write(fd, "ERROR: Not owner\n", 17);
                                    break;
                                }

                                for (int j = 0; j < MAXCLIENTS; j++) {
                                    if (clients[j].fd > 0 && clients[j].room == k) {
                                        write(clients[j].fd, "ROOM_DELETED\n", 13);
                                    }
                                }

                                remove_room(k); 
                                printf("Room removed: %s by %s\n", rname, c->name);
                                break;
                            }
                        }
                        if (k == MAXROOMS)
                            write(fd, "ERROR: Room doesn't exist\n", 22);
                    }
                    else if (!strncmp(line, "/ban ", 5)) //toggle user ban
                    {
                        char rname[NAMELEN], uname[NAMELEN];
                        sscanf(line + 5, "%31s %31s", rname, uname);
                        
                        int k;
                        for (k = 0; k < MAXROOMS; k++)
                        {
                            if (rooms[k].used && !strcmp(rooms[k].name, rname))
                            {
                                if (!is_owner(c, &rooms[k])) {
                                    write(fd, "ERROR: Not owner\n", 17);
                                    break;
                                }

                                int idx = find_client_by_name(uname);
                                if (idx < 0) {
                                    write(fd, "ERROR: User not found\n", 22);
                                    break;
                                }

                                rooms[k].banned[idx] = !rooms[k].banned[idx]; // toggle

                                if (rooms[k].banned[idx]) {
                                    if (clients[idx].room == k) {
                                        clients[idx].room = -1;
                                        write(clients[idx].fd, "KICKED_BANNED\n", 14);
                                        broadcast_user_list(k);
                                    }
                                    write(fd, "User banned\n", 12);
                                } else {
                                    write(fd, "User unbanned\n", 14);
                                }
                                break;
                            }
                        }
                    }
                    else if (c->room >= 0) //send message to room
                    {
                        Room *r = &rooms[c->room];
                        room_add_msg(r, c->name, line);
                        for (int m = 0; m < MAXCLIENTS; m++)
                            if (clients[m].fd &&
                                clients[m].room == c->room)
                                write(clients[m].fd,
                                      r->msgs[(r->head - 1 + MAXMSGS) % MAXMSGS].text,
                                      strlen(r->msgs[(r->head - 1 + MAXMSGS) % MAXMSGS].text));
                    }
                    else
                    {
                        write(fd, "Wrong command\n", 14);
                    }
                }
            }
        }
    }
}
