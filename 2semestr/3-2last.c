#include <stdio.h>

int main(void) {
    unsigned int input = 0;
    scanf("%u", &input);

    int mask = 1;
    int my = 32;
    for (int i = 0; i < 32;i++) {
        int num = mask & input;
        if (num) {
            my--;
        }
        mask *=2;
    }

    printf("%d", my);
    return 0;
}
