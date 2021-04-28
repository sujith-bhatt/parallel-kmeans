
#    File:         Makefile                                                  */
#    Description:  Makefile for programs running image segmentation using    */
#                  k-means clustering algorithm                              */
#                                                                            */
#    Author:  K Sujith Bhatt                                                 */
#             Chirag K                                                       */
#             National Institute of Technology Karnataka                     */

# -------------------------------------------------------------------------- */

CC = gcc
CC_FLAGS = -Wall
CC_OMP = -fopenmp
# Be careful and check the compiler in use. Here gcc is being used. Flags for gcc and icc differ
# for example: compile flag for openmp in gcc is -fopenmp while it is -openmp in icc 

all: serial.out omp.out

#-------- Sequential version -----------------------------------------

serial.out: src/main_serial.c src/image_io.h src/image_io.c src/segmentation.h src/segmentation_serial.c
	$(CC) $(CC_FLAGS) -o serial.out src/main_serial.c src/image_io.c src/segmentation_serial.c -lm

#-------- OpenMP version -----------------------------------------
omp.out: src/main_omp.c src/image_io.h src/image_io.c src/segmentation.h src/segmentation_omp.c
	$(CC) $(CC_FLAGS) $(CC_OMP) -o omp.out src/main_omp.c src/image_io.c src/segmentation_omp.c -lm

#---------------------------------------------------------------------
clean:
	rm -rf serial.out omp.out *.jpg