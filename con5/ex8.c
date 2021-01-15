#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int mas[204][204] = {0};

int check(int *newx, int *newy, int xt, int yt, int *nb, int i){
    if (mas[xt][yt] == 0){
        newx[*nb] = xt;
        newy[*nb] = yt;
        mas[xt][yt] = i;
        ++(*nb);
    } else {
        if (mas[xt][yt] == -2) {
            printf("%d", i);
            return 1; //system exit
        }
    }
    return 0;//all is normal
}

int main(int argc, char** args) {

    int n, xn, yn, xk, yk;
    scanf("%d %d %d %d %d", &n, &xn, &yn, &xk, &yk);
    if ((xn == xk) && (yn == yk)) {
        printf("%d", 0);
        return 0;
    }
    n+=2;xn += 1, yn += 1, xk += 1, yk += 1;
    int b = 1;
    mas[xn][yn] = -1;
    mas[xk][yk] = -2;
    int *x = malloc(40000 * sizeof(int));
    x[0] = xn;
    int *y = malloc(40000 * sizeof(int));
    y[0] = yn;
    for (int i = 1; i < 400; i++) {
//        printf("Massiv before %d iteration\n", i);
//        for (int k = 0; k < n2; k++) {
//            for (int j = 0; j < n2; j++) {
//                printf("%3d", mas[k][j]);
//            }
//            printf("\n");
//        }
        int nb = 0;
        int *newx = malloc(40000 * sizeof(int));
        int *newy = malloc(40000 * sizeof(int));
        if (b == 0){
            printf("%d", -1);
            return 0;
        }
        for(int j =  0;j < b;j++) {
            //printf("Dealing with b = %d where x = %d y = %d", j, x[j], y[j]);
            if (x[j] <= 1 || x[j] >= n) {
                //printf("Skipped\n");
                continue;
            }
            if (y[j] <= 1 || y[j] >= n) {
                //printf("Skipped\n");
                continue;
            }
            int exit = 0;
            exit += check(newx, newy,x[j]+2, y[j]+1, &nb, i);
            exit += check(newx, newy,x[j]+2, y[j]-1, &nb, i);
            exit += check(newx, newy,x[j]-2, y[j]+1, &nb, i);
            exit += check(newx, newy,x[j]-2, y[j]-1, &nb, i);
            exit += check(newx, newy,x[j]+1, y[j]+2, &nb, i);
            exit += check(newx, newy,x[j]-1, y[j]+2, &nb, i);
            exit += check(newx, newy,x[j]+1, y[j]-2, &nb, i);
            exit += check(newx, newy,x[j]-1, y[j]-2, &nb, i);
            if (exit) {
//                printf("Massiv after last iteration\n");
//                for (int k = 0; k < n; k++) {
//                    for (int d = 0; d < n; d++) {
//                        printf("%3d", mas[k][d]);
//                    }
//                    printf("\n");
//                }
                return 0;
            }
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
//    printf("Massiv after last iteration\n");
//    for (int k = 0; k < n; k++) {
//        for (int j = 0; j < n; j++) {
//            printf("%3d", mas[k][j]);
//        }
//        printf("\n");
//    }
    printf("%d", -1);
    printf("\n");
    return 0;
}