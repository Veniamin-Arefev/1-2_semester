#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include  <time.h>
#include <stdbool.h>
#include <math.h>

int main(int argc, char** args) {

    int n;
    scanf("%d", &n);
    //clock_t start = clock();
    int max = pow(10, n);
    bool *mas = calloc(sizeof(bool), max);

    int togo = sqrt(max);
    for (int i = 2; i < togo; i+=2) {
        if (mas[i] == 0) {
            for (int j = i*i; j < max; j+=i) {
                mas[j] = (bool) 1;
            }
        }
    }

    for (int i = 2; i < max; i++) {
        if (mas[i] == 0) {
            printf("%d ", i);
        }
    }

    //printf("Done in %lf seconds\n", (double)(clock()- start) / (CLOCKS_PER_SEC));
    printf("\n");
	return 0;
}