#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"

extern void lo2up(char *);
extern void up2lo(char *);
extern char *findchr(char *,char);

char buffer[51];

int main(void) {
  char *c;

  InitializeHardware(HEADER,"ASCII String Processing");
  strncpy(buffer,"*Go Mustangs!",50);
  lo2up(buffer);
  printf("To upper case:\n  %s\n",buffer);
  strncpy(buffer,"*Beat The Golden Hurricane!",50);
  up2lo(buffer);
  printf("To lower case:\n  %s\n",buffer);
  strncpy(buffer,"*Go Mustangs!",50);
  c = findchr(buffer,'a');
  if (c) printf("Found 'a' = %c\n",*c);
  else printf("'a' not found\n");
  c = findchr(buffer,'p');
  if (c) printf("Found 'p' = %c\n",*c);
  else printf("'p' not found\n");
}
