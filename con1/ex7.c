#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long num, offset, mask;
	int mass[64];
	scanf("%lld %lld", &num, &offset);
	mask = 1;
	for (int i = 0; i < 64;i++) {
		mass[i] = 0;
	}
	for (int i = 0; i < 32;i++) {
		mass[31 - i] = num & mask;
		mask *= 2;
	}
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[i]);
//	}
//	printf("\n");
//	for (int i = 0; i < 32;i++) {
//		printf("%d ",mass[32+i]);
//	}
//	printf("\n");
	num = 0;
	for (int i = 0; i < offset;i++) {
		num += mass[31-i];
	}
//	printf("\n");
	printf("%lld\n", num);
	return 0;
}
