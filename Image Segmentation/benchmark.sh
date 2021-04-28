#!/bin/bash

# Author: K Sujith Bhatt
#         Chirag K
#         National Institute of Technology Karnataka

set -e

input='test_m.jpg'

mkdir -p profiles

make all

echo "--------------------------------------------------------------------------------"
uptime
echo "--------------------------------------------------------------------------------"

for k in 2 4 8 16 32; do
    serTime=$(./serial.out -k $k imgs/${input} | grep 'Execution' | awk '{print $4}')
    gprof ./serial.out > profiles/ser-profile-$k.txt
    
    ompTime=$(./omp.out -k $k imgs/${input} | grep 'Execution' | awk '{print $4}')
    gprof ./omp.out > profiles/omp-profile-$k.txt
    
    speedup=$(echo "scale=1; ${serTime} / ${ompTime}" | bc)
    echo "k = $(printf "%3d" $k)  serTime = ${serTime}s  ompTime = ${ompTime}s  speedup = ${speedup}x"
done