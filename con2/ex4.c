#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int masa[10000];
int main(int argc, char** args) {
	int n, temp, count = 0;
	for (int i = 0; i < 10000;i++){
		masa[i] = 0;
	}
	scanf("%d",&n);
	for (int i = 0; i < n;i++){
		scanf("%d",&temp);
		masa[i] = temp;
	}
	for (int i = 0; i < n;i++){
		scanf("%d",&temp);
		count += temp > masa[i] ? temp : masa[i];
	}
	printf("%d", count);
	printf("\n");
	return 0;
}
