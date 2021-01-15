#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define raz 10000

long long a[raz], x[raz], z[raz];
int main(int argc, char** args) {
	long long n, m;
	scanf("%lld",&n);
	for (long long i = 0; i < n;i++){
		scanf("%lld", a + i);
	}
	scanf("%lld",&m);
	for (long long i = 0; i < m;i++){
		scanf("%lld", x + i);
	}
	for (long long i = 0; i < m;i++){ //for x[i]
		long long sum = 0;
//		printf("%lld\n", x[i]);
		for (long long j = 0; j < n;j++){ // for every a[j]*x
			sum += a[j] * ((long long)pow(x[i], j));
//			printf("%lld , %lld\n", a[j], (long long) pow(x[i], j));
		}
		z[raz - i - 1] = sum;
	}
	for (long long i = raz - m; i < raz;i++){
		printf("%lld ", z[i]);
	}
	printf("\n");
	return 0;
}
