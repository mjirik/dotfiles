#! /bin/bash
#
# install_apt.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#






actualdir=`pwd`


VERBOSE=false
HELP=false
DRY_RUN=false
STACK_SIZE=0

INSTALL_ALL=true
INSTALL_NORMAL=false
INSTALL_RANGER=ranger

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -h | --help )    HELP=true; shift ;;
    -n | --dry-run ) DRY_RUN=true; shift ;;
    -s | --stack-size ) STACK_SIZE="$2"; shift; shift ;;
    normal ) INSTALL_NORMAL=true; shift ;;
    ranger ) INSTALL_RANGER=true; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

echo VERBOSE=$VERBOSE
echo HELP=$HELP
echo DRY_RUN=$DRY_RUN
echo STACK_SIZE=$STACK_SIZE
# while getopts k:b:c flag; do
#   case $flag in
#     k)
#       echo "-a used: $OPTARG";
#       ;;
#     b)
#       echo "-b used: $OPTARG";
#       ;;
#     c)
#       echo "-c used";
#       ;;
#     ?)
#       exit;
#       ;;
#   esac
# done
#
# shift $(( OPTIND - 1 ));
#


INSTALL_CMD="sudo apt-get --yes --ignore-missing install "

if $INSTALL_NORMAL; then

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




    $INSTALL_CMD google-chrome-stable


    # install everpad
    # sudo add-apt-repository ppa:nvbn-rm/ppa
    # sudo apt-get update
    # sudo apt-get install everpad

    ## Aplikace

    $INSTALL_CMD nautilus-dropbox
    ## dropbox
    dropbox start -i


    echo "apt-get install ..."
    $INSTALL_CMD git libreoffice libreoffice-l10n-cs nautilus-dropbox \
    imagej git cmake cmake-curses-gui vim vim-gtk vim-dbg i3 \
    mc xfce4-screenshooter exuberant-ctags gitk cups-pdf \
    nautilus keepass2 kupfer vlc \
    gtk-recordmydesktop runsnakerun ranger w3m w3m-img \
    caca-utils atool highlight mediainfo xpdf arandr g++ \
    libinsighttoolkit4-dev unrar-free p7zip-full numlockx eog \
    sshfs fuse pycharm-community arandr \
    texlive-full texlive-lang-czechslovak setup sshfs \
    keepassx

    echo "programming packages"

    # apps comments
    # eog - image viewer for ranger
    # python-argcomplete - completation for bash
    # python-ipdb

    # install mendeley
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' *mendeley* | grep "install ok installed")
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
    $INSTALL_CMD install vim
    # install neovim
    $INSTALL_CMD software-properties-common

    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    $INSTALL_CMD neovim

    # neovim - python modules
    $INSTALL_CMD install python-dev python-pip python3-dev python3-pip

    # shell interpret
    $INSTALL_CMD fish
    # this is problematic due to symbol $. It is interpreted by bash first and 
    # there is no fish_user_path environment variable in bash
    if [ -d "~/miniconda/bin" ]; then
        fish -c "set -U fish_user_paths ~/miniconda/bin/ $fish_user_path "
    elif [ -d "~/miniconda2/bin" ]; then
        fish -c "set -U fish_user_paths ~/miniconda2/bin/ $fish_user_path "
    fi


fi

if $INSTALL_RANGER ; then
    $INSTALL_CMD ranger
    # w3m w3m-img caca-utils atool highlight mediainfo xpdf
    # ranger
    rm -rf ~/.config/ranger &>> install_apt.log
    ln -s `pwd`/config/ranger "$HOME/.config/ranger" &> install_apt.log
fi

