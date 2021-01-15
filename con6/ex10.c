#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include <math.h>

struct data {
    int a;
};

struct list {
    struct data *data;
    struct list *next;
    struct list *prev;
};
/*
int compareData(struct data *data1, struct data *data2){
    if (data1->a == data2->a) {
        return 0;
    }
    if (data1->a > data2->a) {
        return 1;
    } else {
        return -1;
    }
}

int delete(struct list **head, struct data *data) { // del - deleting
    if (data == NULL) { //error
        return -1;
    }
    struct list *iterhead = *head;
    struct list *required = NULL;
    while (iterhead->next != NULL) {
        if (compareData(iterhead->data, data) == 0) {
            required = iterhead;
            break;
        }
        iterhead = iterhead->next;
    }
    if (required == NULL) {
        if (compareData(iterhead->data, data) == 0) {
            required = iterhead;
        }
    }
    if (required == NULL) { //error
        return 404;
    } //else
    if (required->prev == NULL && required->next == NULL) {
        free(required);
        (*head) = NULL;
        return 0;
    }
    if (required->prev == NULL) { //is head
        *head = (*head)->next;
        required->next->prev = NULL;
    } else {
        if (required->next == NULL) { //is head
            required->prev->next = NULL;
        } else { //element is in the middle
            required->prev->next = required->next;
            required->next->prev = required->prev;
        }
    }
    free(required->data);
    free(required);
    return 0;
}
*/
void add_to_head(struct list **head, struct data *data) { // del - deleting
    if (data == NULL) { //error
        return;
    }
    if ((*head) == NULL) {
        struct list *adding = malloc(sizeof(struct list));
        adding->data = data;
        adding->next = NULL;
        adding->prev = NULL;
        (*head) = adding;
        return;
    }
    struct list *adding = malloc(sizeof(struct list));
    adding->data = data;
    adding->next = *head;
    adding->prev = NULL;
    (*head)->prev = adding;
    (*head) = adding;
}
/*
void add_to_tail(struct list **head, struct data *data) { // del - deleting
    if (data == NULL) { //error
        return;
    }
    if (head == NULL) {
        struct list *adding = malloc(sizeof(struct list));
        adding->data = data;
        adding->next = NULL;
        adding->prev = NULL;
        (*head) = adding;
        return;
    }
    struct list *iterhead = *head;
    while (iterhead->next != NULL) {
        iterhead = iterhead->next;
    }
    struct list *adding = malloc(sizeof(struct list));
    adding->data = data;
    adding->next = NULL;
    adding->prev = iterhead;
    iterhead->next = adding;
}
*/

struct list **mas;
int main(int argc, char** args) {
    FILE *fin, *fout;

    fin = fopen("./input.txt", "r");
    fout = fopen("./output.txt", "w");
    int n,m;
    fscanf(fin, "%d %d", &n, &m);
    struct data *dataa;
    struct list *head = NULL;
    mas = calloc(n, sizeof(struct list));
    for (int i = n; i > 0; i--){
        dataa = malloc(sizeof(struct data));
        dataa->a = i;
        add_to_head(&head, dataa);
        mas[i] = head;
    }

    for (int i = 0; i < m; i++){
        int b, c;
        fscanf(fin, "%d %d", &b, &c);
        struct list *leftel = mas[b];
        struct list *rightel = mas[c];

        if (leftel->prev == NULL) {
            continue;
        }
        leftel->prev->next = rightel->next;
        if (rightel->next != NULL) {
            rightel->next->prev = leftel->prev;
        }

        leftel->prev = NULL;

        rightel->next = head;
        head->prev = rightel;

        head = leftel;
    }
    struct list *iterhead = head;
    while (iterhead->next != NULL) {
        fprintf(fout,"%d ", iterhead->data->a);
        iterhead = iterhead->next;
    }
    fprintf(fout,"%d ", iterhead->data->a);

    //fprintf(fout, "%d %d %d", words, sentense, paragraf);

    fclose(fin);
    fclose(fout);
    return 0;
}