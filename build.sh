#!/bin/bash
# Script to build the raspberry pi 4 image for the final project of the 
# Advanced Embedded Linux Development specialization on coursera

source build-utils.sh

git submodule init
git submodule sync
git submodule update

source poky/oe-init-build-env

add_configuration 'MACHINE = "raspberrypi4-64"'
add_configuration 'LICENSE_FLAGS_ACCEPTED = "synaptics-killswitch"'
add_configuration 'EXTRA_IMAGE_FEATURES += "debug-tweaks ssh-server-openssh"'
add_configuration 'IMAGE_INSTALL:append = " libgpiod libgpiod-dev libgpiod-tools i2c-tools"'
add_configuration 'ENABLE_I2C = "1"'
add_configuration 'KERNEL_MODULE_AUTOLOAD:rpi += "i2c-dev i2c-bcm2708"'

add_layer "meta-openembedded/meta-oe"
add_layer "meta-openembedded/meta-python"
add_layer "meta-openembedded/meta-networking"
add_layer "meta-openembedded/meta-multimedia"
add_layer "meta-raspberrypi"
add_layer "meta-aeld_final_project"

bitbake-layers show-layers

bitbake core-image-aeld
