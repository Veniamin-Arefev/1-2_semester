#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n, temp, count, mass[14];
	count = 0;
	scanf("%lld",&n);
	if (n > 1000000) {
		printf("-1\n");
		return 0;
	}
	temp = n;
	for (int i = 0; i < 14;i++) {
		mass[i] = 0;
	}
	for (int i = 0; temp > 0;i++) {
		mass[i] = temp % 3; 
		temp /= 3;
	}
/*	for (int i = 0; i < 14;i++) {
		printf("%lld ", mass[i]);
	}
	printf("\n");*/
	for (int i = 0; i < 14;i++) {
		if (mass[i] == 3) {
			mass[i] = 0;
			mass[i + 1]++;
			continue;
		}
		if (mass[i] == 2) {
			mass[i] = 1;
			mass[i + 1]++;
			continue;
		}
	}
	count = 0;
	for (int i = 0; i < 14;i++) {
		count += mass[i];
//		printf("%lld ", mass[i]);
	}
	if (mass[13] == 1) {
		printf("-1\n");
		return 0;
	}
	printf("\n");
	printf("%lld\n", count);
	printf("\n");
	return 0;
}
