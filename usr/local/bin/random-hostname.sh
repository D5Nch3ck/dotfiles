#!/bin/ksh

local mitcookie=$(/usr/bin/openssl rand -hex 16)
local new_hostname=$(/bin/cat /dev/random | /usr/bin/tr -cd 'a-zA-Z0-9' | /usr/bin/fold -w6 | /usr/bin/head -1)

/bin/hostname -s "$new_hostname"
/usr/bin/sed  -i "1 s/^.*$/127.0.0.1       $new_hostname/g" /etc/hosts
/usr/bin/sed  -i "2 s/^.*$/::1             $new_hostname/g" /etc/hosts
/usr/bin/sed  -i "1 s/^.*$/$new_hostname/g" /etc/myname
/usr/bin/sed  -i "1 s/^.*$/send host-name \"$new_hostname\";/g" /etc/dhclient.conf
/usr/X11R6/bin/xauth add $new_hostname/unix:0  MIT-MAGIC-COOKIE-1 $mitcookie
