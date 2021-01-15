#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long total, count, temp, prev;
	count = 2;
	prev = 0;
	temp = -1;
	scanf("%lld", &total);
	while (temp != 0){
		scanf("%lld", &temp);
		if (temp == 0) {
			continue;
		}
		if (count % 2 == 0) {
			prev = temp;
		}
		if (count % 2 == 1) {
			total += prev*temp;
			prev = 0;
		}
		count++;
	}
//	printf("\n");
	printf("%lld\n", total+prev);
	return 0;
}
