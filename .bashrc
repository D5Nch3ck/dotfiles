
# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
#################################################################
export PATH HOME TERM
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GTK_IM_MODULE=xim
export LESSCHARSET=utf-8
export LESS="-R"
export PS1="\w\n\033[0;33m$ \033[0m"
export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# Disable core dumps and bash history
#
ulimit -c 0
unset HISTFILE

#  Execute terminal for ranger
export TERMCMD="urxvtc"
# Home directory for virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
# Better font rendering for Java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#################################################################
eval $(gdircolors -b "$HOME/.config/dir_colours")
#################################################################
alias pkg_add="doas /usr/sbin/pkg_add"
alias reboot="doas /sbin/reboot"
alias q="exit"
alias x="startx"
alias wifi="doas /bin/sh /etc/wiconfig -s iwn0"
alias ix="curl -n -F 'f:1=<-' http://ix.io"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias dir="gls --color=auto"
alias ls="gls -hF --color=auto --group-directories-first"
alias l="la"
alias sl="gls -hF --color=auto --group-directories-first"
alias ll="ls++ --potsf -a"
alias la="gls -a --color=auto --group-directories-first"
alias lsp="ls++"
alias ifconfig='grcc ifconfig'
alias netstat='grcc netstat'
alias traceroute='grcc traceroute'
alias diff='grcc diff'
alias df='grcc df'
alias ping='grcc ping'
alias ps='grcc ps'
alias srm="gshred -uzfv -n"
alias grep="ggrep --color=always"
alias mg="mg -n"
alias pftop="doas /usr/local/sbin/pftop"
alias gcp="rsync --progress"
alias dmesg="colored_dmesg"
alias sshprx="export http_proxy=socks5://127.0.0.1:3333 https_proxy=socks5://127.0.0.1:3333"
alias torprx="export http_proxy=socks5://127.0.0.1:9150 https_proxy=socks5://127.0.0.1:9150"
alias unprx="unset http_proxy https_proxy"
#################################################################
