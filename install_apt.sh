#! /bin/bash
#
# install_apt.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#

actualdir=`pwd`

#stáhnout deb
#přidat klíč

# pycharm
sudo add-apt-repository ppa:mystic-mirage/pycharm


# pycharm repo
the_ppa="deb http://archive.getdeb.net/ubuntu trusty-getdeb apps"
if ! grep -q "$the_ppa" "/etc/apt/sources.list" "/etc/apt/sources.list.d/*"; then
    echo "install getdeb repo"
    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
    sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
fi

## Chrome
the_ppa="deb http://dl.google.com/linux/chrome/deb/ stable main"
if ! grep -q  "$the_ppa" "/etc/apt/sources.list" "/etc/apt/sources.list.d/*"; then
    echo "install chrome repo"
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
fi

sudo apt-get update




sudo apt-get install google-chrome-stable


# install everpad
# sudo add-apt-repository ppa:nvbn-rm/ppa
# sudo apt-get update
# sudo apt-get install everpad

## Aplikace

sudo apt-get install nautilus-dropbox
## dropbox 
dropbox start -i


echo "apt-get install ..."
sudo apt-get install git libreoffice libreoffice-l10n-cs nautilus-dropbox imagej git cmake cmake-curses-gui vim vim-gtk vim-dbg i3 mc xfce4-screenshooter exuberant-ctags gitk cups-pdf nautilus keepass2 kupfer vlc imagej 
sudo apt-get install gtk-recordmydesktop runsnakerun ranger w3m w3m-img caca-utils atool highlight mediainfo xpdf arandr g++ libinsighttoolkit4-dev unrar-free p7zip-full numlockx eog sshfs fuse pycharm-community arandr
sudo apt-get install texlive-full texlive-lang-czechslovak setup sshfs
sudo apt.get install keepassx
sudo apt.get install awesome awesome-extra notify-send xautolock i3lock

echo "programming packages"

# apps comments
# eog - image viewer for ranger
# python-argcomplete - completation for bash
# python-ipdb

# install mendeley
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' *mendeley*|grep "install ok installed")
echo Checking for somelib: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "installing mendeley"
  wget http://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
  sudo dpkg -i mendeleydesktop-latest
  rm mendeleydesktop-latest
fi
## mendeley
# cd ~
# mkdir tmp
# cd tmp
# wget http://www.mendeley.com/repositories/ubuntu/stable/i386/mendeleydesktop-latest


## Bash history
# sudo add-apt-repository ppa:ultradvorka/ppa
# sudo apt-get update
# sudo apt-get install hh

# basic vim
sudo apt-get install vim
# install neovim
sudo apt-get install software-properties-common

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# neovim - python modules
sudo apt-get install python-dev python-pip python3-dev python3-pip

# bash interpret 
sudo apt-get install fish




