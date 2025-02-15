# skip if not interactive
case $- in
*i*) ;;
*) return ;;
esac

# editor
export EDITOR='code --wait'

# history
export HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=${HISTSIZE}

# colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# window
shopt -s checkwinsize

# less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# scripts
[ -d ~/.scripts ] && export PATH="$PATH:$HOME/.scripts"

# prompt
if ! command -v starship &>/dev/null; then
  mkdir -p ~/.starship
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" - -y -b ~/.starship &>/dev/null
  PATH="$PATH:$HOME/.starship"
fi
eval "$(starship init bash)"
if [ ! -f ~/.config/starship.toml ]; then
  curl $REPO/.config/starship.toml -o ~/.config/starship.toml &>/dev/null
fi

# profiles (aliases, completion etc.)
declare -a profiles=(
  ~/.bash_aliases
  /opt/homebrew/etc/profile.d/bash_completion.sh
  /etc/bash_completion.d/git
  /usr/share/bash-completion/completions/git
)
for profile in "${profiles[@]}"; do
  if [ -f $profile ]; then
    . $profile
  fi
done

# mac
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi
if [ -d "$(python3 -m site --user-base)/bin" ]; then
  export PATH="$PATH:$(python3 -m site --user-base)/bin"
fi

# gh
if command -v gh &>/dev/null; then
  eval "$(gh completion -s bash)"
  gh alias import ~/.config/gh/aliases.yml --clobber &>/dev/null
fi

# wsl
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# gpg
export GPG_TTY=$(tty)
