#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <math.h>

void add1ton(unsigned char *mas, int n){
    for (int i = n; i >= 0; i--) {
        if (mas[i] + 1 <= 255) {
            mas[i] += 1;
            break;
        } else {
            mas[i] = 0;
        }
    }
}

void compute(unsigned char *main, unsigned char *add){
    if (add[4] & (1 << 7)) {
        add[0] = 255;
        add[1] = 255;
        add[2] = 255;
        add[3] = 255;
    }
    for (int i = 7; i >= 0; i--) {
        if (((main[i] + add[i]) > 255) && i > 0) {
            add1ton(main, i-1);
        }
        main[i] = (main[i] + add[i]) % 256;
    }
}

int main(int argc, char** args) {
    FILE *fin, *fout;

    fin = fopen("./matrix.in", "rb");
    fout = fopen("./trace.out", "wb");

    int n;
    unsigned char *mas = calloc(2, sizeof(char));
    unsigned char *otvet = calloc(8, sizeof(char));

    fread(mas, 2, 1, fin);
    n = 256*mas[0] + mas[1];

//    printf("%3d %3d || ", mas[0], mas[1]);
//    printf("%d nums:\n", n*n);

    int n2 = n*n;

    free(mas);
    mas = calloc(n2 * 4, sizeof(char));

    fread(mas, 4, n2, fin);

    int n1 = n + 1;
    for (int i = 0; i < n2; i += n1) {
        unsigned char *add = calloc(8, sizeof(unsigned char));
        add[0] = 0;
        add[1] = 0;
        add[2] = 0;
        add[3] = 0;
        add[4] = mas[i * 4 + 0];
        add[5] = mas[i * 4 + 1];
        add[6] = mas[i * 4 + 2];
        add[7] = mas[i * 4 + 3];
/*      for (int b = 0; b < 4; b++) {
            printf("%3x", add[b+4]);
        }
        printf("\n");*/
        compute(otvet, add);
        free(add);
    }

    for (int i = 0; i < 8; i ++) {
        printf("%3X", otvet[i]);
        fwrite(&otvet[i], 1, 1, fout);
    }
    free(mas);
    free(otvet);
//    printf();
//    fprintf();


    fclose(fin);
    fclose(fout);
    printf("\n");
    return 0;
}