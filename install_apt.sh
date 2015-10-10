#! /bin/sh
#
# install_apt.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#


#stáhnout deb
#přidat klíč
echo "install chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update

sudo apt-get install google-chrome-stable


# install everpad
# sudo add-apt-repository ppa:nvbn-rm/ppa
# sudo apt-get update
# sudo apt-get install everpad

## Aplikace

sudo apt-get install nautilus-dropbox
## dropbox 
dropbox start

echo "apt-get install ..."
sudo apt-get install git  libreoffice libreoffice-l10n-cs nautilus-dropbox imagej git cmake cmake-curses-gui vim vim-gtk vim-dbg python-ipdb i3 mc xfce4-screenshooter exuberant-ctags gitk cups-pdf nautilus keepass2 kupfer vlc imagej gtk-recordmydesktop runsnakerun ranger w3m w3m-img caca-utils atool highlight mediainfo xpdf arandr g++ texlive-full libinsighttoolkit4-dev unrar-free p7zip-full numlockx eog python-argcomplete sshfs fuse awesome awesome-extra

echo "programming packages"

# apps comments
# eog - image viewer for ranger
# python-argcomplete - completation for bash

echo "installing mendeley"
## mendeley
# cd ~
# mkdir tmp
# cd tmp
# wget http://www.mendeley.com/repositories/ubuntu/stable/i386/mendeleydesktop-latest
wget http://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
sudo dpkg -i mendeleydesktop-latest
rm mendeleydesktop-latest


## Bash history
sudo add-apt-repository ppa:ultradvorka/ppa
sudo apt-get update
sudo apt-get install hh