#include <stdio.h>
#include <stdlib.h>

int masa[100000];
int main(int argc, char** args) {
	int n;
	scanf("%d",&n);
	for (int i = 1; i < n+1;i++){
		scanf("%d", masa+i);
	}
	for (int i = 1; i < n+1; i++) {
		printf("%d ", masa[masa[masa[i]]]);
	}
	printf("\n");
	return 0;
}