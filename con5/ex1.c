#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

struct kompl {
    long long real;
    long long imag;
};

int main(int argc, char** args) {

    long long n;
    scanf("%lld", &n);

    long long n2 = n*n;
    struct kompl *mas = malloc(sizeof(struct kompl) * n2);

    long long a, b;
    for(long long i = 0; i < n2; i++) {
        scanf("%lld %lld", &a, &b);
        mas[i] = (struct kompl) {a, -b};
    }

    //printf("%d %d ", mas[0].real, mas[0].imag);
    //printf("%d %d ", mas[1].real, mas[1].real);

    for(long long i = 0; i < n; i++) {
        for(long long j = i; j < n2; j+= n) {
            printf("%lld %lld ", mas[j].real, mas[j].imag);
        }
        printf("\n");
    }

    printf("\n");
    return 0;
}