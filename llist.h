#ifndef LLIST_H
#define LLIST_H

#include "stdlib.h"

struct llist_t;

struct llist_t *list_create(int);

void list_add_front(struct llist_t** origin, int value);

void list_add_back(struct llist_t** origin, int value);

struct llist_t* list_node_at(struct llist_t* origin, size_t i);

int list_get_at(struct llist_t* origin, size_t i, int *data);

int list_sum(const struct llist_t* list, int sum);

void list_free(struct llist_t* origin);

#endif
