#include "stdio.h"
#include "llist.h"

#define LIST_INDEX 3l

int main(int argc, char const *argv[]) {
  struct llist_t* list = NULL;
  int value;
  unsigned long i;

  /*
  //not needed for recursion
  int input_token;
  puts("Input list values separated by space (char to break)");
  while (scanf("%d", &input_token) == 1) {
    list_add_back(&list, input_token);
  }
  */

  puts("Adding values. This may take a while.");
  for (i = 0; i < 9999999; i++){
    list_add_front(&list, 1);
  }
  puts("Finished adding values");

  printf("Array sum: %d\n", list_sum(list, 0));

  if (list_get_at(list, LIST_INDEX, &value))
    printf("List[%lu] = %d\n", LIST_INDEX, value);
  else
    fputs("Out of bounds error", stderr);

  list_free(list);

  return 0;
}
