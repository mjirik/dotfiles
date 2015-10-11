#! /bin/sh
#
# Install my personalized lubuntu / i3
# Dropbox login
# * gmail login
# * pole login
#
# install.sh
# Copyright (C) 2014 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#
#



# Ubuntu --------- lze kopirovat cele do prikazove radky ------



actualdir=`pwd`

./install_apt.sh
## ipython
./install_misc.sh

source ./install_python.sh
## Klávesnice
./install_keyboard.sh




