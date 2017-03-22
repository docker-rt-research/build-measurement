#!/bin/bash
#
# Configuration:
# scen3.sh
# native ArchLinux, CCache=disabled, make -j4
CUR_FOLDER=$(pwd)

$CUR_FOLDER/config/reset.sh
$CUR_FOLDER/config/config-keys.sh
$CUR_FOLDER/config/install-dep.sh


#export PATH=/usr/lib/ccache:$PATH
#export CCACHE_DIR=~/ccache
#export CC="ccache gcc" CXX="ccache g++"

cd ~/OpenDaVINCI && mkdir build
cd build && cmake -D CMAKE_INSTALL_PREFIX=~/install_od ..

echo "Beginning measurement and build"
echo "Start build 1 at $(date +%s%N)" >> $CUR_FOLDER/measurements/scenario3.log
cd ~/OpenDaVINCI/build && make -j4
echo "End build 1 at $(date +%s%N)" >> $CUR_FOLDER/measurements/scenario3.log
echo "DONE!"
