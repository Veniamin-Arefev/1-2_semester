#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int findLastInLine(char s[], char c, int mas[]) {
    int n = 0;
    for (int i = strlen(s); i >=0; --i) {
        if (c == s[i]) {
            mas[n] = i;
            n++;
        }
    }
    return n;
}

char s1[10002], s2[10002];

int main(int argc, char** args) {

    fgets(s1, 10002, stdin);
    fgets(s2, 10002, stdin);
    s1[strlen(s1) - 1] = '\0';
    s2[strlen(s2) - 1] = '\0';
    int a[10002], b[10002];
    int na = findLastInLine(s2, s1[0], a), nb = findLastInLine(s1, s2[0], b), otv1 = 0, otv2 = 0, flag = 0;

    if (na != 0) {
        for (int m = 0; m < na; m++) {
            int j = 0;
            flag = 0;
            for (int i = a[m]; i < strlen(s2); i++) {
                if (s2[i] != s1[j]) {
                    flag = 1;
                    break;
                }
                j++;
            }
            if (flag == 0) {
                otv1 = strlen(s2) - a[m];
            }
        }
    } else {
        otv1 = 0;
    }

    if (nb != 0) {
        for (int m = 0; m < nb; m++) {
            int j = 0;
            flag = 0;
            for (int i = b[m]; i < strlen(s1); i++) {
                if (s1[i] != s2[j]) {
                    flag = 1;
                    break;
                }
                j++;
            }
            if (flag == 0) {
                otv2 = strlen(s1) - b[m];
            }
        }
    } else {
        otv2 = 0;
    }

    //printf("%s\n%s\n", s1, s2);
    printf("%d %d\n", otv1, otv2);

    printf("\n");
    return 0;
}#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int findLastInLine(char s[], char c, int mas[]) {
    int n = 0;
    for (int i = strlen(s); i >=0; --i) {
        if (c == s[i]) {
            mas[n] = i;
            n++;
        }
    }
    return n;
}

char s1[10002], s2[10002];

int main(int argc, char** args) {

    fgets(s1, 10002, stdin);
    fgets(s2, 10002, stdin);
    s1[strlen(s1) - 1] = '\0';
    s2[strlen(s2) - 1] = '\0';
    int a[10002], b[10002];
    int na = findLastInLine(s2, s1[0], a), nb = findLastInLine(s1, s2[0], b), otv1 = 0, otv2 = 0, flag = 0;

    if (na != 0) {
        for (int m = 0; m < na; m++) {
            int j = 0;
            flag = 0;
            for (int i = a[m]; i < strlen(s2); i++) {
                if (s2[i] != s1[j]) {
                    flag = 1;
                    break;
                }
                j++;
            }
            if (flag == 0) {
                otv1 = strlen(s2) - a[m];
            }
        }
    } else {
        otv1 = 0;
    }

    if (nb != 0) {
        for (int m = 0; m < nb; m++) {
            int j = 0;
            flag = 0;
            for (int i = b[m]; i < strlen(s1); i++) {
                if (s1[i] != s2[j]) {
                    flag = 1;
                    break;
                }
                j++;
            }
            if (flag == 0) {
                otv2 = strlen(s1) - b[m];
            }
        }
    } else {
        otv2 = 0;
    }

    //printf("%s\n%s\n", s1, s2);
    printf("%d %d\n", otv1, otv2);

    printf("\n");
    return 0;
}