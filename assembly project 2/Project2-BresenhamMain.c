#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern void bresenham(uint32_t,uint32_t,uint32_t,uint32_t);

int main(void) {
  InitializeHardware(HEADER,"Bresenham's Algorithm");
  bresenham(0,50,239,159);
  bresenham(0,80,239,299);
  bresenham(0,159,239,239);
}
