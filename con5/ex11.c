#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

unsigned int mas[2010][2010] = {0};

inline extern unsigned int max(unsigned int a, unsigned int b){
    return a > b? a : b;
}

int main(int argc, char** args) {

    unsigned int n, m;
    scanf("%d %d", &n, &m);
    n+=1;

    for (int i = 1; i < n; i++) {
        for (int j = 0; j < m; j++) {
            scanf("%u", &mas[i][j]);
        }
    }

//    for (int i = 0; i < n+1; i++) {
//        for (int j = 0; j < m+1; j++) {
//            printf("%u ", mas[i][j]);
//        }
//        printf("\n");
//    }

    unsigned int *sum = calloc(n + 5, sizeof(unsigned int));

    for (int i = 1; i < n; i++) {
        sum[i] += mas[i][m-1];
    }

//    for (int i = 1; i < n; i++) {
//        printf("Ver[i] = %u, Sum[i] = %u\n", ver[i], sum[i]);
//    }
//    for (int g = 1; g < n; g++) {
//        printf("Sum[%u] = %u\n", g , sum[g]);
//    }
    for (int i = m-2; i >= 0; i--) {
        unsigned int *sum1 = calloc(n+5, sizeof(unsigned int));
        for(int j = 1;j <= n-1; j++){
//            printf("%u ", mas[j][i]);
//            printf("Sums = %u %u %u\n", sum[j-1], sum[j], sum[j+1]);
            sum1[j] = max(max(sum[j-1], sum[j]), sum[j+1]);
            sum1[j] += mas[j][i];
        }
//        printf("\n");
        free(sum);
        sum = sum1;
//        for (int g = 1; g < n; g++) {
//            printf("Sum[%u] = %u\n", g , sum[g]);
//        }
    }
    unsigned int ma = 0;
    for (int g = 1; g < n; g++) {
        if (sum[g] > ma) {
            ma = sum[g];
        }
    }
    printf("%u", ma);
    printf("\n");
    return 0;
}