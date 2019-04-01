#!/bin/bash

#Stores the files stored in root directory and reverses the contents and displays them.
#This is done in the following way:
#1. main() function - Stores files from root directory into CONTENTS array.
#2. reverse() function - Stores the contents from the CONTENTS array in decrementing order
#into the REVERSE array and echos the results.
#
#@Reuven

cd /

reverse(){
  local z=0
  while [ $SIZE -ge 0 ]; do          #Is the size of the CONTENTS array greater than or equal to 0
    REVERSE[$z]=${CONTENTS[$SIZE]}
    let "SIZE--"
    let "z++"
  done
  echo "Reversed: ${REVERSE[@]}"     #Prints everything in REVERSE array
}

main(){
  for i in *; do
    CONTENTS[$x]=$i					 #Stores all contents within root directory into CONTENTS array
    let "x++"
  done
  echo "Original: ${CONTENTS[@]}"    #Prints everything in CONTENTS array
  SIZE=${#CONTENTS[@]}
  reverse                            #calls reverse function
}

main                                 #calls main function
