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
    bsp_begin(2); //Generate 2 Threads
    double local = 0.0f;//local memory
    
    /*calculates radius of the sphere*/
    if(bsp_pid() == 1)//Thread 1 Calculates the Sphere volume
    {
        printf("WRITE VOLUME...\n");
        
        local = (4/3) * _PI * (rad*rad*rad);
        printf("Thread %d has contribition %lf.\n", bsp_pid(), local);
        bsp_push_reg(&local, sizeof (double) ); // Registers memory location for communication
    }    
    else
    {
        printf("WRITE AREA \n");
        
        local = 4 * _PI * (rad * rad);
        printf("Thead %d has contribition %lf.\n", bsp_pid(), local);
        bsp_push_reg(&local, sizeof (double) );
    }
    
    bsp_sync();//signals the end of an Superstep and starts global communication
    bsp_end();//ends the called thread by bsp_begin()
}

void spmd2_p0(double * const a)
{
    bsp_begin(3);//starting new Superstep with all 3 Threads
    double *array = malloc (3 * sizeof(double) ); 
    bsp_push_reg(array, bsp_nprocs() * sizeof(double) );// Registers memory location for communication
    bsp_sync();
    
    /*write Data of Threads in array*/
    for(unsigned int s = 0; s < bsp_nprocs(); ++s)
    {
        bsp_direct_get(s,array,0,array + s, sizeof(double));
        
        printf("Thread %d has result: %lf\n", s, array[s]);
        
       *(a+s-1) = array [s]; 
   }
    
    free(array);
    bsp_end();
        
}

void spmd1(void)
{

    
    double circ = circumference;
    
    double a = 0.0;
    
    bsp_begin(1);//Creates Thread 0
    
    bsp_push_reg(&a, sizeof(double));// Registers memory location for communication
  
  //  bsp_sync();
    
    printf("Thread %d starts new BSP run...\n and circumference is:%f \n",bsp_pid(), circ);
    bsp_init(&spmd2_entry, 0, NULL);//prepares Entrypoint for spmd2
   
    
    spmd2_p0(&a);//executes spmd2
    bsp_sync();
    
    double volumeSphere;
    if(bsp_pid() == 0){
    
        printf("\nThread 0 calculates how many spheres will fit in an 1 m³ cube...\n");                 
        bsp_direct_get(0, &a, 0, &volumeSphere, sizeof(double));}//get data from thread 1     
    
        /*1m³ = 1 000 000 cm³ under the assumption the spheres will fill approx. 60% of the given space there is a volume of 600 000 cm³ to fill*/
        /*Thread 0 calculates how many Spheres will fit in a 1m³ sqaure*/
        int volumeFit = 600000 / volumeSphere;
        printf("1m³ will be filled approx. by %d spheres with %.4f cm circumference.\n", volumeFit, circumference);
    
    bsp_end();

}
    
int main()
{

    bsp_init(&spmd1, 0, NULL );
    spmd1();

    return EXIT_SUCCESS;
}
