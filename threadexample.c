#include <stdlib.h>
#include <stdio.h>
#include "include/mcbsp.h"

void spmd()
{
  bsp_begin(P);
  printf("Hello world from thread %d out of %d!\n",bsp_pid(),bsp_nprocs() );
  bsp_end();
}

int main(int argc, char** argv)
{
  printf("How many threads do you want to create? There are %d cores available.\n",bsp_nprocs() );
  fflush(stdout);
  scanf("%d", &P);
  if(P == 0 || P > bsp_nprocs() )
    {
      fprint(stderr, "Cannot create %d threads.\n",P);
      return EXIT_FAILURE;
    }
  bsp_init(&spmd,argc,argv);
  spmd();
  return EXIT_SUCCESS;
}
