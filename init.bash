#!/bin/bash

dir=$(dirname $(readlink -f $0))
win_sed='s/#\s*win:\s*//'

# ~/
for file in .bash_aliases .bash_profile .bashrc .gitattributes .gitconfig .gitignore .inputrc .config/starship.toml; do
	unlink ~/${file} 2>/dev/null
	mkdir -p $(dirname ~/${file})
	ln -s ${dir}/${file} ~/${file}
done

# ~/windows
if [[ -d ~/windows ]]; then
	for file in .gitconfig; do
		win_config=$(mktemp)
		sed 's/#\s*win:\s*//' ${dir}/${file} >$win_config
		if [[ ! -f ~/windows/${file} || -n $(diff ~/windows/${file} ${win_config}) ]]; then
			cp -i ${win_config} ~/windows/${file}
		fi
	done
fi

# /etc/
for file in /etc/wsl.conf; do
	if [[ ! -f ${file} || -n $(diff ${dir}${file} ${file}) ]]; then
		sudo cp -i ${dir}${file} ${file}
	fi
done
