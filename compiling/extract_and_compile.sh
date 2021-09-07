#!/bin/bash

tar -zxf NthPrime.tgz #unzip and extract all in one
cd NthPrime || exit #mostly to satisfy shellcheck since we know it'll exist since we just made it
gcc *.c *.h  -o NthPrime #compiles all of the files together into something named NthPrime.
./NthPrime "$1" #quotes are mostly to satisfy shellcheck since we know arguments will be safe 
