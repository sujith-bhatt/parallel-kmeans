#!/bin/bash
# vim:set ts=8 sw=4 sts=4 et:

# Author: K Sujith Bhatt
#         Chirag K
#         National Institute of Technology Karnataka

set -e

input='color17695.bin'
#input='texture17695.bin'

mkdir -p profiles

make seq

echo "--------------------------------------------------------------------------------"
uptime
echo "--------------------------------------------------------------------------------"

# TODO: Add quotes around ${input} so that spaces in the filename don't break things

for k in 2 4 8 16 32 64 128 256; do
    seqTime=$(./seq_main -o -n $k -b -i Image_data/${input} | grep 'Computation' | awk '{print $4}')
    gprof ./seq_main > profiles/seq-profile-$k.txt
    mv Image_data/${input}.cluster_centres Image_data/${input}-$k.cluster_centres
    mv Image_data/${input}.membership Image_data/${input}-$k.membership

    echo "k = $(printf "%3d" $k)  seqTime = ${seqTime}s"
done