#include <stdio.h>
#include <stdlib.h>

int masa[4001];
int main(int argc, char** args) {
	int n, count = 0;
	scanf("%d",&n);
	for (int i = 0; i < n;i++){
		scanf("%d", masa + i);
	}
	for (int i = 0; i < n - 2; i++) {
		for (int j = i + 1; (j - i) * 2 + i < n; j++) {
//			printf("%d %d %d\n", masa[i], masa[j], masa[(j - i) * 2 + i]);
			if ((masa[i] + masa[(j - i) * 2 + i]) == (masa[j] * 2)) {
				count++;
			}
		}
	}
	printf("%d\n", count);
	printf("\n");
	return 0;
}
