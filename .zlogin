#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Create a single ssh-agent process on login
if (( $+commands[keychain] )); then
  eval $(keychain --quick --gpg2 --dir $TMPDIR --nolock --agents ssh,gpg,gpg --eval git_rsa 0xCE8D015B2F961358 0xriseup)
fi


