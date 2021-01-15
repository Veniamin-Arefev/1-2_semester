#include <stdio.h>

int main(void) {
    unsigned int eax = 0;
    scanf("%u", &eax);
    if (eax == 2147483648 || eax == 0) {
        printf("2147483648");
        return 0;
    }

    unsigned int ebx = eax-1;
    eax^=ebx;

    eax+=1;

    eax/=2;

    printf("%u",eax);
    return 0;
}