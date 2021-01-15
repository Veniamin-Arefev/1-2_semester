#include <stdio.h>
#include <stdlib.h>

int masa[100000], masb[100000];
int main(int argc, char** args) {
	int n, m;
	scanf("%d",&n);
	for (int i = 0; i < n;i++){
		scanf("%d", masa+i);
	}
	scanf("%d",&m);
	for (int i = 0; i < m;i++){
		scanf("%d", masb+i);
	}
	int max = 0;
	if (n > m) {
		max = n;
	} else {
		max = m;
	}
	for (int i = 0; i < max; i++) {
		if (i < n) {
			printf("%d ", masa[i]);
		}
		if (i < m) {
			printf("%d ", masb[i]);
		}
	}
	printf("\n");
	return 0;
}