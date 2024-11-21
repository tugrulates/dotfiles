#!/bin/zsh

dir=$(dirname $(readlink -f $0))

# ~/
for file in .zshrc .gitconfig .gitignore .config/starship.toml .config/theme.zsh; do
  unlink ~/${file} 2>/dev/null
  mkdir -p $(dirname ~/${file})
  ln -s ${dir}/${file} ~/${file}
done
