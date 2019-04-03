#!/bin/bash

# Creates directories using both depth first search and then breadth first search algorithms
#
# @author Reuven

function breadth(){
local d=$1							#1st argument passed from command line
local b=$2
local seed_d=$3
local open=($seed_d)

for (( i=0; i<d; i++ )); do
	tmp_open=()
	for x in ${open[@]}; do
		tmp=()
		for (( j=0; j<b; j++ )); do
			echo $x/$j
			mkdir -p $x/$j				#creates directory from the current path
			tmp=(${tmp[@]} $x/$j)			#stores everything in tmp followed by new path values
		done
		tmp_open=(${tmp_open[@]} ${tmp[@]})
	done
	open=(${tmp_open[@]})
done
}

function depth(){
local d=$1
local b=$2
local seed_d=$3
local open=($seed_d)

for (( i=0; i<b; i++))
do
	echo ${open[@]}/$i
	mkdir -p ${open[@]}/$i
	if [[ $d -ge 2 ]]
	then
		for (( j=0; j<b; j++))
		do
			echo ${open[@]}/$i/$j
			mkdir -p ${open[@]}/$i/$j
			if [[ $d -ge 3 ]]
			then
				for (( k=0; k<b; k++))
				do
					echo ${open[@]}/$i/$j/$k
					mkdir -p ${open[@]}/$i/$j/$k
					if [[ $d -ge 4 ]]
					then
						for (( l=0; l<b; l++))
						do
							echo ${open[@]}/$i/$j/$k/$l
							mkdir -p ${open[@]}/$i/$j/$k/$l
							if [[ $d -ge 5 ]]
							then
								for (( m=0; m<b; m++))
								do
									echo ${open[@]}/$i/$j/$k/$l/$m
									mkdir -p ${open[@]}/$i/$j/$k/$l/$m
								done
							fi
						done
					fi
				done
			fi
		done
	fi
done
}

#Program execution example: ./create.sh 3 4 . depth --> program ($0), # ($1), # ($2), directory ($3), algorithm
if [ -d $3 ]; then
	if [ "$4" = "depth" ]; then
		depth $1 $2 $3					#calls depth function passing 3 parameters
	elif [ "$4" = "breadth" ]; then
		breadth $1 $2 $3				#calls breadth function passing 3 parameters
	else
		echo "Folder does not exist!"
	fi
fi
