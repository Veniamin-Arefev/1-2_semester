#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s[260];
int mas[260] = {0};
int main(int argc, char** args) {

    int n = 0;

    fgets(s, 260, stdin);
    s[strlen(s) - 1] = '\0';
    int b = strlen(s);
    //printf("b = %d\n", b);
    for(int i = 0; i < b; i++) { // element that we delete
        int ach = 0, anech = 0;;
        for(int j = 0; j < b; j++) {
            if (j == i) {
                continue;
            }
            if (s[j] == 'A') {
                if (j < i) {
                    j % 2 == 0 ? ach++ : anech++;
                } else {
                    j % 2 == 1 ? ach++ : anech++;
                }
            }
        }
        if (ach == anech) {
            mas[n] = i;
            n++;
        }
    }

    printf("\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", mas[i] + 1);
    }

    printf("\n");
    return 0;
}