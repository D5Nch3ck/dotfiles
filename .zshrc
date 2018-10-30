# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#stty -ixon
#
# Source Prezto.
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# Disable flow control and core dumps
#
setopt noflowcontrol
ulimit -c 0
#
# Use better constrasting dir colours
#

if [[ -f "$HOME/.config/dir_colours" ]]; then
  eval $(gdircolors -b "$HOME/.config/dir_colours")
fi

export LC_ALL=en_US.UTF-8
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export RXVT_SOCKET='/tmp/urxvt-socket'
export HISTFILE="/tmp/.zhistory"
#source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/share/GNUstep/Makefiles/GNUstep.sh
source /home/$USER/.git-prompt.sh

#
# Personalised key bindings
#

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins 'jj' vi-cmd-mode

(( $+ZSH_HIGHLIGHT_STYLES )) || declare -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]=underline
