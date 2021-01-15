#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int main(int argc, char** args) {
//	const long double pi = atanl(1)*4;
	const double pi = 3.14;
	long double a, b, c, d;
	bool can = false;
	scanf("%Lf %Lf %Lf %Lf", &a, &b, &c, &d);
	long double rad = 0;
	long double add = pi / 3600000;
	for (long long int i = 0; i <= 1800000;i++) {
		if ((a >= (c * sinl(rad) + d * cosl(rad))) && ((b >= (c * cosl(rad) + d * sinl(rad))))) {
/*			printf("%Lf\n sin = %Lf\n cos = %Lf\n", rad, sinl(rad), cosl(rad));
			printf("ds = %Lf\n cc = %Lf\n sum = %Lf\n", d*sinl(rad), c*cosl(rad), d*sinl(rad) + c*cosl(rad));
			printf("dc = %Lf\n cs = %Lf\n sum = %Lf\n", d*cosl(rad), c*sinl(rad), d*cosl(rad) + c*sinl(rad));*/
			can = true;
			break;
		}
//		printf("%.20Lf\n", rad);
		rad += add;
	}
	printf("%s\n", can ? "YES" : "NO");
	return 0;
}
