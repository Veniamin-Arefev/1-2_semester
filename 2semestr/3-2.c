#include <stdio.h>

int eax = 0, ebx = 0, ecx = 0;
int input = 0;
int saveeax = 0, saveecx = 0;
long long sumebx = 0;
int first = 1;

void f(void);

void l(void) {
    sumebx -= ebx;
    ebx = eax;
    ebx &= 1;
    eax /=  2;
    ecx--;
    saveeax = eax;
    saveecx = ecx;
    sumebx++;
    printf("eax = %d, ebx = %d, ecx = %d\n", eax, ebx, ecx);
    f();
}

void f(void) {
    eax = 32;
    if (first) {
        ecx = eax;
        eax = input;
        first = 0;
    } else {
        ecx = saveecx;
        eax = saveeax;
    }
    //printf("eax = %d, ecx = %d\n", eax, ecx);
    if (ecx) {
        l();
    }
}


int main(void) {
//    int in = 0;
    scanf("%u", &input);
    printf("%x\n", input);
/*    printf("Input is %d\n", in);
    int sing = in >> 31;
    in<<=1;
    in>>=1;
    if (sing) { //first bit is 1
        input = 1;
        input -=((int)in);
    } else {
        input += in;
    }
    printf("%d  %d\n", in, input);
*/
    f();

    printf("%d",sumebx);
    return 0;
}
