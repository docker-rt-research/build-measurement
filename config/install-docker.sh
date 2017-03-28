#!/bin/bash
#
# Filename:
# install-docker.sh

echo "Installing docker"
sudo pacman --noconfirm -S docker
sudo systemctl daemon-reload
