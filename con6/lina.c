#include <stdio.h>
#include <stdint.h>

int main(void){
    FILE *in, *out;
    in = fopen("matrix.in", "rb");
    out = fopen("trace.out", "wb");
    unsigned char k;
    unsigned short n = 0;
    uint64_t trace = 0;
    uint64_t big_endian_trace = 0;
    fread(&n, sizeof(char), 1, in);
    n <<= 8;
    fread(&k, sizeof(char), 1, in);
    n |= k;
//    printf("%u\n", n);
    for (unsigned int i = 0; i < n; i++){
        //printf("In fir for\n");
        for (unsigned int j = 0; j < n; j++){
            //printf("In sec for\n");
            uint64_t temp = 0;
            fread(&k, sizeof(char), 1, in);
            if (k & 128) {
                temp = 4294967295;
            }
            temp <<= 8;
            temp |= k;
            fread(&k, sizeof(char), 1, in);
            temp <<= 8;
            temp |= k;
            fread(&k, sizeof(char), 1, in);
            temp <<= 8;
            temp |= k;
            fread(&k, sizeof(char), 1, in);
            temp <<= 8;
            temp |= k;
            //    read(in, &temp, sizeof(temp));
            /*for(unsigned int i = 0; i < 4; i++){
              be_temp = (be_temp << 8) | (temp & 255);
              temp >>= 8;
            }*/
            //temp = temp >> 16;
            //printf("%llx\n", temp);
            if(i == j) {
                trace += temp;
            }
            //printf("tr = %llx\n", trace);
        }
    }
    //printf("%llx\n", trace);

    for(unsigned int i = 0; i < 8; i++){
        big_endian_trace = (big_endian_trace << 8) | (trace & 255);
        //printf("be tr = %lld\n", big_endian_trace);
        trace >>= 8;
    }
    //printf("%llx\n", big_endian_trace);
    //printf("trace = %lld\n", big_endian_trace);
    fwrite(&big_endian_trace, sizeof(unsigned long long), 1, out);
    //output(out, trace);
    fclose(in);
    fclose(out);
    return 0;
}