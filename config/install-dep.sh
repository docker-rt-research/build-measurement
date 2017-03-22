#!/bin/bash
#
# Filename:
# install-dep.sh

echo "Installing dependencies"
sudo pacman --noconfirm -S apache-ant jdk8-openjdk boost cmake ffmpeg2.8 freeglut gcc git junit make opencv python2 qt4 qwt5 ccache
