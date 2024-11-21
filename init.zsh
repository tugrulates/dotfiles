#!/bin/zsh

dir=$(dirname $(readlink -f $0))

# ~/
for file in .zshrc .gitconfig .gitignore .config/starship.toml; do
  unlink ~/${file} 2>/dev/null
  ln -s ${dir}/${file} ~/${file}
done
