#!/bin/bash
#
# Configuration:
# scen4.sh
# docker ArchLinux, CCache=enabled, make -j4
CUR_FOLDER=$(pwd)

$CUR_FOLDER/config/reset.sh
$CUR_FOLDER/config/config-keys.sh
$CUR_FOLDER/config/install-dep.sh
$CUR_FOLDER/config/install-docker.sh

sudo systemctl restart docker.service

rm -rf ~/.cache/*

sudo rm ~/OpenDaVINCI/docker/completeBuild.sh 
sudo cat $CUR_FOLDER/config/completeBuild-j4.sh >> ~/OpenDaVINCI/docker/completeBuild.sh 



echo "Beginning measurement and build"
echo "Start pre cache at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario4.log
cd ~/OpenDaVINCI/docker && sudo make
echo "End pre cache at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario4.log
echo "DONE!"



echo "Beginning measurement and build"
echo "Start post cache at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario4.log
cd ~/OpenDaVINCI/docker && sudo make
echo "End post cahce at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario4.log
echo "DONE!"
