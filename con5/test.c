#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


int main(void){
    int i = 1;
    printf("%d", i);
    if (i % 2) { // ch
        printf("Da");
    }
    i ^= 1;
    if (i % 2) { // ch
        printf("Da");
    }
    i ^= 1;
    if (i % 2) { // ch
        printf("Da");
    }
    return 0;
}