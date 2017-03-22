#!/bin/bash
#
# Mount usb

sudo umount /mnt/usb
sudo echo "Mounting USB"
sudo mount /dev/sdb2 /mnt/usb
