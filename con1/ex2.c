#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n,max,count,temp;
	max = -9000000000000000000;
	count = 1;
	scanf("%lld",&n);
	for (int i = 0; i < n; i++){
		scanf("%lld",&temp);
		if (temp > max) {
			max = temp;
			count = 1;
		} else if (temp == max) {
			count++;
		}
	}
//	printf("\n");
	printf("%lld",count);
	printf("\n");
	return 0;
}
