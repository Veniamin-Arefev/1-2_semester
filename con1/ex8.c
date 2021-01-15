#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long num, offset, mask, temp, max;
	int mass[64];
	scanf("%lld %lld", &num, &offset);
	mask = 1;
	max = -9000000000000000000;
	temp = -9000000000000000000;
	for (int i = 0; i < 64;i++) {
		mass[i] = 0;
	}
	for (int i = 0; i < 32;i++) {
		if ((num & mask) != 0) {
			mass[31 - i] = 1;
		}
		mask *= 2;
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[i]);
//	}
//	printf("\n");
	for (int i = 0; i < 32 + 1 - offset;i++) {
//		printf("%lld ", temp);
		if (temp > max) {
			max = temp;
		}
		mask = 1;
		temp = 0;
		for (int j = i; j < i + offset;j++) {
			temp += mass[i + offset - 1 - j + i] * mask;
			mask *=2;
		}
	}
	if (temp > max) {
		max = temp;
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[32+i]);
//	}
//	printf("\n");
//	printf("\n");
	printf("%lld\n", max);
	return 0;
}
