#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


int nod(int a, int b) {
    if (b > a) { // a > b
        int c = a;
        a = b;
        b = c;
    }
    int c = 0;
    while (b != 0) {
        c = a % b;
        a = b;
        b = c;
    }
    return a;

}

int main(int argc, char** args) {
    int mas[4];
    int min1, min2, min;
    scanf("%d %d %d %d", mas, mas+1, mas+2, mas+3);

    min1 = nod(mas[0], mas[1]);
    min2 = nod(mas[2], mas[3]);
    min = nod(min1, min2);

    printf("%d\n", min);
	return 0;
}