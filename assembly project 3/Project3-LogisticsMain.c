#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"
#include "graphics.h"
#define NUM_POINTS 100

extern void map(float,float,float *,int);

int main(void) {
  float x[NUM_POINTS],r;
  uint16_t xp,yp;
  int i;

  InitializeHardware(HEADER,"Logistics map");
  xp = 0;
  while (xp < 240) {
    r = 2.5 + (1.5 * ((float) xp) / 240.0);
    map(r,0.25,x,NUM_POINTS);
    i = 0;
    while (i < NUM_POINTS) {
      yp = 300 - ((uint16_t) (x[i] * 250.0));
      DrawPixel(xp,yp,COLOR_RED);
      i++;
    }
    xp++;
  }
}
