#!/bin/bash

verbose='false'

while getopts 'i:v' flag; do
  case "${flag}" in
    i) filename="${OPTARG}" ;;
    v) verbose='true' ;;
    *) echo "Unexpected option ${flag}" && exit 125 ;;
  esac
done

if [[ -z "${filename}" ]]; then
	echo "No file specified"
	exit 125
fi

no_lines=$(wc -l ${filename} | cut -d' ' -f1)

for ((i=1;i<=no_lines;i+=2))
do
	j=$((i+1))
	start=$(sed -n ${i},${i}p ${filename})
	start=${start##*' '}
	end=$(sed -n ${j},${j}p ${filename})
	end=${end##*' '}

	ms=$((1000*1000))
	echo $(((end-start)/(ms*1000)))s
done
