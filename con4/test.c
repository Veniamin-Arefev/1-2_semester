#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s1[2000001], s[2000001];
int ind[2000001] = {0}, count[2000001] = {0};
int indmax[2000001] = {0};
int main(int argc, char** args) {

    fgets(s1, 2000001, stdin);
    s1[strlen(s1) - 1] = '\0';
    int b = strlen(s1);

    int onenum = -1;
    for (int i = 0; i < b; i++) {
        if (s1[i] == '1') {
            onenum = i;
            break;
        }
    }
    if (onenum != -1) {
        memcpy(s, s1 + onenum, b - onenum);
        memcpy(s + b - onenum, s1 , onenum);
    }


    printf("s1 = %s\n", s1);
    printf("s = %s\n", s);
    printf("\n");

}