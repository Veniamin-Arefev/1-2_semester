#include <stdio.h>
#include <stdint.h>
#include <malloc.h>

int exchange(uint32_t *mas, int count){
    int a = 1;
    for (int i = 0; i < count/2; i++) {
        a+=i;
//        if (mas[i] < mas[count-i-1]) {
//            a++;
//            int b = mas[i];
//            mas[i] = mas[count-i-1];
//            mas[count-i-1] = b;
//        }
    }
    return a;
}

int main(void) {
    uint32_t *mas = malloc(sizeof(uint32_t)*10);
    mas[0]= 3;
    mas[1]= 7;
    mas[2]= 6;
    mas[3]= 9;
    mas[4]= 2;
    mas[5]= 1;
    mas[6]= 8;
    mas[7]= 5;
    printf("%d", exchange(mas, 8));
    return 0;
}