#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

char s[1000001], so[1000001];
int mas[1000001] = {0};
int main(int argc, char** args) {

    int n = 0, total, needtoadd = 0;;
    fgets(s, 1000001, stdin);
    total = atoi(s);
    fgets(s, 1000001, stdin);
    s[strlen(s) - 1] = '\0';
    needtoadd = total - strlen(s);
    int flag = 0;
    int tempsp = 0;
    int b = strlen(s);
    for(int i = 0; i < b; i++) {
        if ((flag == 0) && (s[i] == ' ')) {
            flag = 1;
            tempsp  = 1;
        } else {
            if (flag == 1) {
                if (s[i] == ' ') {
                    tempsp++;
                } else {
                    mas[n] = tempsp;
                    n++;
                    flag = 0;
                }
            }
        }
    }

    int forevery = needtoadd / n;
    int forfirst= needtoadd % n;

    for(int i = 0; i < n; i++) {
        mas[i] += forevery;
        if (forfirst) {
            mas[i] += 1;
            forfirst--;
        }
    }

    flag = 0; // is space sequense?
    int ni = 0;
    int teki = 0;
    for(int i = 0; i < b; i++) {
        if (flag == 0) {
            if (s[i] == ' ') {
                so[teki] = s[i];
                teki++;
                //printf("%c", s[i]);
                mas[ni]--;
                flag = 1;
            } else {
                so[teki] = s[i];
                teki++;
                //printf("%c", s[i]);
            }
        } else {
            if (s[i] == ' ') {
                printf("%c", s[i]);
                mas[ni]--;
            } else {
                if (mas[ni] > 0) {
                    i--;
                    mas[ni]--;
                    so[teki] = ' ';
                    teki++;
                    //printf("%c", ' ');
                } else {
                    flag = 0;
                    ni++;
                    so[teki] = s[i];
                    teki++;
                    //printf("%c", s[i]);
                }
            }
        }
    }
    printf("%s", so);
    printf("\n");
    return 0;
}