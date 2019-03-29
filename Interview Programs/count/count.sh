#!/bin/bash

#Counts and lists the number of occurrences for files stored in "/bin" directory by first letter.
#This is done in the following way:
#1. Stores letters a-z into an array called LETTERS.
#2. Stores a count of first letter occurrences that match the current letter in LETTERS
#into an array called NUMBERS.
#
#@Reuven

cd /bin
COUNT=0

for x in {a..z}; do                             #Loop a through z
  for i in *; do               	                #Loop everything in /bin directory
    LETTERS[$y]=$x
    
    if [ "${i:0:1}" == "${LETTERS[$y]}" ]; then #If the first letter of the file/folder in the /bin directory matches the letter of the first for loop
      let "COUNT++"
    fi
  done
  NUMBERS[$z]=$COUNT
  echo "${LETTERS[$y]} ... ${NUMBERS[$z]}"
  let "y++"
  let "z++"
  COUNT=0	    				                          #Reset COUNT counter
done
