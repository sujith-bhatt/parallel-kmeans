
/*   File:         image_io.h   (an OpenMP version)                          */
/*   Description:  header file for an image segmentation program             */
/*                                                                           */
/*   Author:  K Sujith Bhatt                                                 */
/*            Chirag K                                                       */
/*            National Institute of Technology Karnataka                     */

/* ------------------------------------------------------------------------- */

#ifndef IMAGE_IO_H
#define IMAGE_IO_H

typedef unsigned char byte_t;

byte_t *img_load(char *img_file, int *width, int *height, int *n_channels);
void img_save(char *img_file, byte_t *data, int width, int height, int n_channels);

#endif
