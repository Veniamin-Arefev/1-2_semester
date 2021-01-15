#include <stdio.h>
#include <stdlib.h>
#include <math.h>

unsigned int mas[1500000];

int main(int argc, char** args) {
    int n;
    unsigned int xor = 0, temp, mask = 1;
	scanf("%d", &n);

	for (int i =0;i < n; i++){
		scanf("%u", &temp);
        mas[i] = temp;
        xor ^= temp;
	}

    unsigned int num1 = 0;

	for (int i =0;i < 32; i++){
        if ((xor & mask) == mask) {
            unsigned int temp  = 0;
            for (int i =0;i < n; i++){
                if ((mas[i] & mask) == mask) {
                    temp ^= mas[i];
                }
            }
            num1 = temp;
            break;
        }
        mask <<= 1;
	}

    unsigned int num2 = num1 ^ xor;

    if (num2 > num1) {
        printf("%u %u", num1, num2);
    } else {
        printf("%u %u", num2, num1);
    }

	printf("\n");
	return 0;
}