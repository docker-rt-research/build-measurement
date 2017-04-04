#!/bin/bash
#
# files: master.sh
# Master supervisor, responsible for spawning scenarios.
#


#!/bin/bash

CUR_FOLDER=$(pwd)
verbose='false'

pacman -Qi linux >> $CUR_FOLDER/measurements/kernel.info

while getopts 'f:n:v' flag; do
  case "${flag}" in
    f) files="${OPTARG}" ;;
    n) iterations="${OPTARG}" ;;
    v) verbose='true' ;;
    *) echo "Unexpected option ${flag}" && exit 125 ;;
  esac
done

if [[ -z "${files}" ]]; then
	echo "No file sequence specified. -f flag required."
	exit 125
fi


if [[ -z "${iterations}" ]]; then
	echo "No iterations specified. -n flag required."
	exit 125
fi


for ((i=1;i<=files;i++))
do
	for ((j=1;j<=iterations;j++))
	do
		sh $CUR_FOLDER/native/scen$i.sh	> $CUR_FOLDER/logs/scen-native-$i-$j.log
		sh $CUR_FOLDER/docker/scen$i.sh	> $CUR_FOLDER/logs/scen-docker-$i-$j.log
	done
done

