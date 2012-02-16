export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE=xim

ulimit -c unlimited

xset r rate 180 180
xmodmap .Xmodmap
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Tap Action" 0 0 0 0 1 2 3
xset -b
autocutsel -s PRIMARY -buttonup -f

urxvtd -f -o -q
urxvtc

mv i3log i3log.old
echo "Starting at $(date)" > i3log
i3 -V >> i3log

while `urxvt`; do; done;
