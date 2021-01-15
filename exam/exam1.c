#include <stdio.h>
#include <malloc.h>
#include <math.h>
#include <string.h>

int main (void) {

    char *ss[] = {"iam", "the", "walrus"};
    char *q = *ss, *p = &ss[2][4];

    unsigned short u = 0x1920;

    printf("%d\n", ss[2]-);
    //printf("%x\n", u << 8);

    return 0;
}