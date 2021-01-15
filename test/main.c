#include <stdio.h>
#include "myprint.h"

extern void myprint(int num);

int main(int argc, char const *argv[]) {

    int count = 0;
    sscanf(argv[1], "%d", &count);
    for (int i = 0; i < count;i++){
       myprint(i);
    }
    return 0;
}
