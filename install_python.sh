#! /bin/sh
#
# install_python.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#


wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh -b
rm Miniconda-latest-Linux-x86_64.sh

cd ~
HOMEDIR="`pwd`"
echo "export PATH=$HOMEDIR/miniconda/bin:\$PATH" >> ~/.bashrc
export PATH=$HOMEDIR/miniconda/bin:$PATH

conda install ipython-notebook

## ipython


# kofigurace

ipython profile create

echo "#odkomentovat řádek"
echo "#c.FileNotebookManager.save_script = False "
echo "zda se ze v novych verzich to nefunguje"
# read -n 1 -s
read -p "Press [Enter] key to start editor"


vim ~/.ipython/profile_default/ipython_notebook_config.py
# old path
# vim ~/.config/ipython/profile_default/ipython_notebook_config.py

# vimception
git clone git@github.com:ivanov/ipython-vimception.git  ~/.config/ipython/extensions/vimception
#
