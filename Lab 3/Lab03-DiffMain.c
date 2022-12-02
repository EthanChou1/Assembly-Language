#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern int32_t diff(int32_t,int32_t);

int main(void) {
  int32_t a,b,r;

  InitializeHardware(HEADER,"Subtract");
  a = 45;  // Complete this statement
  b = 44;  // Complete this statement
  printf("difference (hex) =\n  0x%lX\n",a - b);
  printf("difference (signed decimal) =\n  %ld\n",a - b);
  r = diff(a,b);
  printf("diff() return value (hex) =\n  0x%lX\n",r);
  printf("diff() return value (signed dec) =\n  %ld\n",r);
}
