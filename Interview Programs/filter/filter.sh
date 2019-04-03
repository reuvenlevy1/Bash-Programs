#!/bin/bash

# Displays certain files dependent upon their size by filtering out those less than the average.
# This is done in the following way:
# 1. main() function - Stores names and sizes of files into arrays NAME and SIZE.
# 2. average() function - Calculates average size by dividing total size by number of files.
# 3. filter() function - Displays files with sizes greater than average.
#
# Limitations:
# 1. Delimiter is 1 space & only works w/ sizes in hundreths place.
#
# @author Reuven

filter(){
  TOTAL=0
  echo ""
  echo "FILTERED:"
  for (( k = 0; k < $COUNT; k++ )); do
    if [[ ${SIZE[$k]} -gt $AVG ]]; then	      #Size greater than average size
      echo "${NAME[$k]} (${SIZE[$k]})"
    fi
  done
}

average(){
  AVG=`expr $TOTAL / $COUNT`
  echo ""
  echo "The average file size is ($AVG)"
}

main(){
  TOTAL=0
  COUNT=0                                     #Adds # of files in directory
  echo "UNFILTERED:"
  for i in *; do                              #i is everything in the directory
    let "COUNT += 1"
  done
  for (( j = 0; j < $COUNT; j++ )); do
    NAME=(`ls -l | cut -d ' ' -f 9`)          #() makes an array; Stores name of file (-f 9)
    SIZE=(`ls -l | cut -d ' ' -f 5`)          #Finds data (size) in 5th spot (-f 5) & erases the space (delimiter) & everything before it
    echo "${NAME[$j]} (${SIZE[$j]})"
    let "TOTAL += ${SIZE[$j]}"
  done
  echo ""
  echo "How many files: $COUNT"
  echo "The total size of all files: ($TOTAL)"
  average
  filter
}

main
