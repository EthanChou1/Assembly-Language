#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"
#include "intrinsics.h"
#include "cmsis_gcc.h"

extern void delay(uint32_t);
extern void irq_off(void);
extern void irq_on(void);

int main(void) {
  uint32_t t0,t1;

  InitializeHardware(HEADER,"Delay Block");
  __disable_irq();
  t0 = GetClockCycleCount();
  delay(1);
  t1 = GetClockCycleCount();
  __enable_irq();
  printf("Delay block: %lu\n",t1 - t0);
}
