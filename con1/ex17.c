#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	unsigned long long n,count,temp;
	scanf("%llu",&n);
	count = 0;
	for (int i = 0; i < n; i++){
		scanf("%llu",&temp);
		count ^= temp;
	}
//	printf("\n");
	printf("%llu", count);
	printf("\n");
	return 0;
}
