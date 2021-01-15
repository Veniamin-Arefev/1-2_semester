#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int right = 1;
int ended = 0;
char chT = 'A', chG= 'A';
int iT = 1, iG = 1;
//Tolik - kon , Garik - ferz

void checkGar(void) { //0 is normal 1 is cheat
    int tru = 0;
//    printf("Tol %c%d Gar %c%d\n", chT, iT, chG, iG);
    if (abs (iG - iT) == 2) {
        if (abs(chT - chG) == 1) {
            tru++;
        }
    }
    if (abs (iG - iT) == 1) {
        if (abs(chT - chG) == 2) {
            tru++;
        }
    }
    if (!tru) {
        right = 0;
//        printf("Garik cheat");
    }
}

void checkTol(void) { //0 is normal 1 is cheat
    int tru = 0;
//    printf("Tol %c%d Gar %c%d\n", chT, iT, chG, iG);
    if (chT == chG) {
        tru++;
    }
    if (iT == iG) {
        tru++;
    }
    if (abs(chT - chG) == abs(iT - iG)) {
        tru++;
    }
    if (!tru) {
        right = 0;
//        printf("Tolik cheat");
    }
}

int main(int argc, char** args) {
    char a,b;
    int i = 0;
    while (1) {
        a = getchar();
        if (a == '\n') {
            a = getchar();
        }
        if (a == 'X') {
            break;
        }
        b = getchar();
        if (a > 'H' || a < 'A'|| b > '8' || b < '0') {
            printf("Cheaters");
            return 0;
        }
        if (((a == chT) && (b - '0') == iT) || ((a == chG) && (b - '0') == iG)) {
            printf("Cheaters");
            return 0;
        }
        if (ended == 1) {
            right = 0;
        }
        if (a == 'H' && b == '8') {
            ended = 1;
        }
//        printf("Scanned %c code %d\n", a, a);
//        printf("Scanned %c code %d\n", b, b);
        if (i % 2 == 0) {
            chG = a;
            iG = b - '0';
            checkGar();
        } else {
            chT = a;
            iT = b - '0';
            checkTol();
        }
        i++;
    }
    if (right == 1) {
        if ((chT == 'H' && iT == 8)) {
            printf("Tolik");
        } else {
            if ((chG == 'H' && iG == 8)) {
                printf("Garik");
            } else {
                printf("Cheaters");
            }
        }
    } else {
        printf("Cheaters");
    }
	printf("\n");
	return 0;
}