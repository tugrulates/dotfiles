# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc  1>/dev/null 2>/dev/null
fi
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(deno gh git gitignore macos python)
    ZSH_THEME="agnoster"
    ENABLE_CORRECTION="true"
    DEFAULT_USER="tugrul"
    source $ZSH/oh-my-zsh.sh
fi

# aliases
alias l='ls -la'
alias x='xargs -I{}'

# editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='code --wait'
fi

# mac
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
