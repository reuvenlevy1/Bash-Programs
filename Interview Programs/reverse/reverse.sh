#!/bin/bash
cd /                                #Change directory to /

reverse(){
  local z=0                         #Variable z onlye works for inside the reverse function
  while [ $SIZE -ge 0 ]             #Is the size of the CONTENTS array greater than or equal to 0
  do
    REVERSE[$z]=${CONTENTS[$SIZE]}
    let "SIZE--"
    let "z++"
  done
  echo "Reversed: ${REVERSE[@]}"              #Prints everything in REVERSE array
}

main(){
  for i in *                        #the i variable is everything in the current directory (wildcard)
  do
    CONTENTS[$x]=$i
    let "x++"
  done
  echo "Origial: ${CONTENTS[@]}"
  SIZE=${#CONTENTS[@]}
  reverse                            #calls reverse function
}

main                                 #calls main function
