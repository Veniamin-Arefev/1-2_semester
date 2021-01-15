//http://algcourse.cs.msu.su/wp-content/uploads/2010/09/Lection22-2018.pdf
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <math.h>

FILE *fin, *fout;

int main(int argc, char** args) {
    fout = fopen("./input.txt", "w");

    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        fprintf(fout, "%d ", i);
    }


    fclose(fout);
    return 0;
}