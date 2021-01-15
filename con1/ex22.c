#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long count;
	int x, y, tx, ty, temp1, temp2;
	char last = 0;
	x = 0;
	y = 0;
	count = 0;
	scanf("%d %d",&tx, &ty);
	if (abs(tx) > abs(ty)) {
		last = 'y';
	} else {
		last = 'x';
	}
	while ((x != tx) || (y != ty)) {
		if (last == 'y') {
			last = 'x';
			temp1 = x + 1;
			temp2 = x - 1;
			if (abs(tx - temp1) < abs(tx - temp2)) {
				x++;
			} else {
				x--;
			}
		} else {
			last = 'y';
			temp1 = y + 1;
			temp2 = y - 1;
			if (abs(ty - temp1) < abs(ty - temp2)) {
				y++;
			} else {
				y--;
			}
		}
//		printf("X = %d, Y = %d\n", x, y);
		count++;
	}
	printf("%lld\n", count);
//	printf("\n");
	return 0;
}
