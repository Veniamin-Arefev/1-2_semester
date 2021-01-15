#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int mas[504][504] = {0};

void check(int *newx, int *newy, int xt, int yt, int *nb, int i){
    if (mas[xt][yt] == 0){
        newx[*nb] = xt;
        newy[*nb] = yt;
        mas[xt][yt] = i;
        ++(*nb);
    }
}

int main(int argc, char** args) {

    int n, m, b;
    scanf("%d %d %d", &n, &m, &b);
    n+=2; m+=2;
    int *x = malloc(40000 * sizeof(int));
    int *y = malloc(40000 * sizeof(int));
    for (int i = 0; i < b; i++) {
        int x1, y1;
        scanf("%d %d", &x1, &y1);
        mas[++x1][++y1] = -1;
        x[i] = x1;
        y[i] = y1;
    }
    for (int i = 1; i < 1010; i++) {
        int nb = 0;
        int *newx = malloc(40000 * sizeof(int));
        int *newy = malloc(40000 * sizeof(int));
        if (b == 0){
            printf("%d\n", i-3);
//            printf("Massiv after last iteration\n");
//            for (int k = 0; k < m+2; k++) {
//                for (int j = 0; j < n+2; j++) {
//                    printf("%3d", mas[k][j]);
//                }
//                printf("\n");
//            }
            return 0;
        }
        for(int j =  0;j < b;j++) {
            //printf("Dealing with b = %d where x = %d y = %d", j, x[j], y[j]);
            if (x[j] <= 1 || x[j] >= m) {
                //printf("Skipped\n");
                continue;
            }
            if (y[j] <= 1 || y[j] >= n) {
                //printf("Skipped\n");
                continue;
            }
            check(newx, newy,x[j]+1, y[j], &nb, i);
            check(newx, newy,x[j]-1, y[j], &nb, i);
            check(newx, newy,x[j], y[j]+1, &nb, i);
            check(newx, newy,x[j], y[j]-1, &nb, i);
//            printf("Done\n");
//            printf("Check next mass after %d iteration\n", j);
//            for (int k = 0; k < nb; k++) {
//                printf("B = %d where x = %d y = %d \n", k, newx[k], newy[k]);
//            }
        }
        free(x);
        x = newx;
        free(y);
        y = newy;
        b = nb;
    }
    free(x);
    free(y);
    printf("%d", -1);
    printf("\n");
    return 0;
}