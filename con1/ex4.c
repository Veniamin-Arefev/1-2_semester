#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n, mcount, count, temp, prev;
	scanf("%lld",&n);
	count = 1;
	prev = 9000000000000000000;
	mcount = 0;
	for (int i = 0; i < n;i++){
		scanf("%lld",&temp);
		if (temp > prev) {
			count++;
		} else {
			if (count > mcount) {
				mcount = count;
			}
			count = 1;
		}
		prev = temp;
	}
	if (count > mcount) {
		mcount = count;
	}

//	printf("\n");
	printf("%lld\n", mcount);
	return 0;
}
