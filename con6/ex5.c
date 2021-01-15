﻿#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <math.h>

int main(int argc, char** args) {
    FILE *fin, *fout;

    fin = fopen("./input.txt", "r");
    fout = fopen("./output.txt", "w");

    char seq[100000] = {0};
    char temp;
    long long int result = 0;
    int n = 0;

    printf("%d\n", atoi(seq));
    while (fscanf(fin, "%c", &temp) != EOF) {
        if (temp == ' ' ||  temp == '\n') {
            continue;
        }
        if (temp >= '0' && temp <= '9') {
            seq[n++] = temp;
        } else {
            result += atoi(seq);
            for (int i = 0; i < n; i++) {
                seq[i] = '\0';
            }
            seq[0] = temp;
            n = 1;
        }
    }
    result += atoi(seq);

    printf("%lld", result);
    fprintf(fout, "%lld", result);

    fclose(fin);
    fclose(fout);
    printf("\n");
    return 0;
}