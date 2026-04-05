#include "inf160179_160086_common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>
#include <signal.h>

int client_queue_id;
pid_t child_pid;

void print_error(int code, const char* message) {
    printf("\n=== BŁĄD %d ===\n%s\n======================\n", code, message);
}

void listener() {
    struct msgbuf msg;
    while (1) {
        if (msgrcv(client_queue_id, &msg, sizeof(msg) - sizeof(long), 0, 0) == -1) continue;

        switch (msg.type) {
            case MSG_GET_TYPES_RESPONSE: {
                printf("\n=== DOSTĘPNE TYPY ===\n");
                char* type = msg.text;
                while (*type != '\0') {
                    printf(" - %s\n", type);
                    type += strlen(type) + 1;
                }
                printf("======================\n");
                break;
            }
            case MSG_NOTIFICATION:
                printf("\n=== NOWE POWIADOMIENIE ===\n[ID: %d] %s\n======================\n",
                       msg.id, msg.text);
                break;
            case MSG_ERROR:
                print_error(msg.id, msg.text);
                if (msg.id == 3) {
                    kill(getppid(), SIGTERM);
                    exit(1);
                }
                break;
        }
    }
}

void send_message(int queue_id, long type, const char* text, int id) {
    struct msgbuf msg = { .type = type, .id = id };
    if (text) strncpy(msg.text, text, MAX_TEXT_LEN);
    msgsnd(queue_id, &msg, sizeof(msg) - sizeof(long), 0);
}

void display_menu(int client_id) {
    printf("\n--- MENU KLIENTA %d ---\n", client_id);
    printf("1. Pobierz listę typów\n");
    printf("2. Subskrybuj typ\n");
    printf("3. Anuluj subskrypcję\n");
    printf("4. Wyjdź\n");
    printf("Wybierz opcję: ");
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        print_error(1, "Nieprawidłowa liczba argumentów\nUżycie: ./klient <ID>");
        exit(1);
    }

    int client_id = atoi(argv[1]);
    client_queue_id = msgget(IPC_PRIVATE, IPC_CREAT | 0666);
    int disp_queue_id = msgget(QUEUE_KEY, 0666);

    struct msgbuf login_msg = {
            .type = MSG_CLIENT_LOGIN,
            .id = client_id
    };
    snprintf(login_msg.text, MAX_TEXT_LEN, "%d", client_queue_id);
    msgsnd(disp_queue_id, &login_msg, sizeof(login_msg) - sizeof(long), 0);

    if ((child_pid = fork()) == 0) {
        listener();
        exit(0);
    }

    sleep(1);

    while (1) {
        display_menu(client_id);

        int choice;
        scanf("%d", &choice);
        while(getchar() != '\n');

        switch (choice) {
            case 1:
                send_message(disp_queue_id, MSG_GET_TYPES_REQUEST, NULL, client_id);
                sleep(1);
                break;

            case 2: {
                printf("Podaj typ do subskrypcji: ");
                char type[MAX_TEXT_LEN];
                fgets(type, MAX_TEXT_LEN, stdin);
                type[strcspn(type, "\n")] = '\0';
                send_message(disp_queue_id, MSG_SUBSCRIBE, type, client_id);
                sleep(1);
                break;
            }

            case 3: {
                printf("Podaj typ do anulowania: ");
                char type[MAX_TEXT_LEN];
                fgets(type, MAX_TEXT_LEN, stdin);
                type[strcspn(type, "\n")] = '\0';
                send_message(disp_queue_id, MSG_UNSUBSCRIBE, type, client_id);
                sleep(1);
                break;
            }

            case 4:
                kill(child_pid, SIGTERM);
                msgctl(client_queue_id, IPC_RMID, NULL);
                exit(0);
            default:
                print_error(0, "Nieznana opcja!");
                break;
        }
    }
}