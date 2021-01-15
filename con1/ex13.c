#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	int n;
	double x, curx, xpow, fa;
	scanf("%lf", &x);
	scanf("%d", &n);
	curx = x;
	xpow = x;
	fa = 1;
	for (int i = 1; i < 1 + 2 * (n - 1); i += 2){
		xpow *= x * x;
		fa *= (i + 1) * (i + 2);
		if ((i-1) / 2 % 2  == 1) {
			curx += xpow / fa;
		} else {
			curx -= xpow / fa;
		}
	}
	printf("%6lf\n", curx);
	return 0;
}
