#include "inf160179_160086_common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/msg.h>

void print_error(int code, const char* message) {
    printf("\n=== BŁĄD %d ===\n%s\n======================\n", code, message);
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        print_error(1, "Nieprawidłowa liczba argumentów\nUżycie: ./producenci <ID> <TYP>");
        exit(1);
    }

    int producer_queue = msgget(IPC_PRIVATE, IPC_CREAT | 0666);
    int disp_queue_id = msgget(QUEUE_KEY, 0666);

    struct msgbuf login_msg = {
            .type = MSG_PRODUCER_LOGIN,
            .id = atoi(argv[1])
    };
    snprintf(login_msg.text, MAX_TEXT_LEN, "%d|%s", producer_queue, argv[2]);

    msgsnd(disp_queue_id, &login_msg, sizeof(struct msgbuf) - sizeof(long), 0);

    struct msgbuf response;
    msgrcv(producer_queue, &response, sizeof(struct msgbuf) - sizeof(long), 0, 0);

    if (response.type == MSG_ERROR) {
        print_error(response.id, response.text);
        msgctl(producer_queue, IPC_RMID, NULL);
        exit(1);
    }

    printf("\n=== PRODUCENT %s GOTOWY ===\n", argv[2]);
    while (1) {
        printf("> ");
        fflush(stdout);

        char message[MAX_TEXT_LEN];
        if (fgets(message, MAX_TEXT_LEN, stdin)) {
            message[strcspn(message, "\n")] = '\0';
            struct msgbuf notification = {
                    .type = MSG_NOTIFICATION,
                    .id = atoi(argv[1]),
            };
            strncpy(notification.text, message, MAX_TEXT_LEN);
            msgsnd(disp_queue_id, &notification, sizeof(struct msgbuf) - sizeof(long), 0);
        }
    }

    msgctl(producer_queue, IPC_RMID, NULL);
    return 0;
}