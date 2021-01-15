#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
int a = 0;
int b = 5;
int main(int argc, char** args) {
    b = 7;
    if (a) {
        b = 3;
    }
    printf("%d", b);
	return 0;
}
