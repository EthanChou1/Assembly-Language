#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern uint8_t int2asc(uint8_t);
extern uint8_t asc2int(uint8_t);
uint8_t ascii[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

int main(void) {
  uint8_t i;

  InitializeHardware(HEADER,"Integer/ASCII Conversion");
  i = 0;
  while (i < 16) {
    printf("From integer: %u->%c\n",i,int2asc(i));
    i++;
  }
  printf("--Waiting for blue button--\n");
  WaitForPushButton();
  i = 0;
  while (i < 16) {
    printf("From ASCII: %c->%u\n",ascii[i],asc2int(ascii[i]));
    i++;
  }
}
