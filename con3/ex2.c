#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int isPrime(int a) {
	for (int i = 2; i*i <= a;i++) {
		if((a % i) == 0) {
			return 0;
		}
	}
	return 1;
}

int main(int argc, char** args) {
	int n;
	scanf("%d",&n);
	if(n == 1) {
		printf("%d\n", 2);
		return 0;
	}
	while(isPrime(n) == 0) {
		n++;
	}
	printf("%d\n", n);
	return 0;
}