#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long double xa, ya, xb, yb, xc, yc, xm, ym, xo, yo;
	scanf("%Lf %Lf %Lf %Lf %Lf %Lf", &xa, &ya, &xb, &yb, &xc, &yc);
	xm = (xb + xc) / 2;
	ym = (yb + yc) / 2;
	if (xa > xm) {
		xo = xm + (xa - xm) / 3;
	} else {
		xo = xa + (xm - xa) / 3;
	}
	if (ya > ym) {
		yo = ym + (ya - ym) / 3;
	} else {
		yo = ya + (ym - ya) / 3;
	}
	printf("%.4Lf %.4Lf", xo, yo);
	printf("\n");
	return 0;
}
