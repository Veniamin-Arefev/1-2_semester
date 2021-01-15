#include <stdio.h>

int main(void) {
    unsigned int eax = 0;
    unsigned int ebx = 1;
    unsigned int ecx = 0;
    scanf("%d", &ecx);
    for (int i = 0; i < ecx; i++) {
        eax^=ebx;
        ebx^=eax;
        eax^=ebx;

        ebx+=eax;
    }
    printf("%u",eax);
    return 0;
}