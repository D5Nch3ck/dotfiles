# Editors
#
export GREP_COLOR='30;43'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export TERM="rxvt-256color"
[ -n "$TMUX" ] && export TERM=tmux-256color

# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $HOME/bin
  $HOME/.local/bin
  $path
)

# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
#  Execute terminal for ranger
export TERMCMD="urxvtc"
# Home directory for virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"

# Better font rendering for Java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
