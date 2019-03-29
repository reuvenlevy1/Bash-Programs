#!/bin/sh

#Counts and lists the number of occurrences for files stored in "/bin" directory by first letter.
#
#@Reuven

cd /bin

COUNT=0
for x in {a..z}
do
  for i in *
  do
    if [ "$x" = "${i:0:1}" ]; then
      let "COUNT++"
    fi
  done
  echo "$x ... $COUNT"
  COUNT=0
done
