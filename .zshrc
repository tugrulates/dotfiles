REPO=https://raw.githubusercontent.com/tugrulates/dotfiles/refs/heads/main
export ZSH="$HOME/.oh-my-zsh"

install_ohmyzsh() {
    if [ ! -d $ZSH ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc &>/dev/null
    fi
}
install_starship() {
    export PATH="$PATH:$HOME/.starship"
    if ! command -v starship &>/dev/null; then
        mkdir -p ~/.starship
        sh -c "$(curl -fsSL https://starship.rs/install.sh)" - -y -b ~/.starship &>/dev/null
    fi
    if [ ! -f ~/.config/starship.toml ]; then
        curl $REPO/.config/starship.toml -o ~/.config/starship.toml &>/dev/null
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

# aliases
alias x='xargs -I{}'

# prompt
install_starship
eval "$(starship init zsh)"

# oh-my-zsh
install_ohmyzsh
enable_plugin pygmentize colorize
enable_plugin deno deno
enable_plugin gh gh
enable_plugin git git gitignore
enable_plugin python3 python
if [[ $OSTYPE == "darwin"* ]]; then
    plugins+=(macos)
fi
install_custom_plugin zsh-autosuggestions
install_custom_plugin zsh-history-substring-search
install_custom_plugin zsh-syntax-highlighting
bindkey '^[[1;2A' history-substring-search-up
bindkey '^[[1;2B' history-substring-search-down
if [ -d $ZSH ]; then
    ZSH_THEME=""
    source $ZSH/oh-my-zsh.sh
fi
