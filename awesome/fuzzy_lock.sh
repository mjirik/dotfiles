#!/bin/bash

# parse argument
SLEEPTIME=30

if [ -z "$1" ]
then
    echo "no args"
else
    SLEEPTIME=$1
fi

echo SLEEPTIME: $SLEEPTIME


# Take a screenshot
scrot /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x10 /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png

# go sleeep if this is a notebook (if there is a battery)
string=`acpi`
if [[ $string == *"0"* ]]
then
    sleep 30
fi

# Turn the screen off after a delay.
pgrep i3lock && xset dpms force off

