#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <malloc.h>

int n = 0;

long long* generate_array(int n, time_t time_gen) {
    long long *array = malloc(n*sizeof(long long));
    srand(time_gen);
    int middle = RAND_MAX / 2;
    for (int i = 0; i < n; i++) {
        int bool = rand() >= middle ? 1 : -1;
        array[i] = rand() * rand() * bool;
        //array[i] = rand() * bool;
    }
    return array;
}

void bubblesort(long long *array, long long *compareout, long long *swapout) {
    long long comparecounter = 0, swapcounter = 0;
    for (int i = 0; i < n; i++) {
        int was = 0;
        for (int j = 1; j < n - i; j++) {
            ++comparecounter;
            if (llabs(array[j-1]) > llabs(array[j])) {
                long long temp = array[j-1];
                array[j-1] = array[j];
                array[j] = temp;
                was = 1;
                ++swapcounter;
            }
        }
        if (!was) {
            break;
        }
    }
    (*compareout) = comparecounter;
    (*swapout) = swapcounter;
}

void quick_sort(long long *array, int start, int end, long long *compareout, long long *swapout) {
    long long comparecounter = 0, swapcounter = 0;

    int left = start, right = end;
    long long middle = llabs(array[(start + end) / 2]);
    do {
        while (llabs(array[left]) < middle && left < end) {
            ++comparecounter;
            left++;
        }
        while (middle < llabs(array[right]) && right > start) {
            ++comparecounter;
            right--;
        }
        if (left < right) {
            long long temp = array[left];
            array[left] = array[right];
            array[right] = temp;
            ++swapcounter;
            left++;
            right--;
        } else {
            if (left == right) {
                left++;
                right--;
            }
        }
        comparecounter += 3;
    } while (left <= right);
    if (right > start) {
        quick_sort(array, start, right, compareout, swapout);
    }
    if (end > left) {
        quick_sort(array, left, end, compareout, swapout);
    }

    (*compareout) += comparecounter;
    (*swapout) += swapcounter;
}

int main() {
    time_t time_gen = time(NULL);

    printf("Enter valid size of array to generate :");
    scanf("%d", &n);

    int sout = 1;
    printf("Should generated and sorted array be printed?");
    scanf("%d", &sout);

    long long * array = generate_array(n, time_gen);
    printf("Generated array :\n");
    if (sout) {
        for (int i = 0; i < n; i++) {
            printf("%lld ", array[i]);
        }
        printf("\n");
    } else {
        printf("Nope\n");
    }


    //bubble sort
    long long comparecounter = 0, swapcounter = 0;
    unsigned int start_time =  clock();
    //bubblesort(array, &comparecounter, &swapcounter);
    unsigned int end_time = clock();

    printf("==============================\n       Bubble sort :\n==============================\n");
    printf("Compared %lld times and swapped %lld times :\n", comparecounter, swapcounter);
    printf("It took  %u ms :\n", end_time - start_time);
    printf("Sorted array :\n");
    if (sout) {
        for (int i = 0; i < n; i++) {
            printf("%lld ", array[i]);
        }
        printf("\n");
    } else {
        printf("Nope\n");
    }

    //quick sort
    free(array);
    array = generate_array(n, time_gen);
    comparecounter = 0; swapcounter = 0;
    start_time = clock();
    quick_sort(array, 0, n, &comparecounter, &swapcounter);
    end_time = clock();

    printf("==============================\n       Quick sort :\n==============================\n");
    printf("Compared %lld times and swapped %lld times :\n", comparecounter, swapcounter);
    printf("It took  %u ms :\n", end_time - start_time);
    printf("Sorted array :\n");
    if (sout) {
        for (int i = 0; i < n; i++) {
            printf("%lld ", array[i]);
        }
        printf("\n");
    } else {
        printf("Nope\n");
    }

    free(array);
    return 0;
}