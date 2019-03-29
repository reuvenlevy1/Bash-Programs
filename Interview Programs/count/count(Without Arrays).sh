#!/bin/sh
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
