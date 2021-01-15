#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char** args) {
	int n;
	double tm = 0, v = 0, t1, t2, t;
	double s[100], a[100];
	scanf("%d",&n);
	for (int i =0;i < n; i++){
		scanf("%lf",s + i);
	}
	for (int i =0;i < n; i++){
		scanf("%lf",a + i);
	}
	for (int i =0;i < n; i++){
		t = 0;
		if (((int)floor(a[i] * 10000)) != 0) {
			t1 = (- v + sqrt(v*v + 2*a[i]*s[i])) / a[i];
			t2 = (- v - sqrt(v*v + 2*a[i]*s[i])) / a[i];
			if (t1 < 0) {
				t = t2;
			} else if (t2 < 0) {
				t = t1;
			} else if ((t1 > 0) && (t2 > 0)) {
				if (t2 > t1) {
					t = t1;
				} else {
					t = t2;
				}
			}
		} else {
			t = s[i] / v;
		}
		v += a[i] * t;
		tm += t;
//		printf("%.4lf %.4lf %.4lf\n", t, v, a[i]);
	}
	printf("%.4lf", tm);
	printf("\n");
	return 0;
}