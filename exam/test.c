#include <stdio.h>

int main (void) {
    int n = 2;
    printf("%d", ((n%2) ||(n++ &4))?n+1:n+2);

    return 0;
}
