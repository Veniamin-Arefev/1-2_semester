#include <stdio.h>
#include <stdlib.h>

int i = 1, nmax = 0, n = 1;

void scannew(void){
	int a,b;
	scanf("%d %d", &a, &b);
	n++;
	if(n < nmax / 2) {
		scannew();
	}
	if(n == nmax / 2) {
		int y;
	    scanf("%d %d", &y, &y);
	    n++;
	}
	int c,d;
	scanf("%d %d", &c, &d);
	if ((a !=(-c)) || (b !=d)) {
		i = 0;
	}
}
int main(int argc, char** args) {
	scanf("%d", &nmax);
	int y;
	scanf("%d %d", &y, &y);
	scannew();
	printf(i == 1 ? "Yes" : "No");
	printf("\n");
	return 0;
}