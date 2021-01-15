#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	unsigned int n, mask, a[16], at[16];
	scanf("%x",&n);
	for (int i = 0;i < 16;i++){
		a[i] = 0;
		at[i] = 0;
	}
	mask = 1;
	for (int i = 0;i < 16;i++){
		if ((mask & n) != 0) {
			a[15-i] = 1;
		}
		mask *= 2;
	}
/*	for (int i = 0;i < 4;i++){
		for (int j = 0;j < 4;j++){
			printf("%d ", a[i*4+j]);
		}
		printf("\n");
	}*/
	for (int i = 0;i < 4;i++){
		for (int j = 0;j < 4;j++){
			at[4*i+j] = a[4*j+i];
		}
	}
/*	for (int i = 0;i < 4;i++){
		for (int j = 0;j < 4;j++){
			printf("%d ", a[i*4+j]);
		}
		printf("\n");
	}*/
	for (int i = 0;i < 4;i++){
		n = 0;
		mask = 8;
		for (int j = 0;j < 4;j++){
			n += at[4*i+j] * mask;
			mask /= 2;
		}
		printf("%x", n);
	}
//	printf("\n");
	printf("\n");
	return 0;
}
