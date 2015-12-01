#include "llist.h"
#include "malloc.h"

struct llist_t *list_create(int value)
{
  struct llist_t *node = malloc(sizeof(struct llist_t));
  node->value = value;
  node->next = NULL;
  return node;
}

void list_add_front(struct llist_t** origin, int value){
  struct llist_t* origin_new = list_create(value);
  origin_new->next = *origin;
  *origin = origin_new;
}

void list_add_back(struct llist_t** origin, int value){
  struct llist_t* node = *origin;
  if (*origin == NULL) {
    *origin = list_create(value);
    return;
  }
  while (node->next != NULL) {
    node = node->next;
  }
  node->next = list_create(value);
}

struct llist_t* list_node_at(struct llist_t* origin, size_t i) {
  size_t count = 0;
  struct llist_t* node = origin;
  if (origin == NULL) {
    return NULL;
  }
  for(;;){
    if (count == i)
      return node;
    count++;
    if (node->next != NULL)
      node = node->next;
    else
      break;
  }
  return NULL;
}

int list_get_at(struct llist_t* origin, size_t i, int *data){
  struct llist_t* node = list_node_at(origin, i);
  if (node != NULL) {
    *data = node->value;
    return 1;
  }
  return 0;
}


int list_sum(const struct llist_t* node, int sum) {
  if(node == NULL)
    return sum;
  sum += node->value;
  return list_sum(node->next, sum);
}

void list_free(struct llist_t* origin) {
  struct llist_t* node;
  struct llist_t* nextnode;
  if (origin == NULL) {
    return;
  }
  node = origin;
  do {
    nextnode = node->next;
    free(node);
    node = nextnode;
  } while(nextnode != NULL);
}

void foreach(const struct llist_t* origin, funp_t fp){
  const struct llist_t* node = origin;
  while (node != NULL) {
    fp(node);
    node = node->next;
  }
}

struct llist_t* map(const struct llist_t* origin, funp_mut_t fp)
{
  struct llist_t* list = NULL;
  struct llist_t* head = NULL;
  const struct llist_t* node = origin;
  if (origin == NULL) {
    return NULL;
  }
  list = list_create(origin->value);
  head = list;
  fp(head);
  while (node->next != NULL) {
    head->next = list_create(node->next->value);
    fp(head->next);
    node = node->next;
    head = head->next;
  }
  return list;
}

void map_mut(struct llist_t* origin, funp_mut_t fp){
  struct llist_t* node = origin;
  while (node != NULL) {
    fp(node);
    node = node->next;
  }
}

int foldl(int acc, funp2_t fp, const struct llist_t* origin){
  const struct llist_t* node = origin;
  while (node != NULL) {
    acc = fp(acc, node);
    node = node->next;
  }
  return acc;
}

struct llist_t* iterate(const struct llist_t* origin, funp_mut_t fp, size_t n){
  struct llist_t* list = NULL;
  struct llist_t* head = NULL;
  size_t i;
  if (origin == NULL) {
    return NULL;
  }
  list = list_create(origin->value);
  head = list;
  for (i = 0; i < n-1; i++) {
    head->next = list_create(head->value);
    fp(head->next);
    head = head->next;
  }
  return list;
}
