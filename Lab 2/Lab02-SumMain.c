#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint32_t sum1(uint32_t,uint32_t,uint32_t,uint32_t);
extern uint32_t sum2(uint32_t,uint32_t,uint32_t,uint32_t);

int main(void) {
  uint32_t a,b,c,d,r;

  InitializeHardware(HEADER,"Move and Add");
  a = 0xB620;  // Complete this statement
  b = 0x39C4;  // Complete this statement
  c = 0x571A;  // Complete this statement
  d = 0x41F8;  // Complete this statement
  printf("sum = 0x%lX\n",a + b + c + d + 0x4C);
  r = sum1(a,b,c,d);
  printf("sum1() return value = 0x%lX\n",r);
  r = sum2(a,b,c,d);
  printf("sum2() return value = 0x%lX\n",r);
}
