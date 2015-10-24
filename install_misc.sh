#! /bin/sh
#
# install_misc.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#



#zkopirovani  ssh klice z pole
scp mjirik@147.228.240.61:/home/mjirik/ssh/id_rsa ~/.ssh/id_rsa
# TODO pridat sem kopirovani pypirc
scp mjirik@147.228.47.162:/home/mjirik/.pypirc ~/.pypirc

# this repository setup
git remote set-url origin git@github.com:mjirik/dotfiles.git

# git global setup
git config --global user.email "miroslav.jirik@gmail.com"
git config --global user.name "Miroslav Jirik"
# mozna casem nebude nasledujici radek potreba
git config --global push.default simple


# bash history
hh --show-configuration >> ~/.bashrc

# nastavení rangeru
ranger --copy-config=scope


git clone git@github.com:mjirik/vimrc.git ~/.vim
rm ~/.vimrc
ln -s ~/.vim/.vimrc ~/

# awesome setup
rm -rf ~/.config/awesome
mkdir ~/.config/awesome
ln -s $actualdir/awesome/rc.lua ~/.config/awesome


##monitory

#pomoci arandr vytvorit ~/.screenlayout/screen.sh
echo "save screen layout to ~/.screenlayout/screen.sh"
read -p "Press [Enter] key to start arandr"
arandr
#cp ~/Dropbox/applications/screen/run_screen.sh ~/.config/autostart/

echo ./.screenlayout/screen.sh >> ~/.config/lxsession/Lubuntu/autostart 


## Záložky

# old 
rm ~/.gtk-bookmarks
ln -s $actualdir/.gtk-bookmarks ~/
# new
rm ~/.config/gtk-3.0/bookmarks
ln -s $actualdir/.gtk-bookmarks ~/.config/gtk-3.0/bookmarks

read -p "Afetr dropbox sync press enter to continue..."

# pole public
# cp ~/Dropbox/applications/home/.gtk-bookmarks ~/



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
