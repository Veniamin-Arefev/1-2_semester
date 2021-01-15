#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int n = 9;

int min(int a, int b) {
    if (a > b) {
        return b;
    } else {
        return a;
    }
    return -1;
}

int a[9][9];
int main(int argc, char** args) {
    int sum = 0;
	for (int i = 1; i < n; i++) {
        scanf("%d", &a[0][i]);
	}

	for (int i = 1; i < n; i++) {
        scanf("%d", &a[i][0]);
	}

    for (int i = 1; i < n; i++) {
        for (int j = 1; j < n; j++) {
            a[i][j] = min(a[0][i], a[j][0]);
		}
	}

/*    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%3d", a[i][j]);
		}
        printf("\n");
	}
*/

	for (int i = 1; i < n; i++) {
        int vst = 0;
        for (int j = 1; j < n; j++) {
            if (a[0][i] == a[i][j]) {
                vst = 1;
            }
            if (a[0][i] < a[i][j]) {
                //printf("i = %d j = %d\n", i , j);
                printf("-1\n");
                return 0;
            }
		}
        if (!vst) {
                printf("-1\n");
                return 0;
        }
	}

    for (int i = 1; i < n; i++) {
        int vst = 0;
        for (int j = 1; j < n; j++) {
            if (a[i][0] == a[j][i]) {
                vst = 1;
            }
            if (a[i][0] < a[j][i]) {
                //printf("i = %d j = %d\n", i , j);
                printf("-1\n");
                return 0;
            }
		}
        if (!vst) {
                printf("-1\n");
                return 0;
        }
    }

    for (int i = 1; i < n; i++) {
        for (int j = 1; j < n; j++) {
            sum += a[i][j];
		}
	}


	printf("%d", sum);
	printf("\n");
	return 0;
}