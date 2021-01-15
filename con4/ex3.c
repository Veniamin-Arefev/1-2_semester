#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s[10002];
int mas[10002] = {0};

int main(int argc, char** args) {

    int n = 0;
    fgets(s, 10002, stdin);
    s[strlen(s) - 1] = '\0';
    int b = strlen(s);
//    printf("%d\n", b);
    for(int i = 1; i <= b; i++) {
        int flag = 0;
//        printf("i =%d\n", i);
        for (int j = 0; j <= i; j++) {
            for (int m = j + i; m < b; m+=i) {
//                printf("%d and %d %c ?= %c\n", j, m, s[j], s[m]);
                if (s[j] != s[m]) {
                    flag = 1;
                    break;
                }
            }
        }
        if (flag == 0) {
            mas[n] = i;
            n++;
        }
    }

//    printf("ASN:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", mas[i]);
    }

    printf("\n");
    return 0;
}