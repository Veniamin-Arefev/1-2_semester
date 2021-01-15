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
    char c;
    int words = 0, sentense = 0, paragraf = 0;
    int wasn = 0, waslet = 0, wasmin = 0;
    int shouldset = 1;
    while (fscanf(fin, "%c", &c) != EOF) {
        if (wasn && c == '\n') {
            if (shouldset == 0) {
                shouldset = 1;
            }
        }
        if (c == '.') {
            sentense++;
        }
        if (waslet && !wasmin && (c == '\n' || c == ' ' || c == '.')) {
            words++;
            //printf("%c\n", pr);
        }

        if (c == '\n') {
            if (wasmin == 1) {
                wasn = 1;
                wasmin = 0;
            } else {
                wasn = 1;
                waslet = 0;
                wasmin = 0;
            }
        }
        if (c == ' ') {
            waslet = 0;
            wasmin = 0;
        }
        if (c == '-') {
            wasn = 0;
            wasmin = 1;
        }
        if (c == '.') {
            wasn = 0;
            waslet = 0;
            wasmin = 0;
        }
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            if (shouldset) {
                paragraf++;
            }
            wasn = 0;
            waslet = 1;
            wasmin = 0;
            shouldset = 0;
        }
        //fprintf(fout, "%c", c);
    }
    /*if(words != 0 && sentense != 0) {
        paragraf++;
    }*/
    printf("%d %d %d", words, sentense, paragraf);
    fprintf(fout, "%d %d %d", words, sentense, paragraf);


    fclose(fin);
    fclose(fout);
    printf("\n");
    return 0;
}