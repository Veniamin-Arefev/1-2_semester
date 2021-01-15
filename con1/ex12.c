#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n,temp;
	long long mass[3];
	mass[0] = -9000000000000000000;
	mass[1] = -9000000000000000000;
	mass[2] = -9000000000000000000;
	scanf("%lld",&n);
	for (int i = 0; i < n; i++){
		scanf("%lld",&temp);
		if (temp > mass[0]) {
			mass[2]= mass[1];
			mass[1]= mass[0];
			mass[0] = temp;
		} else {
			if (temp > mass[1]) {
				mass[2]= mass[1];
				mass[1] = temp;
			} else {
				if (temp > mass[2]) {
					mass[2] = temp;
				}
			}
		}
//		printf("%lld %lld %lld\n", mass[0], mass[1], mass[2]);

	}
//	printf("\n");
	printf("%lld %lld %lld", mass[0], mass[1], mass[2]);
	printf("\n");
	return 0;
}
