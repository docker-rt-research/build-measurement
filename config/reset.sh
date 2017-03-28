#!/bin/bash
#
# Filename:
# reset.sh

echo "Resetting"
sudo systemctl restart docker.service && sudo docker rmi $(sudo docker images -q) && systemctl stop docker.service
sudo rm -rf ~/install_od
sudo pacman --noconfirm -Rsc apache-ant jdk8-openjdk boost cmake ffmpeg2.8 freeglut gcc git junit make opencv python2 qt4 qwt5 ccache docker

sudo systemctl daemon-reload

sudo rm -rf ~/OpenDaVINCI
echo "Copying OpenDaVINCI"
sudo cp -Rap /root/OpenDaVINCI ~/OpenDaVINCI
mkdir -p ~/install_od
mkdir ~/install_od/ccache
