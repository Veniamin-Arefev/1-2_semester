#include <stdio.h>
#include <stdlib.h>
#include <math.h>


double x[100], y[100], z[100], r[100];
int main(int argc, char** args) {
	int n;
	scanf("%d",&n);
	for (int i = 0; i < n;i++){
		scanf("%lf %lf %lf %lf", x + i, y + i, z + i, r + i);
	}
	for (int i = 0; i < n - 1;i++){
		for (int j = i + 1; j < n;j++){
			if (sqrt((x[i] - x[j]) * (x[i] - x[j]) + (y[i] - y[j]) * (y[i] - y[j]) + (z[i] - z[j]) * (z[i] - z[j])) <= (r[i] + r[j])) {
				printf("YES\n");
				return 0;
			}
		}
	}
	printf("NO\n");
	return 0;
}
