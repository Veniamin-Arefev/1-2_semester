#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include  <time.h>
#include <stdbool.h>
#include <math.h>

int isprime(int a) {
    if (a % 2 == 0) {
        return 0;
    }
    int b = sqrt(a) + 1;
    for (int i = 3; i < b; i+=2) {
        if (a % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, char** args) {

    int n;
    scanf("%d", &n);
    int *pr = calloc(10, sizeof(int));
    if (n == 1) {
        printf("2 3 5 7\n");
        return 0;
    }
    pr[0] = 2;
    pr[1] = 3;
    pr[2] = 5;
    pr[3] = 7;
    int b = 4;
    for (int kolraz = 1;kolraz < n; kolraz++) {
        int *newprime = calloc(b * 10, sizeof(int));
        int nb = 0;
        for (int g = 0; g < b; g++) {
            for (int f = 1; f < 10; f++) {
                int d = pr[g] * 10 + f;
                if (isprime(d)) {
                    newprime[nb++] = d;
                }
            }
        }
        b = nb;
        free(pr);
        pr = newprime;
    }
    for (int d = 0; d < b; d++) {
        int ma = 2000000000;
        int an = 0;
        for (int i = 0; i < b; i++) {
            if ((pr[i] < ma) && (pr[i] != 0)) {
                ma = pr[i];
                an = i;
            }
        }
        printf("%d ", pr[an]);
        pr[an] = 0;
    }

    free(pr);

    printf("\n");
    return 0;
}