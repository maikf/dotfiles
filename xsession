export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE=xim

ulimit -c unlimited

xset r rate 180 180
xmodmap .Xmodmap
# xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Tap Action" 0 0 0 0 1 2 3
xinput --disable "SynPS/2 Synaptics TouchPad"

# vertical scrolling, emulated via middle click + drag
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
# horizontal scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# acceleration
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Profile" 4
xset mouse 5 1

xset -b
autocutsel -s PRIMARY -buttonup -f

urxvtd -f -o -q
urxvtc

mv i3log i3log.old
echo "Starting at $(date)" > i3log
i3 -V >> i3log

while `urxvt`; do; done;
