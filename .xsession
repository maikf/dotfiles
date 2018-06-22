#!/usr/bin/env zsh
export LC_CTYPE=en_US.UTF-8

# enable XCompose
export GTK_IM_MODULE=xim

# export _JAVA_AWT_WM_NONREPARENTING=1

# dump all the cores
ulimit -c unlimited

# 
xset r rate 180 180

# Mac Book Touchpad
xinput set-prop pointer:bcm5974 "libinput Natural Scrolling Enabled" 1
xinput set-prop pointer:bcm5974 "libinput Accel Speed" 1

# do NOT beep
xset -b

# sync all clipboards
autocutsel -s PRIMARY -buttonup -f; autocutsel -buttonup -f

xsettingsd&

urxvtd -f -o -q

nm-applet&

# automatically lock my screen when it blanks
xss-lock i3lock&

touch ~/.please_dont_die
i3

if [[ -f ~/.please_dont_die ]]; then
    urxvt
fi
