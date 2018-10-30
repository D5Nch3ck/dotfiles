# Defines environment variables.
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export XAUTHORITY=/tmp/.Xauthority
#export AUTOCONF_VERSION=2.69 AUTOMAKE_VERSION=1.11
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PKG_CACHE="/var/db/Packages/snapshots/amd64/" #  mkdir -p $PKG_CACHE
# for GTK styles in Qt
#export GTK2_RC_FILES=$HOME/.gtkrc-2.0
#export GTK_PATH=:/usr/local/lib/gtk-2.0
# hacks to respect XDG_CACHE_HOME
#export CCACHE_DIR="$HOME/.ccache"
#export CCACHE_PATH="/usr/bin/:/usr/local/bin"
#export CCACHE_TEMPDIR="$HOME/.ccache"
export USE_CCACHE=1
export GOPATH="$HOME/code/gopath"
export PYTHONSTARTUP="$HOME/.pythonrc"
export MOZ_DISABLE_PANGO=1
export PYTHONDOCS="/usr/local/share/doc/python2.7/html"
export PROJECT_HOME="$HOME/code/python"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3.6"

alias sudo='sudo '
alias ifconfig='grcc ifconfig'
alias netstat='grcc netstat'
alias traceroute='grcc traceroute'
alias diff='grcc diff'
alias df='grcc df'
alias ping='grcc ping'
alias ps='grcc ps'
alias mount='grcc mount'
alias dig='grcc dig'
alias hcat='highlight -O ansi --force'
alias x="startx"
alias sshprx="export http_proxy=socks5://127.0.0.1:3333 https_proxy=socks5://127.0.0.1:3333"
alias torprx="export http_proxy=socks5://127.0.0.1:9150 https_proxy=socks5://127.0.0.1:9150"
alias unprx="unset http_proxy https_proxy"
alias srm="gshred -uzfv --random-source=/dev/random -n"
alias q="exit"
alias yt="youtube-viewer"
alias grep="ggrep --color=always"
alias ix="curl -n -F 'f:1=<-' http://ix.io"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ls="gls -hF --color=auto --group-directories-first"
alias l="la"
alias sl="gls -hF --color=auto --group-directories-first"
alias ll="ls++ --potsf -a"
alias la="gls -a --color=auto --group-directories-first"
alias lsp="ls++"
alias -g L='| less'
alias -g G='| grep'
alias ytdown="youtube-dl"
alias qe="qemu-system-x86_64 -enable-kvm"
alias envpy3="workon python3"
alias make="nice -19 make"
alias gmake="nice -19 gmake"
alias du="du -hs"
alias gdb="gdb -n"
alias gpg="gpg2"
alias gdd="gdd status=progress"
alias init-tor="proxychains -q w3m http://kpvz7ki2v5agwt35.onion -no-cookie -graph -N"
alias attacks1="luakit http://map.norsecorp.com/"
alias attacks2="luakit http://www.digitalattackmap.com/"
alias sha256control="sha256 -c  < ~/code/systemsums.txt |grep FAILED"
alias -g ./configure="grcc ./configure"
alias make="grcc make"
alias gmake="grcc gmake"
alias vime='vim -u $HOME/.vimencrypt -x'
alias gvime='gvim -u $HOME/.vimencrypt -x'
alias nmap='grcc nmap'
alias du='grcc du'
alias wifi='doas /usr/local/bin/wifi-menu iwn0'
alias dmesg='colored_dmesg'
alias w='/usr/local/bin/grcc w'
alias reboot='doas /sbin/reboot'
alias pkg_add='doas /usr/sbin/pkg_add'
alias rcp='rsync --progress'
alias ytmp3='youtube-dl -x --audio-format mp3'
alias disks=' echo "╓───── d i s k . u s a g e"; echo "╙──────────────────────────────────────────────────── ─ ─ "; df -h;'
alias wget='wget -o $TMPDIR/wget-log.txt --hsts-file=$TMPDIR/wget-hist.txt -c'

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
