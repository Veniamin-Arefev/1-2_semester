#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	int n,max,min,temp;
	max = -1000000001;
	min = 1000000001;
	scanf("%d\n",&n);
	for (int i = 0; i < n; i++){
		scanf("%d",&temp);
		if (temp > max) {
			max = temp;
		}
		if (temp < min) {
			min = temp;
		}
	}
	if (n >= 2){
		printf("%d ",max-min);
	} else {
		printf("0");
	}
	printf("\n");
	return 0;
}
