# load .Xresources
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

xset fp default
[[ -d /usr/local/share/fonts/inconsolata ]] && xset +fp /usr/local/share/fonts/inconsolata
[[ -d /usr/local/share/fonts/terminus ]] && xset +fp /usr/local/share/fonts/terminus
[[ -d /usr/local/share/fonts/mensch ]] && xset +fp /usr/local/share/fonts/mensch
xset fp rehash

#urxvtd -q -o -f &
$HOME/bin/new_mail_sound.sh &
$HOME/bin/multiple-tmux &
$HOME/bin/dzen-start &

xsetroot -solid black &
xset -dpms
xset s off

# increase mouse acceleration
xset m 3
xset r rate 300 45

# set background
sh $HOME/.fehbg

#xidle -program '/usr/X11R6/bin/xlock' -timeout 60 &
#xconsole -geometry -891+730 &
exec cwm
