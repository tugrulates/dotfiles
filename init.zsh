#!/bin/zsh

dir=$(dirname $(readlink -f $0))

# ~/
unlink ~/.zshrc 2>/dev/null
ln -s ${dir}/.zshrc ~/.zshrc
