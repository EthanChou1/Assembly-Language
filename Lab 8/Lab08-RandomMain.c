#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern void seed_random(uint32_t);
extern uint32_t random(void);

int main(void) {
  int i;
  InitializeHardware(HEADER,"Random bits generator");
  seed_random(0x12345678);
  while (1) {
    for (i = 0;i < 20;i++) printf("0x%08lX\n",random());
    printf("--Waiting for blue button--\n");
    WaitForPushButton();
  }
}
