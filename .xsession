export ENV=$HOME/.kshrc
export GTK_USE_XFT=1
export QT_XFT=true
export GTK_IM_MODULE=xim
export GDK_SCALE=1.5
export QT_SCALE_FACTOR=1.5
export MOZ_DISABLE_PANGO=1
export VDPAU_DRIVER=i965
export LIBVA_DRIVER_NAME=vdpau
export RXVT_SOCKET='/tmp/urxvt-socket'
export LANG=en_US.UTF-8
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERMCMD=urxvtc

if [[ -x $(command -v urxvtd) ]];then
	urxvtd -q -o -f &
fi

# Disable core dumps
#
ulimit -c 0

# load .Xresources
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

xset fp default
[[ -d /usr/local/share/fonts/inconsolata ]] && xset +fp /usr/local/share/fonts/inconsolata
[[ -d /usr/local/share/fonts/terminus ]] && xset +fp /usr/local/share/fonts/terminus
[[ -d /usr/local/share/fonts/spleen ]] && xset +fp  /usr/local/share/fonts/spleen
xset fp rehash

$HOME/bin/new_mail_sound.sh &
$HOME/bin/multiple-tmux &
$HOME/bin/dzen-start &

xsetroot -solid black &
xset -dpms
xset s off
xset -b #Bell off
# increase mouse acceleration
xset m 3
xset r rate 350 45

# use caps lock as ctrl key
setxkbmap -option ctrl:nocaps

# set background
#sh $HOME/.fehbg

#xidle -program '/usr/X11R6/bin/xlock' -timeout 60 &
#xconsole -geometry -891+730 &
exec cwm
