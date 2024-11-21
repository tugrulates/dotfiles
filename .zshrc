REPO=https://raw.githubusercontent.com/tugrulates/dotfiles/refs/heads/main

# mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  plugins+=(macos)
  if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  if [ -d "$(python3 -m site --user-base)/bin" ]; then
    export PATH="$PATH:$(python3 -m site --user-base)/bin"
  fi
fi

# starship
if ! command -v starship &>/dev/null; then
  mkdir -p ~/.starship
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" - -y -b ~/.starship &>/dev/null
  PATH="$PATH:$HOME/.starship"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
install_ohmyzsh() {
  if [ ! -d $ZSH ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc &>/dev/null
  fi
}
install_custom_plugin() {
  if [ ! -d $ZSH_CUSTOM/plugins/$1 ]; then
    git clone https://github.com/zsh-users/$1 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$1 &>/dev/null
    plugins+=($1)
  fi
}
enable_plugin() {
  if command -v $1 &>/dev/null; then
    shift
    plugins+=($*)
  fi
}
install_ohmyzsh
install_custom_plugin zsh-autosuggestions
install_custom_plugin zsh-syntax-highlighting
if ! command -v pygmentize &>/dev/null; then
  pip3 install Pygments &>/dev/null
fi
enable_plugin pygmentize colorize
enable_plugin deno deno
enable_plugin gh gh
enable_plugin git git gitignore
enable_plugin python3 python
if [ -d $ZSH ]; then
  ZSH_THEME=""
  ENABLE_CORRECTION="true"
  DEFAULT_USER="tugrul"
  ZSH_COLORIZE_STYLE="github-dark"
  source $ZSH/oh-my-zsh.sh
  eval "$(starship init zsh)"
  if [ ! -f ~/.config/starship.toml ]; then
    curl $REPO/.config/starship.toml -o ~/.config/starship.toml &>/dev/null
  fi
  if [ ! -f ~/.config/theme.zsh ]; then
    curl $REPO/.config/theme.zsh -o ~/.config/theme.zsh &>/dev/null
  fi
  source ~/.config/theme.zsh
fi

# aliases
alias l='ls -la'
alias x='xargs -I{}'
if echo test | ccat &>/dev/null; then
  alias cat='ccat'
  alias less='cless'
fi

# editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='code --wait'
fi
