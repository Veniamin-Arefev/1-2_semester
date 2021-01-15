#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char** args) {
	int n;
	scanf("%d", &n);
	int x = 0;
	int up = 0, down = 1;
	for (int i = 0;i < n; i++) {
		int a,b;
		scanf("%d %d", &a, &b);
		x += a / b;
		a = a % b;
		up = up * b + a * down;
		down *= b;
	}
	x += up / down;
	up = up % down;
	for (int i = 2; i <= down; i++) {
		if ((up % i == 0) && (down % i == 0)) {
			up /= i;
			down /= i;
			i--;
		}
	}
    printf("%d %d %d", x,up, down);
	printf("\n");
	return 0;
}