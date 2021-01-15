#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char** args) {

    int i = 0;

    int *ch = {0}, *nech = {0};;
    int kolch = 0, kolnech = 0;
    int a = 1;
    scanf("%d", &a);
    while(a != 0) {
        if (i % 2) { // ch
            kolch++;
            ch = realloc(ch , sizeof(int) * kolch);
            ch[kolch - 1] = a;
        } else {
            kolnech++;
            nech = realloc(nech , sizeof(int) * kolnech);
            nech[kolnech - 1] = a;
        }
        i ^= 1;
        scanf("%d", &a);
    }

    for (int i = 0; i < kolnech; i++) {
        printf("%d ", nech[i]);
    }
    for (int i = 0; i < kolch; i++) {
        printf("%d ", ch[i]);
    }

    printf("\n");
    return 0;
}