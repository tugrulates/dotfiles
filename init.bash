#!/bin/bash

dir=$(dirname $(readlink -f $0))

# ~/
for file in .bash_aliases .bash_profile .bashrc .gitattributes .gitconfig .gitignore .inputrc .config/starship.toml; do
	unlink ~/${file} 2>/dev/null
	mkdir -p $(dirname ~/${file})
	ln -s ${dir}/${file} ~/${file}
done
