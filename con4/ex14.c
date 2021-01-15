#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s[1000001];
int mas[1000001] = {0};
int main(int argc, char** args) {

    int n = 0;

    fgets(s, 1000001, stdin);
    s[strlen(s) - 1] = '\0';
    int b = strlen(s);
    int chbef = 0, chpos = 0, nechbef = 0, nechpos = 0;
    //printf("b = %d\n", b);
    for(int i = 1; i < b; i++) { // element that we delete
        if (s[i] == 'A') {
            i % 2 == 1? chpos++ : nechpos++;
        }
    }
    if (chpos == nechpos) {
        mas[n] = 0;
        n++;
    }

    // printf("chbef = %d, chpos = %d, nechbef = %d, nechpos = %d\n", chbef, chpos, nechbef, nechpos);

    for(int i = 1; i < b; i++) { // element that we delete
        if (s[i] == 'A') {
            i % 2 == 1? chpos-- : nechpos--;
        }
        if (s[i-1] == 'A') {
            i % 2 == 1? chbef++ : nechbef++;
        }

        if ((chpos + chbef) == (nechpos + nechbef)) {
            mas[n] = i;
            n++;
        }
        //printf("chbef = %d, chpos = %d, nechbef = %d, nechpos = %d\n", chbef, chpos, nechbef, nechpos);
    }

    //  printf("\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", mas[i] + 1);
    }

    printf("\n");
    return 0;
}
