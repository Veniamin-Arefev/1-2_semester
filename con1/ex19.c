#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char** args) {
	long long mask;
	unsigned int a11, a12, a21, a22, b1, b2, xe, ye;
	int ma11[32], ma12[32], ma21[32], ma22[32], mb1[32], mb2[32], x1[32], x2[32], y1[32], y2[32], x0[32], y0[32], xm[32], ym[32];
	bool exists = true;
	mask = 1;
	scanf("%d %d %d %d %d %d", &a11, &a12, &a21, &a22, &b1, &b2);
//	printf("\n");
	for (int i = 0; i < 32; i++) {
		if ((a11 & mask) != 0) {
			ma11[i] = 1;
		} else {
			ma11[i] = 0;
		}
		if ((a12 & mask) != 0) {
			ma12[i] = 1;
		} else {
			ma12[i] = 0;
		}
		if ((a21 & mask) != 0) {
			ma21[i] = 1;
		} else {
			ma21[i] = 0;
		}
		if ((a22 & mask) != 0) {
			ma22[i] = 1;
		} else {
			ma22[i] = 0;
		}
		if ((b1 & mask) != 0) {
			mb1[i] = 1;
		} else {
			mb1[i] = 0;
		}
		if ((b2 & mask) != 0) {
			mb2[i] = 1;
		} else {
			mb2[i] = 0;
		}
		mask *= 2;
	}
/*	printf("a11 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", ma11[i]);
	}
	printf("\na12 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", ma12[i]);
	}
	printf("\na21 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", ma21[i]);
	}
	printf("\na22 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", ma22[i]);
	}
	printf("\nb1 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", mb1[i]);
	}
	printf("\nb2 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", mb2[i]);
	}
	printf("\n");*/
	for (int i = 0; i < 32; i++) {
		if (mb1[i] == 0) {
			if (ma11[i] == 0) {
				if (ma12[i] == 0) {
					x1[i] = 2;
					y1[i] = 2;
				} else { // ma12[i] = 1
					x1[i] = 2;
					y1[i] = 0;
				}
			} else { // ma11[i] = 1
				if (ma12[i] == 0) {
					x1[i] = 0;
					y1[i] = 2;
				} else { // ma12[i] = 1
					x1[i] = 3;
					y1[i] = 3;
				}
			}
		} else { //mb1[i] == 1
			if (ma11[i] == 0) {
				if (ma12[i] == 0) {
					x1[i] = -1;
					y1[i] = -1;
				} else { // ma12[i] = 1
					x1[i] = 2;
					y1[i] = 1;
				}
			} else { // ma11[i] = 1
				if (ma12[i] == 0) {
					x1[i] = 1;
					y1[i] = 2;
				} else { // ma12[i] = 1
					x1[i] = 4;
					y1[i] = 4;
				}
			}
		}
		
		if (mb2[i] == 0) {
			if (ma21[i] == 0) {
				if (ma22[i] == 0) {
					x2[i] = 2;
					y2[i] = 2;
				} else { // ma22[i] = 1
					x2[i] = 2;
					y2[i] = 0;
				}
			} else { // ma21[i] = 1
				if (ma22[i] == 0) {
					x2[i] = 0;
					y2[i] = 2;
				} else { // ma22[i] = 1
					x2[i] = 3;
					y2[i] = 3;
				}
			}
		} else { //mb2[i] == 1
			if (ma21[i] == 0) {
				if (ma22[i] == 0) {
					x2[i] = -1;
					y2[i] = -1;
				} else { // ma22[i] = 1
					x2[i] = 2;
					y2[i] = 1;
				}
			} else { // ma21[i] = 1
				if (ma22[i] == 0) {
					x2[i] = 1;
					y2[i] = 2;
				} else { // ma22[i] = 1
					x2[i] = 4;
					y2[i] = 4;
				}
			}
		}
	}
