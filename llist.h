#ifndef LLIST_H
#define LLIST_H

#include "stdlib.h"

struct llist_t {
  int value;
  struct llist_t* next;
};

typedef void (*funp_t)(const struct llist_t*);
typedef int (*funp2_t)(int, const struct llist_t*);
typedef void (*funp_mut_t)(struct llist_t*);

struct llist_t *list_create(int);

void list_add_front(struct llist_t**, int);

void list_add_back(struct llist_t**, int);

struct llist_t* list_node_at(struct llist_t*, size_t);

int list_get_at(struct llist_t*, size_t, int*);

int list_sum(const struct llist_t*, int);

void list_free(struct llist_t*);

void foreach(const struct llist_t*, funp_t);

struct llist_t* map(const struct llist_t*, funp_mut_t);
void map_mut(struct llist_t*, funp_mut_t);

int foldl(int, funp2_t, const struct llist_t*);

struct llist_t* iterate(const struct llist_t*, funp_mut_t, size_t);

#endif
