#!/bin/sh

boxes="$HOME/.mutt/maildir"
new_mail=false
first_check=true

while true; do
		if $first_check;then
			new=`find ${boxes}/*/inbox/new/ -type f -print | wc -l`
		else
			new=`find ${boxes}/*/inbox/new/ -type f -cmin -1 -print | wc -l`
		fi

		if [ $new -gt 0 ];then
			new_mail=true
		fi
if $new_mail;then
	aucat -i $HOME/.mutt/beep.wav
fi

new_mail=false
first_check=false
sleep 60
done
