#include <stdio.h>
#include <string.h>
#include <malloc.h>

int main(void) {

    char *str = malloc(20);
    int  i = 0;
    again:
    i = scanf("%s", str);
    if (i == 1) {
        printf("Scanned |%s|\n", str);
        goto again;
    }
    strcmp()

    return 0;
}
