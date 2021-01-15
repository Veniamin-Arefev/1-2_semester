#include <stdio.h>
unsigned int ret(unsigned int eax);

unsigned int fun(unsigned int eax) {
    if (eax) {
        eax = ret(eax);
    } else {
        return 1;
    }
    return eax;
}

unsigned int ret(unsigned int eax) {
    eax--;
    eax = fun(eax);
    eax*=3;
    return eax;
}

int main(void) {
    unsigned int eax = 0;
    scanf("%u", &eax);

    eax = fun(eax);

    printf("%u",eax);
    return 0;
}
