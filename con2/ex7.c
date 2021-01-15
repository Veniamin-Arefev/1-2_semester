#include <stdio.h>
#include <stdlib.h>

int masa[10001];
int main(int argc, char** args) {
	int n, temp, max = 0;
	for (int i = 1; i <= 10000;i++){
		masa[i] = 0;
	}
	scanf("%d",&n);
	for (int i = 1; i < n+1;i++){
		scanf("%d",&temp);
		if (temp > 0) {
			masa[temp]++;
			if (temp > max){
				max = temp;
			}
		} else {
			printf("No");
			return 0;
		}
	}
	if (max > n) {
		printf("No\n");
		return 0;
	}
	int j = 1;
	for (int i = 1; i <= 10000; i++) {
		if ((masa[i] == 0) || (masa[i] == 1)) {
			j = 1;
		} else {
			j = 0;
			break;
		}
	}
	if (j == 1) {
		printf("Yes");
	} else {
		printf("No");
	}
	printf("\n");
	return 0;
}
