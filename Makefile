# vim:set ts=8 sw=8 sts=0 noet:


#    File:         Makefile                                                  */
#    Description:  Makefile for programs running a simple k-means clustering */
#                  algorithm                                                 */
#                                                                            */
#    Author:  K Sujith Bhatt                                                 */
#             Chirag K                                                       */
#             National Institute of Technology Karnataka                     */

# -------------------------------------------------------------------------- */

.KEEP_STATE:

seq: seq 

DFLAGS      =
OPTFLAGS    = -O -NDEBUG
OPTFLAGS    = -g -pg
LDFLAGS     = $(OPTFLAGS)
LIBS        =

CC          = gcc

.c.o:
	$(CC) $(CFLAGS) -c $<

H_FILES     = kmeans.h

#------   sequential version -----------------------------------------
SEQ_SRC     = seq_main.c   \
              seq_kmeans.c \
	          file_io.c    \
	          wtime.c

SEQ_OBJ     = $(SEQ_SRC:%.c=%.o)

$(SEQ_OBJ): $(H_FILES)

seq: seq_main
seq_main: $(SEQ_OBJ) $(H_FILES)
	$(CC) $(LDFLAGS) -o seq_main $(SEQ_OBJ) $(LIBS)

#---------------------------------------------------------------------
clean:
	rm -rf *.o seq_main \
	           core* .make.state gmon.out     \
               *.cluster_centres *.membership \
               Image_data/*.cluster_centres   \
               Image_data/*.membership        \
               profiles/
