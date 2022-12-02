#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"
#define COLOR_GREEN         0xFF00FF00
#define COLOR_RED           0xFFFF0000

//
// This main program is written assuming the filled rectangle
// drawing function named rect() is drawn. Edit the function
// name to line() if you are instead using a line drawing
// function. Your function must now accept a single argument
// of the uint32_t pixel word to draw with.
//

extern void rect(uint32_t);
extern void delay(uint32_t);

int main(void) {
  InitializeHardware(HEADER,"Flashing");
  while (1) {
    rect(COLOR_RED);
    delay(1000);
    rect(COLOR_GREEN);
    delay(1000);
  }
}
