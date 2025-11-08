# path
PATH="$PATH:$HOME/.deno/bin"
PATH="$PATH:$HOME/.local/bin"
if [ -d "$(python3 -m site --user-base)/bin" ]; then
    PATH="$PATH:$(python3 -m site --user-base)/bin"
fi
if [ -d /opt/homebrew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export PATH

# editor
if [[ -n $SSH_CONNECTION ]]; then
    EDITOR='vi'
elif command -v zed &>/dev/null; then
    EDITOR='zed --wait --add'
elif command -v code &>/dev/null; then
    EDITOR='code --wait'
else
    EDITOR='vi'
fi
export EDITOR

# gpg
export GPG_TTY=$(tty)
