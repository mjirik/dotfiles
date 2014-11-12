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




## Chrome

#stáhnout deb
#přidat klíč

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get update

sudo apt-get install google-chrome-stable




## Aplikace



sudo apt-get install git  libreoffice libreoffice-l10n-cs nautilus-dropbox imagej git cmake cmake-curses-gui vim vim-gtk vim-dbg python-ipdb i3 mc xfce4-screenshooter exuberant-ctags gitk cups-pdf nautilus keepassx kupfer vlc imagej gtk-recordmydesktop runsnakerun ranger w3m w3m-img caca-utils atool highlight mediainfo xpdf ipython-notebook arandr python-skimage python-pandas g++ texlive-full libinsighttoolkit4-dev python-autopep8 unrar-free p7zip-full numlockx

## mendeley
cd ~
mkdir tmp
cd tmp
# wget http://www.mendeley.com/repositories/ubuntu/stable/i386/mendeleydesktop-latest
wget http://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest

sudo dpkg -i mendeleydesktop-latest

cd ~



## dropbox 
dropbox start

# nastavení rangeru
ranger --copy-config=scope

#zkopirovani  ssh klice z pole
scp mjirik@147.228.240.61:/home/mjirik/ssh/id_rsa ~/.ssh/id_rs

git clone git@github.com:mjirik/vimrc.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/.vimrc ~/


## ipython


# kofigurace

ipython profile create

echo "#odkomentovat řádek"
echo "#c.FileNotebookManager.save_script = False "

vim ~/.config/ipython/profile_default/ipython_notebook_config.py


#

##monitory

#pomoci arandr vytvorit ~/.screenlayout/screen.sh
arandr
#cp ~/Dropbox/applications/screen/run_screen.sh ~/.config/autostart/




## Záložky


read -rsp $' Afetr dropbox sync press enter to continue...\n'

# pole public
cp ~/Dropbox/applications/home/.gtk-bookmarks ~/




# sftp://mjirik@147.228.240.61/mnt/proNAS/korpusy/queetech
# sftp://mjirik@147.228.240.61/mnt/proNAS/public
#  sftp://mjirik@147.228.240.61/home/mjirik

# home orion
# sftp://mjirik@eryx.zcu.cz/afs/zcu.cz/users/m/mjirik
# sftp://eryx.zcu.cz/afs/zcu.cz/users/m/mjirik

#nouzově přes sambu
# smb://147.228.240.61/korpusy

##připojení pomocí ssh
##ssh mjirik@konos-pole2-kky.fav.zcu.cz
##cd /data-kky/

##připojení k poli bez hesla
## je potřeba vytvořit adresář .ssh
## ssh mjirik@147.228.240.61 mkdir -p .ssh

## a zkopírovat do něj můj public klíč
## cat .ssh/id_rsa.pub | ssh mjirik@147.228.240.61 'cat >> .ssh/authorized_keys'


## Klávesnice

sudo cp ~/Dropbox/applications/klavesnice/ubuntu/cz /usr/share/X11/xkb/symbols/cz
sudo cp ~/Dropbox/applications/klavesnice/ubuntu/evdev.xml /usr/share/X11/xkb/rules/evdev.xml

echo “setxkbvariant cz basic0” >> ~/.config/lxsession/Lubuntu/autostart 


# další nastavení jsou patrně zastaralá

# Nastavení rozložení jako výchozí (in lubuntu), ale ve 14.04 mi to nefunguje

sudo vim /etc/default/keyboard
#and set XKBVARIANT to "basic0"

# zkoušim to přidat do vim ~/.config/lxsession/Lubuntu/autostart 
# další možností je ~/.profile


#or sometimes
#Open /etc/default/console-setup and set XKBVARIANT to "basic0"

#ručně
#setxkbmap -layout cz basic0

#Více v Dropbox/application/klavesnice/ubuntu

# --------------------------------------------------------------

# == ostatní software= Nový návod (Lubuntu 2011)
#
# URI zařízení socket://147.228.47.34:9100
#
# Canon imageRunner 2200 Foot...
#
#
# == SSH
#
# potíže s právy ssh klíčů, které jsem zkopíroval pomocí flash disku
# Permissions 0644 for
# '/.ssh/id_rsa' are too
# chmod 600 id_rsa
#
# http://bodhizazen.net/Tutorials/SSH_keys
#
#
# ==tiskárna
#
# Nový návod (Lubuntu 2011)
#
# URI zařízení socket://147.228.47.34:9100
#
# Canon imageRunner 2200 Foot...
#
#
# domácí samsung scx 472x
# http://www.samsung.com/us/support/owners/product/SCX-4729FW/XAA
#
#
#
#
# == Office
# Možná nejsou potřeba
# sudo apt-get install libreoffice
#
# == Zámek sezení
# http://forum.lxde.org/viewtopic.php?f=8&t=31300
#
# = Pracovní nástroje
# == Kopírování .ssh
# public a private klíče
#
# == GIT
# sudo apt-get install git
#
# == CMake
# sudo apt-get install cmake
# sudo apt-get install cmake-curses-gui
#
# == C++ kompiler
# sudo apt-get install g++
#
#
#
# == ITK
#
# Potřebujeme ITK, build musíme udělat se sdílenými knihovnami.
# Není nutné překládat testing a examples. Překlad bude trvat několik hodin
#
# git clone git://itk.org/ITK.git
# git tag
# git checkout v4.0.0
# mkdir builditk
# cd builditk
# cmake -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF ../ITK
# # cmake  -DBUILD_SHARED_LIBS=ON -DITK_WRAP_JAVA=ON -DITK_WRAP_PYTHON=ON ../ITK
# make
# sudo make install
#
#
# == Matlab
# stahnout z pole, rozbalit
# nakopírovat do /usr/local/
#
# == ImageJ
# sudo apt-get install imagej
#
# = Projekty
# == Nastavení systémových proměnných
#
# Přidejte následující řádku do souboru /etc/environment
#
# QDATA_PATH=/home/mjirik/data/
# V případě distribuce Lubuntu toto nastavení nefunguje, řešením je vytvořit soubor ~/.xsessionrc
#
# # ~/.bashrc
# export QDATA_PATH=/home/mjirik/data/
# export QPRJ_QUEETECH=/home/mjirik/projects/queetech
#
# soubor musí mít nastavená spouštěcí práva
#
# chmod 722 .xsessionrc
#
#
# == Jatra
# cd projects/jatra/ivan/IJ_181_ITKbinaryThinningImageFilter
#
#
#
#
# = Mac
#
# sudo port install py27-zmq py27-tornado py27-nose py27-jinja2 py27-ipython
#
# klávesnice
#
# sudo cp ~/Dropbox/applications/klavesnice/mac/Miras.keylayout "/Library/Keyboard Layouts/"
#
