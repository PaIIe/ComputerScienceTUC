#include <stdio.h>
#include <stdlib.h>
#include "include/mcbsp.h"


void spmd()
{
  bsp_begin(3);
  printf("HEllO WOLRD\n");
  bsp_end();
}

int main(int argc, char** argv)
{
  bsp_init(&spmd, argc,argv);
  spmd();
  
  return EXIT_SUCCESS;
}
