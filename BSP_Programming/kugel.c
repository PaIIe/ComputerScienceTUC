
#include "mcbsp.h"

#include <stdio.h>
#include <stdlib.h>

#include <math.h>
#define _PI 3.14159265358979323846 /*pi*/
#define circumference 10.0f

static double rad = circumference / (2 * _PI);

void spmd1(void);
void spmd2_entry(void);
void spmd2_p0(double * const a);

void spmd2_entry(void)
{
    
    bsp_begin(2);
    
    printf("Hello This is Thread %d  \n");
    
    double local = 0.0f;
    
    /* calculates radius of the sphere*/
    if(bsp_pid() == 1)
    {
        printf("WRITE VOLUME\n");
        
        local = (4/3) * _PI * (rad*rad*rad);
        printf("Thread %d has contribition %lf.\n", bsp_pid(), local);
        bsp_push_reg(&local, sizeof (double) );
    }
    
    else
    {
        printf("WRITE AREA \n");
        
        local = 4 * _PI * (rad * rad);
        printf("Thead %d has contribition %lf.\n", bsp_pid(), local);
        bsp_push_reg(&local, sizeof (double) );
    }
    bsp_sync();
    bsp_end();
}

void spmd2_p0(double * const a)
{
    bsp_begin(3);
    double *array = malloc ( bsp_nprocs() * sizeof(double) );
    bsp_push_reg(array, bsp_nprocs() * sizeof(double) );
    
    int n = bsp_nprocs() * sizeof(double);//sizeof(array) / sizeof(double);
    printf("Array Size %f\n", array[15]);
    
    printf("Thread 0 combines partiel results...");
    bsp_sync();
    
    for(unsigned int s = 0; s < bsp_nprocs(); ++s)
    {
        bsp_direct_get(s,array,0,array + s, sizeof(double));
        
        printf("\nThread %d has result: %lf", s, array[s]);
        
       *(a+s-1) = array [s];
      /*  
       printf(" 00000 %f 11111 %f 22222 %f ",*(a + 0),*(a+1),*(a + 2));
    */
        
    }
    
    
    
    free(array);
    bsp_end();
        
}

void spmd1(void)
{

    
    double circ = circumference;
    /*
    printf("\nMachine has %d cores.\n Just created 2 threads\n",bsp_nprocs());
    */
    double a = 0.0;
    
    bsp_begin(1);
    
    bsp_push_reg(&a, sizeof(double));
  
    bsp_sync();
    
    printf("Thread %d starts new BSP run... and circumference is:%f \n",bsp_pid(), circ);
    bsp_init(&spmd2_entry, 0, NULL);
    bsp_sync();
    
    spmd2_p0(&a);
    bsp_sync();
    
    double volumeSphere;
    if(bsp_pid() == 0)
    {
        printf("\nThread %d calculates how many spheres will fit in an 1 m³ cube...\n");
        
        double area;
        
        
        
        
       
        bsp_direct_get(0, &a, 0, &volumeSphere, sizeof(double));
       
        
        
       
        /*TODOOOOOO 
        bsp_direct_get(1, &a, 0, &area, sizeof(double));
        printf("TEMP: %f\n", area);
        */
       
       
        
    }
    
        /*1m³ = 1 000 000 cm³ under the assumption the spheres will fill approx. 60% of the given space there is a volume of 600 000 cm³ to fill*/
        
        
        int volumeFit = 600000 / volumeSphere;
        printf("1m³ will be filled approx. by %d spheres with %.4f 10cm circumference.\n", volumeFit, circumference);
    
    bsp_end();

}
    
int main()
{

    bsp_init(&spmd1, 0, NULL );
    spmd1();

    return EXIT_SUCCESS;
}
