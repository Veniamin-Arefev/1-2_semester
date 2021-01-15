#include <stdio.h>
#include <malloc.h>
#include <math.h>
#include <string.h>

void prefix_function (char *s, int *pi, size_t n)
{
    pi[0]=0;          // в i-м элементе (его индекс i-1) количество совпавших символов в начале и конце для подстроки длины i.
    // p[0]=0 всегда, p[1]=1, если начинается с двух одинаковых
    for (size_t i=1; i<n; ++i)
    {
        int j = pi[i-1];
        while ((j > 0) && (s[i] != s[j])) // не равны
            j = pi[j-1];         // берем ранее рассчитанное значение (начиная с максимально возможных)
        if (s[i] == s[j]) // равны
            ++j;
        pi[i] = j;
    }
}

int main (void) {

    int p[9] = {0};
    char *s = "aaaaaaaaaaaaaaaaaaaa";
    prefix_function(s, p, 9);
    for (int i = 0; i < 9; i++) {
        printf("%d", p[i]);
    }


    return 0;
}