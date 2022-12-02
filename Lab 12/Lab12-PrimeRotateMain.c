#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"
#include "graphics.h"

void setupTimer(uint32_t);
extern volatile uint32_t task;

//
// Task function to test if the unsigned integer pointed to by the argument
// is prime, and if so, it displays it on the screen. The integer is incremented
// after the test to prepare for the next call.
//
void check_prime(uint32_t *test) {
  uint32_t factor;
  char buffer[21];

  factor = 2;
  while (factor < *test) {
    if (factor * (*test / factor) == *test) break;
    factor++;
  }
  if (factor == *test) {
    snprintf(buffer,20,"%lu",*test);
    SetColor(COLOR_RED);
    DisplayStringAt(120,100,buffer);
  }
  (*test)++;
}

//
// Task function to rotate a triangle whose vertices are defined by the coordinates
// pointed to by the arguments. The rotation angle is given by the last argument.
// The old triangle is erased on the screen and the new rotated triangle is drawn.
// The vertex coordinates are adjusted to prepare for the next call.
//
void rotate_triangle(float *x1,float *y1,float *x2,float *y2,float *x3,float *y3,float angle) {
  float x1rot,y1rot,x2rot,y2rot,x3rot,y3rot;

  x1rot = *x1 * cosf(angle) - *y1 * sinf(angle);
  y1rot = *x1 * sinf(angle) + *y1 * cosf(angle);
  x2rot = *x2 * cosf(angle) - *y2 * sinf(angle);
  y2rot = *x2 * sinf(angle) + *y2 * cosf(angle);
  x3rot = *x3 * cosf(angle) - *y3 * sinf(angle);
  y3rot = *x3 * sinf(angle) + *y3 * cosf(angle);
  SetColor(COLOR_WHITE);
  FillTriangle ((uint16_t ) (*x1 + 110.0),(uint16_t ) (*x2 + 110.0),(uint16_t ) (*x3 + 110.0),
                (uint16_t ) (240.0 - *y1),(uint16_t ) (240.0 - *y2),(uint16_t ) (240.0 - *y3));
  SetColor(COLOR_RED);
  FillTriangle ((uint16_t ) (x1rot + 110.0),(uint16_t ) (x2rot + 110.0),(uint16_t ) (x3rot + 110.0),
                (uint16_t ) (240.0 - y1rot),(uint16_t ) (240.0 - y2rot),(uint16_t ) (240.0 - y3rot));
  *x1 = x1rot;
  *y1 = y1rot;
  *x2 = x2rot;
  *y2 = y2rot;
  *x3 = x3rot;
  *y3 = y3rot;
}

int main(void) {
  uint32_t prime;
  float x1,y1,x2,y2,x3,y3;

  InitializeHardware(HEADER,"Prime Numbers and Rotation");
// Call the setup routine for Timer 3. This will enable the timer
// and its interrupts. The Timer 3 clock prescaler will be set to
// 45000, resulting in a Timer 3 count up clock rate of 2000 counts
// per second. The uint32_t argument to the setup routine will be
// the value loaded into the Timer 3 auto-reload register, resulting
// in timer update interrupts at a rate of 2000 / (ARR+1) per second.
// The interrupt handler will invert the value of the task index
// global variable. The task index is used to select which task is
// run in the infinite loop in this thread.
  setupTimer(2000);  // Call this function with your designed argument
  DisplayStringAt(5,100,"Prime numbers:");
  prime = 3;
  x1 = 25.0;
  y1 = 50.0;
  x2 = 25.0;
  y2 = -50.0;
  x3 = -25.0;
  y3 = 0.0;
  task = 0;
  while (1) {
    if (task == 0) {
      check_prime(&prime);
    }
    else {
      rotate_triangle(&x1,&y1,&x2,&y2,&x3,&y3,0.01);
    }
  }
}
