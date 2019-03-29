#!/bin/bash

#Counts and lists the number of occurrences for files stored in "/bin" directory by first letter.
#This is done in the following way:
#1. Stores letters a-z into an array called LETTERS.
#2. Stores a count of first letter occurrences that match the current letter in LETTERS
#into an array called NUMBERS.
#
#@Reuven

cd /bin                                     #Move to folder /bin
COUNT=0
var y;

for x in {a..z}                             #Loop to go from letter a through z
do
  for i in *                  	            #Loop to go through everything in /bin
  do
    LETTERS[$y]=$x		           			#Set array LETTERS[] to variable x  
    
	if [ "${i:0:1}" == "${LETTERS[$y]}" ]   #If the first letter of the file/folder in the /bin directory is the same as the letter of the first for loop
    then
      let "COUNT++"                         #Add 1 to the counter and repeat until there isn't any more commands of the same letter
    fi
  done
  NUMBERS[$z]=$COUNT			    		#Set array NUMBERS[] to the COUNT variable
  echo "${LETTERS[$y]} ... ${NUMBERS[$z]}"
  let "y++" 				    			#This will increment the index instead of replacing the index, meaning it will have more than 1 index.
  let "z++" 				    			#Same as above.
  COUNT=0				    				#Reset COUNT counter
done
