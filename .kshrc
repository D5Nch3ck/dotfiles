# $OpenBSD: ksh.kshrc,v 1.32 2018/05/16 14:01:41 mpf Exp $
#
# sh/ksh initialization
PATH=$HOME/bin:$HOME/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
#################################################################
bind -m '^L'=clear'^J'
#################################################################
[ -n "$TMUX" ] && export TERM=tmux-256color

# Disable core dumps
#
ulimit -c 0
#################################################################
#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

if [[ -f "$HOME/.config/dir_colours" ]]; then
  eval $(gdircolors -b "$HOME/.config/dir_colours")
fi
#################################################################
export PATH HOME TERM
export HISTFILE=$TMPDIR/.ksh_history
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export GREP_COLOR='30;43'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GTK_USE_XFT=1
export QT_XFT=true
export GTK_IM_MODULE=xim
export LESSCHARSET=utf-8
export PS1="\w\n\033[0;33m$ \033[0m"
export LESS='-F -g -i -M -R -S -w -X -z-4'
export USE_CCACHE=1
export GOPATH="$HOME/code/gopath"
export PYTHONSTARTUP="$HOME/.pythonrc"
export MOZ_DISABLE_PANGO=1
export PYTHONDOCS="/usr/local/share/doc/python2.7/html"
export PROJECT_HOME="$HOME/code/python"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3.6"
export PKG_CACHE="/var/db/Packages/snapshots/`arch -s`/" #  mkdir -p $PKG_CACHE
# Home directory for virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
# color man-pages persistently
export PAGER='most'
#######################################
. $HOME/.kshrc.alias

if [ -f $TMPDIR/keychain-ssh_agent ];then
. $TMPDIR/keychain-ssh_agent
fi
