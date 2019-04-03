#!/bin/sh

# Counts and lists the number of occurrences for files stored in "/bin" directory by first letter.
#
# @author Reuven

cd /bin
COUNT=0

for x in {a..z}; do                           #Loop a through z
  for i in *; do                              #Loop everything in /bin directory
    if [ "${i:0:1}" = "$x" ]; then            #If the first letter of the file/folder in the /bin directory matches the letter of the first for loop
      let "COUNT++"
    fi
  done
  echo "$x ... $COUNT"
  COUNT=0                                 
done
