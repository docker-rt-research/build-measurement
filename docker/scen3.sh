#!/bin/bash
#
# Configuration:
# scen3.sh
# docker ArchLinux, CCache=disabled, make -j4
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
echo "Start build 1 at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario1.log
cd ~/OpenDaVINCI/docker && sudo make
echo "End build 1 at $(date +%s%N)" >> $CUR_FOLDER/measurements/docker-scenario1.log
echo "DONE!"
