#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int scan(void) {
	int n = 0;
	if (scanf("%d", &n) == 1) {
    	    if (n != 0) {
		    scan();
		    printf("%d ", n);
	    }
	}
	return 0;
}

int main(int argc, char** args) {
	
	scan();
	return 0;
}