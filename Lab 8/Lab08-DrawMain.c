#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern void seed_random(uint32_t);
extern uint32_t random(void);
extern void rect(void);

int main(void) {
  InitializeHardware(HEADER,"Graphics");
  seed_random(0x12345678);
  while (1) {
	  rect();
  }
}
