#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n,temp,max;
	long long pm[2];
	long long mm[2];
	pm[0] = -9000000000000000;
	pm[1] = -9000000000000000;
	mm[0] = 9000000000000000;
	mm[1] = 9000000000000000;
	scanf("%lld",&n);
	for (int i = 0; i < n; i++){
		scanf("%lld",&temp);
		if (temp > 0) {
			if (temp > pm[0]) {
				pm[1]= pm[0];
				pm[0] = temp;
			} else {
				if (temp > pm[1]) {
					pm[1] = temp;
				}
			}
		} else {
			if (temp < mm[0]) {
				mm[1]= mm[0];
				mm[0] = temp;
			} else {
				if (temp < mm[1]) {
					mm[1] = temp;
				}
			}

		}
	}
//	printf("%lld %lld", pm[0], pm[1]);
//	printf("\n%lld %lld\n", mm[0], mm[1]);
	int c = 0;
	long long int mas[6];
	mas[5]=0;
	mas[6]=0;
	if (pm[0] != -9000000000000000) {
		mas[c] = pm[0];
		c++;
	}
	if (pm[1] != -9000000000000000) {
		mas[c] = pm[1];
		c++;
	}
	if (mm[0] != 9000000000000000) {
		mas[c] = mm[0];
		c++;
	}
	if (mm[1] != 9000000000000000) {
		mas[c] = mm[1];
		c++;
	}
	max = -9000000000000000;
	for (int i = 0; i < c - 1; i++){
		for (int j = i + 1; j < c; j++){
//			printf("%lld %lld\n", mas[i], mas[j]);
			if (mas[i] * mas[j] > max) {
//				printf("added\n");
				max = mas[i] * mas[j];
				mas[5] = mas[i];
				mas[6] = mas[j];
				if (mas[5] > mas[6]) {
					temp = mas[5];
					mas[5] = mas[6];
					mas[6] = temp;
				}
			}
			if (mas[i] * mas[j] == max) {
				if (mas[i] + mas[j] < mas[5] + mas[6]) {
					mas[5] = mas[i];
					mas[6] = mas[j];
					if (mas[5] > mas[6]) {
						temp = mas[5];
						mas[5] = mas[6];
						mas[6] = temp;
					}
				}
			}

		}
	}
	printf("%lld %lld", mas[5], mas[6]);
	printf("\n");
	return 0;
}
