# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc  1>/dev/null 2>/dev/null
fi
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="agnoster"
    ENABLE_CORRECTION="true"
    plugins=(git)
    DEFAULT_USER="tugrul"
    source $ZSH/oh-my-zsh.sh
fi

# aliases
alias h='history | sed "s/^ *[0-9][0-9]* *//" | grep'
alias l='ls -la'
alias x='xargs -I{}'

# corrections
# setopt correct
# setopt correct_all

# directories
# setopt auto_cd

# glob
# setopt extended_glob
# setopt no_case_glob
# setopt numeric_glob_sort

# history
# HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# SAVEHIST=100000
# HISTSIZE=${SAVEHIST}
# setopt append_history
# setopt extended_history
# setopt hist_expire_dups_first
# setopt hist_find_no_dups
# setopt hist_ignore_all_dups
# setopt hist_reduce_blanks
# setopt hist_verify
# setopt share_history

# completion
# zstyle ':completion:*' completer _expand _complete _ignored _correct
# zstyle :compinstall filename '/Users/tugrul/.zshrc'
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
# autoload -Uz compinit
# compinit

# colors
# alias grep='grep --color=auto'
# alias egrep='egrep --color=auto'
# alias ls='ls --color=auto'
# alias dir='dir --color=auto'
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# prompt
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# PROMPT='%F{green}%n@%m %F{magenta}%1~ %F{white}%# '
# RPROMPT='%F{yellow}${vcs_info_msg_0_}'
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git*' formats "%s  %r/%S %b (%a) %m%u%c "

# input
# bindkey $'^[[A' up-line-or-search
# bindkey $'^[[B' down-line-or-search

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
