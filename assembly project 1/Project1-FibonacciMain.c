#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint32_t fibonacci(void);
extern void init_fibonacci(void);

int main(void) {
  uint32_t i,f;

  InitializeHardware(HEADER,"Fibonacci Numbers");
  init_fibonacci();
  i = 0;
  while (1) {
    f = fibonacci();
    if (f == 0xFFFFFFFF) break;
    printf("%lu ",f);
    i++;
    if (i % 3 == 0) putchar('\n');
  }
}
