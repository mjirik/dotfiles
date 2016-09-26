#! /bin/bash
#
# install_awesome.sh
# Copyright (C) 2016 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#

sudo apt-get install awesome awesome-extra xautolock i3lock acpi
# old ubuntu distros 14.04
sudo apt-get install libnotify-bin
# new ubuntu distros 16.04
sudo apt-get install notify-send

# backup config
rm -rf ~/.config/awesome.bck &>> install_awesome.log
mv ~/.config/awesome ~/.config/awesome.bck &>> install_awesome.log
rm -rf ~/.config/awesome &>> install_awesome.log
mkdir ~/.config/ &>> install_awesome.log

# awesome setup
ln -s `pwd`/awesome "$HOME/.config/awesome"
# ln -s $actualdir/awesome/locker.sh ~/.config/awesome
