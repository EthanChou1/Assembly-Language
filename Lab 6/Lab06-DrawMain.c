#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern void line(void);

int main(void) {
  InitializeHardware(HEADER,"Graphics");
  line();
}
