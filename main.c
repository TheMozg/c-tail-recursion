#include "stdio.h"
#include "llist.h"
#include "limits.h"

void print_space(const struct llist_t* node){
  printf("%d ", node->value);
}

void print_newline(const struct llist_t* node){
  printf("%d\n", node->value);
}

void square_value(struct llist_t* node){
  node->value = node->value * node->value;
}

void cube_value(struct llist_t* node){
  node->value = node->value * node->value * node->value;
}

void abs_value(struct llist_t* node){
  node->value = node->value < 0 ? -node->value : node->value;
}

int sum(int acc, const struct llist_t* node){
  if(node == NULL)
    return acc;
  return acc + node->value;
}

int max(int acc, const struct llist_t* node){
  if(node == NULL)
    return acc;
  return acc > node->value ? acc : node->value;
}

int min(int acc, const struct llist_t* node){
  if(node == NULL)
    return acc;
  return acc < node->value ? acc : node->value;
}

void double_value(struct llist_t* node){
  node->value = node->value * 2;
}

int main(int argc, char const *argv[]) {
  struct llist_t* list = NULL;
  struct llist_t* list2 = NULL;
  struct llist_t* list3 = NULL;
  struct llist_t* list4 = NULL;
  int input_token;

  puts("Input list values separated by space (char to break)");
  while (scanf("%d", &input_token) == 1) {
    list_add_back(&list, input_token);
  }

  printf("Array sum: %d\n", list_sum(list, 0));

  puts("Printing array (space delimeter)");
  foreach(list, print_space);
  puts("\nPrinting array (newline delimeter)");
  foreach(list, print_newline);

  list2 = map(list, square_value);
  puts("Printing new array (squared)");
  foreach(list2, print_space);

  list3 = map(list, cube_value);
  puts("\nPrinting new array (cubed)");
  foreach(list3, print_space);

  printf("\nArray sum: %d\n", foldl(0, sum, list));
  printf("Max: %d\tmin:%d\n", foldl(INT_MIN, max, list), foldl(INT_MAX, min, list));

  map_mut(list, abs_value);
  puts("Printing original array (absolute)");
  foreach(list, print_space);

  list4 = iterate(list_create(2), double_value, 10l);
  puts("\nPrinting powers of 2 (iterating)");
  foreach(list4, print_space);

  puts("");
  list_free(list);
  list_free(list2);
  list_free(list3);
  list_free(list4);
  return 0;
}
