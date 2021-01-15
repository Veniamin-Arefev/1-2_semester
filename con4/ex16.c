#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

//char s1[2000005], s[2000005], st[2000005];
//int ind[2000005] = {0}, count[2000005] = {0};
//int indmax[2000005] = {0};
int main(int argc, char** args) {
    int *ind= (int *) calloc(2000005, sizeof(int));
    int *count = (int *) calloc(2000005, sizeof(int));
    int *indmax = (int *) calloc(2000005, sizeof(int));

    char *s1 = (char *) malloc(2000005);
    char *s = (char *) malloc(2000005);
    char *st = (char *) malloc(2000005);

    if (ind == NULL || count == NULL || indmax == NULL || s1 == NULL || s == NULL || st == NULL) {
        printf("ERROR OCCUPATED. MEMORY NOT FOUND. ERROR 404");
    }

    fgets(s1, 2000005, stdin);
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
    } else {
        memcpy(s, s1, b);
    }

    int flag = 0;
    int ni = 0;
    for(int i = 0; i < b; i++) {
        if ((flag == 0) && (s[i] == '0')) {
            flag = 1;
            ind[ni] = i;
            count[ni] = 1;
        } else {
            if (flag == 1) {
                if (s[i] == '0') {
                    count[ni]++;
                } else {
                    ni++;
                    flag = 0;
                }
            }
        }
    }

    if (flag == 1) {
        ni++;
    }

//    for(int i = 0; i < ni; i++) {
//        printf("Index = %d count = %d\n", ind[i], count[i]);
//    }

    int maxcount = count[0];
    for(int i = 0; i < ni; i++) {
        if (count[i] > maxcount) {
            maxcount = count[i];
        }
    }

    long long maxn = 0;
    for(int i = 0; i < ni; i++) {
        if (count[i] == maxcount) {
            indmax[maxn] = i;
            maxn++;
        }
    }

//    for(int i = 0; i < maxn; i++) {
//        printf("Indexmax = %d indexnormal = %d\n", indmax[i], ind[indmax[i]]);
//    }
    memcpy(s1, s, b);

    for(long long i = 0; i < maxn; i++) {
        int zeropoint = ind[indmax[i]];
        memcpy(st, s + zeropoint, b - zeropoint);
        memcpy(st + b - zeropoint, s , zeropoint);
        //printf("Compared %d times\n", i);
        if (strcmp(s1, st) > 0) {
            memcpy(s1, st, b);
        }
    }

    printf("%s", s1);
    printf("\n");
    return 0;
}