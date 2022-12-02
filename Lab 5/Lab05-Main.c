#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint32_t func(void);

uint32_t r;

int main(void) {
  InitializeHardware(HEADER,"LDR and STR");
  r = func();
  printf("Return value=0x%lX\n",r);
}
