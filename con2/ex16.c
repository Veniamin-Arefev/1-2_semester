#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int a[10][10];
int main(int argc, char** args) {
	char input[128];
	fgets(input, 128, stdin);
	int len = strlen(input);
	int sum = 0;
	for (int i = 0; i < 10; i++) {
		for (int j = 0; j < 10; j++) {
			a[i][j] = 1;
		}
	}
	for (int i = 1; i <= len / 2; i++) {
//		printf("%d %d\n", input[i*2], input[i * 2 + 1]);
//		printf("%d %d\n", input[i*2] - 97, input[i * 2 + 1] - 48);
		a[input[(i - 1) * 2] - 97 + 1][input[(i - 1) * 2 + 1] - 48] = 2;
	}
/*	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			printf("%d ", a[i][j]);
		}
		printf("\n");
	}
	printf("\n");*/
	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			if (a[i][j] == 2) {
				a[i-1][j+1] = a[i-1][j+1] == 1 ? 0 : a[i-1][j+1];
				a[i-1][j] = a[i-1][j] == 1 ? 0 : a[i-1][j];
				a[i-1][j-1] = a[i-1][j-1] == 1 ? 0 : a[i-1][j-1];

				a[i][j+1] = a[i][j+1] == 1 ? 0 : a[i][j+1];
				a[i][j-1] = a[i][j-1] == 1 ? 0 : a[i][j-1];

				a[i+1][j+1] = a[i+1][j+1] == 1 ? 0 : a[i+1][j+1];
				a[i+1][j] = a[i+1][j] == 1 ? 0 : a[i+1][j];
				a[i+1][j-1] = a[i+1][j-1] == 1 ? 0 : a[i+1][j-1];
			}
		}
	}
/*	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			printf("%d ", a[i][j]);
		}
		printf("\n");
	}
	printf("\n");*/
	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			a[i][j] = a[i][j] == 2 ? 0 : a[i][j];
			sum += a[i][j];
		}
	}
/*	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			printf("%d ", a[i][j]);
		}
		printf("\n");
	}
	printf("\n");*/
	printf("%d", sum);
	printf("\n");
	return 0;
}