# aliases
alias h='history | sed "s/^ *[0-9][0-9]* *//" | grep'
alias l='ls -la'
alias x='xargs -I{}'

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

# prompt
if ! command -v starship &>/dev/null; then
    mkdir -p ~/.starship
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" - -y -b ~/.starship &>/dev/null
fi
eval "$(starship init bash)"
if [ ! -f ~/.config/starship.toml ]; then
    curl $REPO/.config/starship.toml -o ~/.config/starship.toml &>/dev/null
fi

# profiles (aliases, completion etc.)
declare -a profiles=(
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
export BASH_SILENCE_DEPRECATION_WARNING=1

# gh
if command -v gh &>/dev/null; then
    eval "$(gh completion -s bash)"
fi
