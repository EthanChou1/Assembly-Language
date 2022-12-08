#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint32_t average1(void);
extern uint32_t average2(void);

int i;
uint32_t a;

int main(void) {
  InitializeHardware(HEADER,"Averages");
  a = average1();
  printf("Average 1 = %lu\n",a);
  a = average2();
  printf("Average 2 = %lu\n",a);
}

