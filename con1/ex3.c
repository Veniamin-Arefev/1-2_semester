#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** args) {
	long long n;
	char c;
	scanf("%lld",&n);
	c = ' ';
	while (c != '.')
	for (int i = 0; i != 1;){
		scanf("%c",&c);
		if (c == 46){
			i = 1;
		}
		if ((c >= 'A') && (c <= 'Z')) {
			c = (c - 65 + n) % 26 + 65;
		}
		if ((c >= 'a') && (c <= 'z')) {
			c = (c - 97 + n) % 26 + 97;
		}
		printf("%c", c);
	}
//	printf("\n");
//	printf("%lld",count);
	printf("\n");
	return 0;
}
