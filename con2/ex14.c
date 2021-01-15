﻿#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int in[1001], out[1001], num[1001];
int n;
int getMax(int order) { //get max of order -> if order = 0 first max, order = 1 second max.....
	int curorder = 0;
	for (int i = n; i > 0; i--) {
		if (num[i] == 0) {
			if (curorder == order) {
				return i;
			} else {
				curorder++;
			}
		}
	}
	// curorder < order
	return -1;
}

int main(int argc, char** args) {
	scanf("%d", &n);
	for (int i =0;i < n; i++){
		scanf("%d",in + i);
		out[i] = 0;
		num[i] = 0;
	}

	for (int i =0;i < n; i++){
		int temp = getMax(in[i]);
		if(temp == -1) {
			printf("-1\n");
			return 0;
		}
		out[i] = temp;
		num[temp] = 1;
	}

	for (int i =0;i < n; i++){
		printf("%d ",out[i]);
	}
	printf("\n");
	return 0;
}