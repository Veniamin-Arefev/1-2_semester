#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long num, mask;
	int mass[32];
	scanf("%lld", &num);
	mask = 1;
	for (int i = 0; i < 32;i++) {
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
	for (int i = 0; i < 8;i++) {
		if (mass [i] == 0) {
			mass[i] = 1;
		} else {
			mass[i] = 0;
		}
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[32+i]);
//	}
//	printf("\n");
	mask = 1;
	num = 0;
	for (int i = 0; i < 32;i++) {
		num += mass[31-i] * mask;
		mask *= 2;
	}
//	printf("\n");
	printf("%lld\n", num);
	return 0;
}
