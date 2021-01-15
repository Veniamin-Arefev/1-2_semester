﻿#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

long long scanNew(void){
    char sym = 0;
    long long result = 0;
    sym=getchar();
//    printf("Char %c code %d\n", sym, sym);
    if (sym == ' ') {
        sym=getchar();
    }
    again:
    if ((sym != '*') && (sym !='/') && (sym != '-') && (sym <'0' || sym > '9')) {
    	sym=getchar();
    	goto again;
    }
    if (sym == '*') {
        result = scanNew() * scanNew();
    }
    if (sym == '/') {
        result = scanNew();
        long long a = scanNew();
        if (a != 0) {
            result /= a;
        }
    }
    if ((sym >= '0' && sym <= '9') || sym == '-') {
        int positive = 1;
        if (sym == '-') {
            positive = 0;
            result = 0;
        } else {
            result = sym - '0';
        }
        while((sym = getchar()) != '\n') {
            if (sym == ' ') {
                break;
            }
            result *=10;
            if (positive == 1) {
                result += sym - '0';
            } else {
                result -= sym - '0';
            }

        }
//        printf("Scanned %d\n", result);
    }
    return result;
}

int main(int argc, char** args) {
    printf("%lld", scanNew());
	printf("\n");
	return 0;
}