#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *fin, *fout;

struct avltree {
    unsigned long long a;
    unsigned long long key;
    int height;
    struct avltree *left;
    struct avltree *right;
};

struct avltree* find(struct avltree *tree, unsigned long long key) {
    if (tree == NULL) {
        return NULL;
    }
    while (1) {
        if (key == tree->key) {
            return tree;
        }
        if (key < tree-> key) {
            if (tree -> left != NULL) {
                tree = tree -> left;
            } else {
                break;
            }
        } else {
            if (tree -> right != NULL) {
                tree = tree -> right;
            } else {
                break;
            }
        }
    }
    return tree->key == key ? tree : NULL;
}

void freetree(struct avltree *tree) {
    if (tree != NULL) {
        freetree(tree->left);
        freetree(tree->right);
        free(tree);
    }
}

static inline int height(struct avltree *p) {
    return p ? p->height : 0;
}

static inline int max(int lhs, int rhs) {
    return lhs > rhs ? lhs : rhs;
}

static void SingleRotateWithLeft (struct avltree **root) {
    struct avltree *k1;
    k1 = (*root)->left;
    (*root)->left = k1->right; /* k1 != NULL */
    k1->right = (*root);
    (*root)->height = max (height ((*root)->left),
                           height ((*root)->right)) + 1;
    k1->height = max (height (k1->left), (*root)->height) + 1;
    (*root) = k1;
}

static void SingleRotateWithRight (struct avltree **root) {
    struct avltree *k2;
    k2 = (*root)->right;
    (*root)->right = k2->left;
    k2->left = (*root);
    (*root)->height = max (height ((*root)->left),
                           height ((*root)->right)) + 1;
    k2->height = max (height (k2->right), (*root)->height) + 1;
    (*root) = k2;
}

static void DoubleRotateWithLeft (struct avltree **k3) {
    SingleRotateWithRight (&((*k3)->left));
    SingleRotateWithLeft (k3);
}

static void DoubleRotateWithRight (struct avltree **k1){
    SingleRotateWithLeft (&(*k1)->right);
    SingleRotateWithRight(k1);
}

void insert(struct avltree **tree, unsigned long long key, unsigned long long a) {
    if (tree == NULL || (*tree) == NULL) {
        struct avltree *mytree = malloc(sizeof(struct avltree));
        mytree->key = key;
        mytree->a = a;
        mytree->height = 1;
        mytree->left = NULL;
        mytree->right = NULL;
        mytree->height = 1;
        (*tree) = mytree;
        return;
    }
    if (key <= (*tree)->key) {
        insert(&(*tree)->left, key, a);
        if (height((*tree)->left) - height((*tree)->right) == 2) {
            if (key < (*tree)->left->key)
                SingleRotateWithLeft (tree);
            else
                DoubleRotateWithLeft (tree);
        }
    }
    else if (key > (*tree)->key) {
        insert(&(*tree)->right, key, a);
        if (height((*tree)->right) - height((*tree)->left) == 2) {
            if (key > (*tree)->right->key)
                SingleRotateWithRight (tree);
            else
                DoubleRotateWithRight (tree);
        }
    }

    (*tree)->height = max (height ((*tree)->left), height ((*tree)->right)) + 1;
}

unsigned long long myhash(char *string){
    unsigned long long hash = 0;
    int b = strlen(string);
    long long p = 1;
    for (int i = 0; i < b; i++) {
        unsigned long long temp = 30;
        if (string[i] == '-') {
            temp = 29;
        }
        else if (string[i] == '.') {
            temp = 28;
        }
        else {
            temp = string[i] - 'a';
        }
        hash += + temp * p;
        p *= 63;
    }
    return hash;
}


int main(int argc, char** args) {
    fin = fopen("./input.txt", "r");
    fout = fopen("./output.txt", "w");

    struct avltree *root = NULL;

    int n;

    fscanf(fin, "%d", &n);

    char s[105];
    unsigned long long ip;

    for (int i = 0; i < n; i++) {
        fscanf(fin, "%s %llu", s, &ip);
        unsigned long long hash =  myhash(s);

        struct avltree *node = find(root, hash);
        if (node != NULL) {
            node->a = ip;
            continue;
        }
        insert(&root, hash, ip);

    }

    fscanf(fin, "%d", &n);

    for (int i = 0; i < n; i++) {
        fscanf(fin, "%s %llu", s, &ip);
        unsigned long long hash =  myhash(s);

        struct avltree *node = find(root, hash);
        if (node != NULL) {
            fprintf(fout,"%llu\n", node->a);
        } else {
            fprintf(fout,"-1\n");
        }
    }


    fclose(fin);
    fclose(fout);
    return 0;
}