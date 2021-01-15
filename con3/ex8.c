#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int max(int a, int b){
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

int min(int a, int b){
    if (a < b) {
        return a;
    } else {
        return b;
    }
}

int mid(int a, int b, int c) {
    return a + b - min(a, min(b , c)) + c - max(a, max(b , c));
}

int masN[1000], tempN[1000];
int *mas = masN, *temp = tempN;
int main(int argc, char** args) {
    int n = 0;
    scanf("%d", &n);
	for (int i = 0; i < n; i++) {
        scanf("%d", masN +i);
	}

    for (int i = 0; i < n/2; i++) {
        for (int j = 0; j < n - 2 - i * 2; j++) {
            temp[j] = mid(mas[j], mas[j + 1] ,mas[j + 2]);
        }
        mas = temp;
    }

    printf("%d", mas[0]);
	printf("\n");
	return 0;
}