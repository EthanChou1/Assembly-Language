#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern float determinant(float *);

// Declare and initialize matrix here as a float array
// with elements stored "row-wise", that is
// float A[4] = {a11, a12, a21, a22};

float A[4] = {4.0, 6.0, 3.0, 8.0};

int main(void) {
  float D;

  InitializeHardware(HEADER,"Determinant");
  printf("Matrix:\n%8.2f %8.2f\n%8.2f %8.2f\n",A[0],A[1],A[2],A[3]);
  D = determinant(A);
  printf("Determinant = %.7e\n",D);
  if (D == 0.0) printf("Matrix is singular\n");
  else printf("Matrix is non-singular\n");

}
