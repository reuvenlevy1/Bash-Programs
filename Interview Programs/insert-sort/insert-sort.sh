#!/bin/bash

# Takes numbers inserted in any order and sorts them in numerical order.
# This is done in the following way:
# 1. Takes user input and stores into SORT array.
# 2. Compares current value with next and swaps if necessary.
#
# @author Reuven

USER_INPUT=$@                                     #Set parameters to USER_INPUT
length=$#							    					              #Length of parameters
declare -a SORT=(${USER_INPUT[@]})				    		#Add all parameters to SORT array
for (( i = 1; i < $length; i++ )); do
  x="${SORT[$i]}"						    				          #x is the SORT[] values
  y=`expr $i - 1`						    				          #y is the SORT[] index values
  while [[ "$y" -ge 0 ]] && [[ "${SORT[$y]}" -gt "$x" ]]; do	#Checking if values need to be swapped
    SORT[$y+1]="${SORT[$y]}"					    		    #Swapping values
    y=`expr $y - 1`						    				        #Moving SORT[] index value
  done
SORT[$y+1]="$x"						            			      #Move to next SORT[] index value
done
echo ${SORT[@]}
