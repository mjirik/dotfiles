#! /bin/bash
#
# install_apt.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#
# To add new package you have to edit head-packages

# ================head===================

INSTALL_CMD="sudo apt-get --yes --ignore-missing install "
DOWNLOAD_DIR="~/Stažené/"

actualdir=`pwd`
NARGS=$#


VERBOSE=false
HELP=false
DRY_RUN=false
FORCE=false
# STACK_SIZE=0

# -----------head-packages--------
INSTALL_NORMAL=false
INSTALL_RANGER=false
INSTALL_FISH=false
INSTALL_AWESOME=false
INSTALL_ALL=false
INSTALL_BIN=false
INSTALL_MENDELEY=false

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -h | --help )    HELP=true; shift ;;
    -n | --dry-run ) DRY_RUN=true; shift ;;
    -f | --force )   FORCE=true; shift ;;
    # -s | --stack-size ) STACK_SIZE="$2"; shift; shift ;;
    normal ) INSTALL_NORMAL=true; shift ;;
    ranger ) INSTALL_RANGER=true; shift ;;
    fish ) INSTALL_FISH=true; shift ;;
    awesome ) INSTALL_AWESOME=true; shift ;;
    bin ) INSTALL_BIN=true; shift ;;
    mendeley ) INSTALL_MENDELEY=true; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done


if [[ $NARGS -eq 0 ]] ; then
    INSTALL_ALL=true
fi

if $VERBOSE ; then
    echo NARGS=$NARGS
    echo VERBOSE=$VERBOSE
    echo HELP=$HELP
    echo FORCE=$FORCE
    echo DRY_RUN=$DRY_RUN
    echo INSTALL_AWESOME=$INSTALL_AWESOME
    echo INSTALL_NORMAL=$INSTALL_NORMAL
    echo INSTALL_RANGER=$INSTALL_RANGER
    echo INSTALL_FISH=$INSTALL_FISH
    echo INSTALL_ALL=$INSTALL_ALL
    echo INSTALL_BIN=$INSTALL_BIN
    echo INSTALL_MENDELEY=$INSTALL_MENDELEY
fi


# ---------------body---------------

if $HELP ; then
    echo ""
    echo "install_apt [params][package]"
    echo ""
    echo "Parameters"
    echo "-h help"
    echo "-v verbose"
    echo "-n dry run"
    echo "-f force install some packages (like mendeley)"
    echo ""
    exit
fi


if $INSTALL_BIN || $INSTALL_ALL ; then
    rm -rf ~/bin &>> install_apt.log
    ln -s `pwd`/bin "$HOME/bin" &> install_apt.log
fi

if $INSTALL_NORMAL || $INSTALL_ALL ; then
    echo "installing normal..."

    #stáhnout deb
    #přidat klíč
    # pycharm
    sudo add-apt-repository ppa:mystic-mirage/pycharm


    # pycharm repo
    # to obtain ubuntu version use:
    # lsb_release -sc
    the_ppa="deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps"
    # for trusty it is going to be
    # the_ppa="deb http://archive.getdeb.net/ubuntu trusty-getdeb apps"
    if ! grep -q "$the_ppa" "/etc/apt/sources.list" "/etc/apt/sources.list.d/*"; then
        echo "install getdeb repo"
        wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
        sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
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
    sshfs fuse snapd arandr \
    texlive-full texlive-lang-czechslovak setup sshfs \
    keepassx
    # pycharm-community
    echo "snap install ..."
    sudo snap install pycharm-community --classic

    echo "programming packages"

    # apps comments
    # eog - image viewer for ranger
    # python-argcomplete - completation for bash
    # python-ipdb

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

fi

if $INSTALL_AWESOME || $INSTALL_ALL ; then
    ./install_awesome.sh
fi

if $INSTALL_RANGER || $INSTALL_ALL ; then
    $INSTALL_CMD ranger
    # w3m w3m-img caca-utils atool highlight mediainfo xpdf
    # ranger
    rm -rf ~/.config/ranger &>> install_apt.log
    ln -s `pwd`/config/ranger "$HOME/.config/ranger" &> install_apt.log
fi

if $INSTALL_FISH || $INSTALL_ALL ; then
    echo "Installing fish..."
    sudo add-apt-repository ppa:fish-shell/release-2
    sudo apt-get update
    # shell interpret
    $INSTALL_CMD fish
    # this is problematic due to symbol $. It is interpreted by bash first and 
    # there is no fish_user_path environment variable in bash
    if hash conda 2>/dev/null; then
        echo "Command 'conda' works fine. No need to add to paths."
    else
        if [ -d "$HOME/miniconda/bin/" ]; then
            echo "miniconda found"
            fish -c "set -U fish_user_paths ~/miniconda/bin/ \$fish_user_paths "
        elif [ -d "$HOME/miniconda2/bin/" ]; then
            echo "miniconda2 found"
            fish -c "set -U fish_user_paths ~/miniconda2/bin/ \$fish_user_paths "
        fi
    fi
    fish -c "set -U fish_user_paths ~/bin/ \$fish_user_paths "
fi


if $INSTALL_MENDELEY || $INSTALL_ALL ; then
    # install mendeley
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' *mendeley* | grep "install ok installed")
    # echo Checking for somelib: $PKG_OK
    if [ "" == "$PKG_OK" ] || $FORCE ; then
    echo "Fetching mendeley"
    wget http://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
    echo "installing the mendeley .deb file"
    sudo dpkg -i mendeleydesktop-latest
    rm mendeleydesktop-latest
    else
        echo "Stopping process. Mendeley is installed. Use -f for force install."
    fi
fi

