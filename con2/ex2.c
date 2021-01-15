#include <stdio.h>
#include <stdlib.h>

int mas[10000];
int main(int argc, char** args) {
	int n, i = 0;
	scanf("%d",&n);
	if (n == 0){
		return 0;
	}
	for (;; i++){
		mas[i] = n;
		scanf("%d",&n);
		if (n == 0) {
			break;
		}
	}
	//printf("i = %d\n", i);
	int j = 0;
	for (int p = 0; p <= i; p+=2) {
		printf("%d ", mas[p]);
	}
	j = 0;
	if (i % 2 == 1) {
		j = i;
	} else {
		j = i - 1;
	}
	for (; j >= 0; j-=2) {
		printf("%d ", mas[j]);
	}
	printf("\n");
	return 0;
}