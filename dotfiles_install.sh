#! /bin/sh
#
# dotfiles_install.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#


sudo apt-get install git
cd ~
mkdir projects
cd projecst 
git clone https://github.com/mjirik/dotfiles.git
cd dotfiles
./install.sh
