#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s[103];
int mas[1001] = {0};
int main(int argc, char** args) {

    fgets(s, 103, stdin);
    s[strlen(s) - 1] = '\0';

    int b = strlen(s), im = b - 2, jm = b - 1;
    for (int i = 0; i < im; i++) {
        for (int j = i + 1; j < jm; j++) {
            for (int v = j + 1; v < b; v++) {
                mas[(s[i] - '0')*100+(s[j] - '0')*10+(s[v] - '0')] = 1;
            }
        }
    }

    int sum = 0;
    for (int i = 100; i < 1000; i++) {
        sum += mas[i];
    }

    printf("%d", sum);
    printf("\n");
    return 0;
}