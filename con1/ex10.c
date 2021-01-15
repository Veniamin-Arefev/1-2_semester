#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long num,  mask, a, b ,c ,d;
	int mass[32];
	scanf("%lld %lld %lld %lld", &a, &b, &c, &d);
	for (int i = 0; i < 32;i++) {
		mass[i] = 0;
	}
	mask = 1;
	for (int i = 0; i < 8;i++) {
		if ((a & mask) != 0) {
			mass[31 - i] = 1;
		}
		mask *= 2;
	}
	mask = 1;
	for (int i = 0; i < 8;i++) {
		if ((b & mask) != 0) {
			mass[23 - i] = 1;
		}
		mask *= 2;
	}
	mask = 1;
	for (int i = 0; i < 8;i++) {
		if ((c & mask) != 0) {
			mass[15 - i] = 1;
		}
		mask *= 2;
	}
	mask = 1;
	for (int i = 0; i < 8;i++) {
		if ((d & mask) != 0) {
			mass[7 - i] = 1;
		}
		mask *= 2;
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[i]);
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
