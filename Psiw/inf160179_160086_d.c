#include "inf160179_160086_common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/msg.h>
#include <signal.h>
#include <stdbool.h>
#include <unistd.h>

typedef struct ProducerNode {
    int id;
    char type[MAX_TEXT_LEN];
    struct ProducerNode* next;
} ProducerNode;

typedef struct SubscriptionNode {
    char type[MAX_TEXT_LEN];
    int client_queue_id;
    struct SubscriptionNode* next;
} SubscriptionNode;

typedef struct ClientNode {
    int id;
    int queue_id;
    struct ClientNode* next;
} ClientNode;

ProducerNode* producers = NULL;
SubscriptionNode* subscriptions = NULL;
ClientNode* clients = NULL;
int queue_id;

void add_subscription(int client_queue_id, const char* type) {
    SubscriptionNode* new_node = malloc(sizeof(SubscriptionNode));
    strncpy(new_node->type, type, MAX_TEXT_LEN);
    new_node->client_queue_id = client_queue_id;
    new_node->next = subscriptions;
    subscriptions = new_node;
}

void remove_subscription(int client_queue_id, const char* type) {
    SubscriptionNode* prev = NULL;
    SubscriptionNode* current = subscriptions;
    while (current) {
        if (strcmp(current->type, type) == 0 && current->client_queue_id == client_queue_id) {
            if (prev) prev->next = current->next;
            else subscriptions = current->next;
            free(current);
            return;
        }
        prev = current;
        current = current->next;
    }
}

void send_error(int queue, int error_code, const char* message) {
    struct msgbuf error_msg = {
            .type = MSG_ERROR,
            .id = error_code
    };
    strncpy(error_msg.text, message, MAX_TEXT_LEN);
    msgsnd(queue, &error_msg, sizeof(struct msgbuf) - sizeof(long), 0);
}

void handle_producer_login(struct msgbuf *msg) {
    char *separator = strchr(msg->text, '|');
    *separator = '\0';
    int producer_queue = atoi(msg->text);
    char *typ = separator + 1;

    ProducerNode *current = producers;
    while (current) {
        if (current->id == msg->id) {
            send_error(producer_queue, 4, "Producent o tym ID już istnieje");
            return;
        }
        current = current->next;
    }

    current = producers;
    while (current) {
        if (strcmp(current->type, typ) == 0) {
            send_error(producer_queue, 5, "Producent o tym typie już istnieje");
            return;
        }
        current = current->next;
    }

    ProducerNode *new_node = malloc(sizeof(ProducerNode));
    new_node->id = msg->id;
    strncpy(new_node->type, typ, MAX_TEXT_LEN);
    new_node->next = producers;
    producers = new_node;

    printf("[PRODUCENT] Zarejestrowano: ID=%d, Typ=%s\n", msg->id, typ);

    struct msgbuf ack = {.type = MSG_PRODUCER_LOGIN};
    msgsnd(producer_queue, &ack, sizeof(struct msgbuf) - sizeof(long), 0);
}

void handle_client_login(struct msgbuf *msg) {
    ClientNode* existing = clients;
    while (existing) {
        if (existing->id == msg->id) {
            send_error(atoi(msg->text), 3, "Klient o tym ID już istnieje");
            return;
        }
        existing = existing->next;
    }

    ClientNode* new_client = malloc(sizeof(ClientNode));
    new_client->id = msg->id;
    new_client->queue_id = atoi(msg->text);
    new_client->next = clients;
    clients = new_client;
    printf("[KLIENT] Zarejestrowano: ID=%d, Kolejka=%d\n", msg->id, new_client->queue_id);
}

void handle_get_types_request(struct msgbuf *msg) {
    ClientNode* client = clients;
    while (client && client->id != msg->id) client = client->next;
    if (!client) return;

    char types_buffer[MAX_TEXT_LEN] = {0};
    char* ptr = types_buffer;
    ProducerNode* current = producers;

    while (current) {
        bool exists = false;
        char* check = types_buffer;
        while (*check) {
            if (strcmp(check, current->type) == 0) {
                exists = true;
                break;
            }
            check += strlen(check) + 1;
        }

        if (!exists) {
            strcpy(ptr, current->type);
            ptr += strlen(current->type) + 1;
        }
        current = current->next;
    }
    *ptr = '\0';

    struct msgbuf response = {
            .type = MSG_GET_TYPES_RESPONSE,
            .id = msg->id
    };
    memcpy(response.text, types_buffer, MAX_TEXT_LEN);
    msgsnd(client->queue_id, &response, sizeof(struct msgbuf) - sizeof(long), 0);
}

