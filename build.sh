#!/bin/bash
# Script to build the raspberry pi 4 image for the final project of the 
# Advanced Embedded Linux Development specialization on coursera

source build-utils.sh

git submodule init
git submodule sync
git submodule update

source poky/oe-init-build-env

add_configuration 'MACHINE = "raspberrypi4"'

add_layer "meta-raspberrypi"
