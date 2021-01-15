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
	for (int j = i; j >= 0; j--){
		printf("%d ", mas[j]);
	}
	printf("\n");
	return 0;
}