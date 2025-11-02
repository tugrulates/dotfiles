#!/bin/zsh

dir=$(dirname $(readlink -f $0))

# ~/
for file in .zshrc .gitattributes .gitconfig .gitignore .inputrc .config/starship.toml; do
	unlink ~/${file} 2>/dev/null
	mkdir -p $(dirname ~/${file})
	ln -s ${dir}/${file} ~/${file}
done
