#!/bin/bash

dir=$(dirname $(readlink -f $0))

# ~/
for file in .bashrc .bash_* .inputrc .git?* .config/*; do
	unlink ~/${file} 2>/dev/null
	mkdir -p $(dirname ~/${file})
	ln -s ${dir}/${file} ~/${file}
done
