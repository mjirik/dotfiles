#! /bin/sh
#
# install_keyboard.sh
# Copyright (C) 2015 mjirik <mjirik@mjirik-Latitude-E6520>
#
# Distributed under terms of the MIT license.
#

actualdir=`pwd`

# klavesnice Microsoft Ergo

# sudo cp Dropbox/applications/klavesnice/ms-ergo/98-ms-ergo.rules /etc/udev/rules.d/98-ms-ergo.rules

sudo cp $actualdir/61-keyboard-local.hwdb /etc/udev/hwdb.d/61-keyboard-local.hwdb
sudo udevadm hwdb --update
sudo udevadm control --reload

# Rozložení

sudo cp $actualdir/keyboard/cz /usr/share/X11/xkb/symbols/cz
sudo cp $actualdir/keyboard/evdev.xml /usr/share/X11/xkb/rules/evdev.xml

# sudo cp ~/Dropbox/applications/klavesnice/ubuntu/cz /usr/share/X11/xkb/symbols/cz
# sudo cp ~/Dropbox/applications/klavesnice/ubuntu/evdev.xml /usr/share/X11/xkb/rules/evdev.xml

echo setxkbvariant cz basic0 >> ~/.config/lxsession/Lubuntu/autostart 


# další nastavení jsou patrně zastaralá

# Nastavení rozložení jako výchozí (in lubuntu), ale ve 14.04 mi to nefunguje

echo "Dalsi nastaveni jsou patrne zastarala"
echo "set XKBVARIANT to basic0 - nefunguje ve 14.04"
read -n 1 -s
sudo vim /etc/default/keyboard
#and set XKBVARIANT to "basic0"

    # zkoušim to přidat do vim ~/.config/lxsession/Lubuntu/autostart 
# další možností je ~/.profile
#or sometimes
#Open /etc/default/console-setup and set XKBVARIANT to "basic0"

#ručně
#setxkbmap -layout cz basic0

#Více v Dropbox/application/klavesnice/ubuntu
