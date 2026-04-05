#include <stdio.h>

int main() {
    int liczba_razy;
    int i, j;
    scanf("%d", &liczba_razy);
    for (i = 1; i <= liczba_razy; i++) {
        for (j = 0; j < i; j++) {
            printf("%s", "O");
        }
        printf("\n");
    }
    return 0;
}