void handle_subscribe(struct msgbuf *msg) {
    ClientNode* client = clients;
    while (client && client->id != msg->id) client = client->next;
    if (!client) return;

    ProducerNode* p = producers;
    bool type_exists = false;
    while(p) {
        if(strcmp(p->type, msg->text) == 0) {
            type_exists = true;
            break;
        }
        p = p->next;
    }

    if(!type_exists) {
        send_error(client->queue_id, 2, "Typ producenta nie istnieje");
        return;
    }

    SubscriptionNode* sub_current = subscriptions;
    while (sub_current) {
        if (sub_current->client_queue_id == client->queue_id &&
            strcmp(sub_current->type, msg->text) == 0) {
            send_error(client->queue_id, 6, "Klient już subskrybuje ten typ");
            return;
        }
        sub_current = sub_current->next;
    }

    add_subscription(client->queue_id, msg->text);
    printf("[SUBSKRYPCJA] Klient %d ← %s\n", msg->id, msg->text);
}

void handle_unsubscribe(struct msgbuf *msg) {
    ClientNode* client = clients;
    while (client && client->id != msg->id) client = client->next;
    if (!client) return;

    remove_subscription(client->queue_id, msg->text);
    printf("[REZYGNACJA] Klient %d - %s\n", msg->id, msg->text);
}

void handle_notification(struct msgbuf *msg) {
    ProducerNode* producer = producers;
    while (producer && producer->id != msg->id) producer = producer->next;
    if (!producer) return;

    printf("[POWIADOMIENIE] %s (ID:%d): %s\n",
           producer->type, msg->id, msg->text);

    SubscriptionNode* sub = subscriptions;
    while (sub) {
        if (strcmp(sub->type, producer->type) == 0) {
            struct msgbuf notification = {
                    .type = MSG_NOTIFICATION,
                    .id = msg->id,
            };

            char buffer[MAX_TEXT_LEN];
            int written = snprintf(buffer, MAX_TEXT_LEN, "[%s] ", producer->type);
            strncat(buffer, msg->text, MAX_TEXT_LEN - written - 1);
            buffer[MAX_TEXT_LEN - 1] = '\0';
            strncpy(notification.text, buffer, MAX_TEXT_LEN);

            notification.text[MAX_TEXT_LEN - 1] = '\0';
            msgsnd(sub->client_queue_id, &notification,
                   sizeof(struct msgbuf) - sizeof(long), 0);
        }
        sub = sub->next;
    }
}

void cleanup() {
    printf("\n=== ZAMYKANIE SYSTEMU ===\n");
    msgctl(queue_id, IPC_RMID, NULL);
    exit(0);
}

int main() {
    signal(SIGINT, (void (*)(int))cleanup);
    queue_id = msgget(QUEUE_KEY, IPC_CREAT | 0666);
    printf("\n=== DYSPOZYTOR URUCHOMIONY ===\nKolejka: %d\n", queue_id);

    struct msgbuf msg;
    while (1) {
        if (msgrcv(queue_id, &msg, sizeof(struct msgbuf) - sizeof(long), 0, 0) == -1) continue;

        switch ((MsgType)msg.type) {
            case MSG_PRODUCER_LOGIN: handle_producer_login(&msg); break;
            case MSG_CLIENT_LOGIN: handle_client_login(&msg); break;
            case MSG_GET_TYPES_REQUEST: handle_get_types_request(&msg); break;
            case MSG_SUBSCRIBE: handle_subscribe(&msg); break;
            case MSG_UNSUBSCRIBE: handle_unsubscribe(&msg); break;
            case MSG_NOTIFICATION: handle_notification(&msg); break;
            case MSG_EXIT: cleanup(); break;
            default: break;
        }
    }
}