/*	printf("x1 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", x1[i]);
	}
	printf("\ny1 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", y1[i]);
	}
	printf("\nx2 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", x2[i]);
	}
	printf("\ny2 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", y2[i]);
	}
	printf("\n");*/
	for (int i = 0; i < 32; i++) {
		x0[i] = 5;
		xm[i] = 5;
		y0[i] = 5;
		ym[i] = 5;
	}
	for (int i = 0; i < 32; i++) {
		if (x1[i] == -1 || x2[i] == -1 || (x1[i] == 1 && x2[i] == 0) || (x1[i] == 0 && x2[i] == 1)) {
			exists = false;
			break;
		}
		if (y1[i] == -1 || y2[i] == -1 || (y1[i] == 1 && y2[i] == 0) || (y1[i] == 0 && y2[i] == 1)) {
			exists = false;
			break;
		}
		// 0-0 or 1-1 for x
		if ((x1[i] == x2[i]) && (x1[i] == 0 || x1[i] == 1)) {
			x0[i] = x1[i];
			xm[i] = 2;
		}
		// 0-0 or 1-1 for y
		if ((y1[i] == y2[i]) && (y1[i] == 0 || y1[i] == 1)) {
			y0[i] = y1[i];
			ym[i] = 2;
		}
		// x-2 or x-3 or x-4
		if ((x1[i] == 0 || x1[i] == 1) && (x2[i] == 2  ||  x2[i] == 3 || x2[i] == 4)) {
			x0[i] = x1[i];
			xm[i] = x2[i];
		}
		// 2-x or 3-x or 4-x
		if ((x2[i] == 0 || x2[i] == 1) && (x1[i] == 2 || x1[i] == 3 || x1[i] == 4)) {
			x0[i] = x2[i];
			xm[i] = x1[i];
		}
		// y-2 or y-3 or y-4
		if ((y1[i] == 0 || y1[i] == 1) && (y2[i] == 2  ||  y2[i] == 3 || y2[i] == 4)) {
			y0[i] = y1[i];
			ym[i] = y2[i];
		}
		// 2-y or 3-y or 4-y
		if ((y2[i] == 0 || y2[i] == 1) && (y1[i] == 2 || y1[i] == 3 || y1[i] == 4)) {
			y0[i] = y2[i];
			ym[i] = y1[i];
		}
		// 2-2 for x
		if ((x1[i] == 2) && (x2[i] == 2)) {
			x0[i] = -1;
			xm[i] = 2;
		}
		// 2-2 for x
		if ((y1[i] == 2) && (y2[i] == 2)) {
			y0[i] = -1;
			ym[i] = 2;
		}
		// 2-3 2-4 for x
		if ((x1[i] == 2) && (x2[i] == 3 || x2[i] == 4)) {
			x0[i] = -1;
			xm[i] = x2[i];
		}
		// 2-3 2-4 for y
		if ((y1[i] == 2) && (y2[i] == 3 || y2[i] == 4)) {
			y0[i] = -1;
			ym[i] = y2[i];
		}
		// 3-2 4-2 for x
		if ((x2[i] == 2) && (x1[i] == 3 || x1[i] == 4)) {
			x0[i] = -1;
			xm[i] = x1[i];
		}
		// 3-2 4-2 for y
		if ((y2[i] == 2) && (y1[i] == 3 || y1[i] == 4)) {
			y0[i] = -1;
			ym[i] = y1[i];
		}
		// 3-4 4-3 for x
		if ((x1[i] == 3 && x2[i] == 4) || (x1[i] == 3 && x2[i] == 4)) {
			exists = false;
			break;
		}
		// 3-4 4-3 for y
		if ((y1[i] == 3 && y2[i] == 4) || (y1[i] == 3 && y2[i] == 4)) {
			exists = false;
			break;
		}
		// 3-3 for x
		if ((x1[i] == 3) && (x2[i] == 3)) {
			x0[i] = -1;
			xm[i] = 3;
		}
		// 3-3 for y
		if ((y1[i] == 3) && (y2[i] == 3)) {
			y0[i] = -1;
			ym[i] = 3;
		}
		// 4-4 for x
		if ((x1[i] == 4) && (x2[i] == 4)) {
			x0[i] = -1;
			xm[i] = 4;
		}
		// 4-4 for y
		if ((y1[i] == 4) && (y2[i] == 4)) {
			y0[i] = -1;
			ym[i] = 4;
		}

		//deal with x0 y0 xm ym
		// 2-2 for x and y
		if (ym[i] == 2 && xm[i] == 2) {
			if (x0[i] == -1) {
				x0[i] = 0;
			}
			if (y0[i] == -1) {
				y0[i] = 0;
			}
			//all is good
			continue;
		}
		// for 3-3 or 3-2 or 2-3. sutable is 0-0 or 1-1
		if ((xm[i] == 3) || (ym[i] == 3)) {
			if ((x0[i] == 0 && y0[i] == 0) || (x0[i] == 1 && y0[i] == 1)) {
				//all is good
				continue;
			}
			// x - -1
			if ((x0[i] == 0 || x0[i] == 1) && (y0[i] == -1)) {
				y0[i] = x0[i];
				continue;
			}
			// -1 - y
			if ((y0[i] == 0 || y0[i] == 1) && (x0[i] == -1)) {
				x0[i] = y0[i];
				continue;
			}
			// -1 - -1
			if ((x0[i] == -1) && (y0[i] == -1)) {
				x0[i] = 0;
				y0[i] = 0;
				continue;
			}
			printf("Big error occured. COLOR IS RED!!!\n");
			exists = false;
			break;
		}
		// for 4-4 or 4-2 or 2-4. sutable is 0-1 or 1-0
		if ((xm[i] == 4) || (ym[i] == 4)) {
			if ((x0[i] == 0 && y0[i] == 1) || (x0[i] == 1 && y0[i] == 0)) {
				//all is good
				continue;
			}
			// x - -1
			if ((x0[i] == 0 || x0[i] == 1) && (y0[i] == -1)) {
				y0[i] = x0[i]^1;
				continue;
			}
			// -1 - y
			if ((y0[i] == 0 || y0[i] == 1) && (x0[i] == -1)) {
				x0[i] = y0[i]^1;
				continue;
			}
			// -1 - -1
			if ((x0[i] == -1) && (y0[i] == -1)) {
				x0[i] = 0;
				y0[i] = 1;
				continue;
			}
			printf("Big error occured. COLOR IS RED!!!\n");
			exists = false;
			break;
		}
		printf("Big error occured. COLOR IS RED!!!\n");
	}
/*	printf("x0 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", x0[i]);
	}
	printf("\nxm =");
	for (int i = 0; i < 32; i++) {
		printf("%d", xm[i]);
	}
	printf("\ny0 =");
	for (int i = 0; i < 32; i++) {
		printf("%d", y0[i]);
	}
	printf("\nyn =");
	for (int i = 0; i < 32; i++) {
		printf("%d", ym[i]);
	}
	printf("\n");*/
	printf("%s\n", exists ? "YES" : "NO");
	if (exists) {
		mask = 1;
		xe = 0;
		ye = 0;
		for (int i = 0; i < 32; i++) {
			xe += x0[i] * mask;
			ye += y0[i] * mask;
			mask *= 2;
		}
		printf("%d %d\n", xe, ye);
	}
	return 0;
}
