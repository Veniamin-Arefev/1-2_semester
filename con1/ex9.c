#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long num, count, mask;
	int mass[32];
	scanf("%lld", &num);
	count = 0;
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
	for (int i = 0; i < 32;i++) {
		count += mass[i];
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[32+i]);
//	}
//	printf("\n");
	printf("%lld\n", count);
	return 0;
}
