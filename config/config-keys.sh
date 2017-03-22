#!/bin/bash
#
# Filename:
# config-keys.sh

echo "Configuring keys and package database"
sudo pacman-key --init
sudo yes | sudo pacman --noconfirm -Sc
sudo yes | sudo pacman --noconfirm -Sy pacman
sudo pacman-db-upgrade
sudo yes | sudo pacman --noconfirm -S archlinux-keyring
sudo pacman-key --init
sudo yes | sudo pacman --noconfirm -Syu
