# ./init.sh  [zsh] [bash]

if [ $# -eq 0 ]; then
    shells=$(basename ${@} $SHELL)
else
    shells=${@}
fi

dir=$(dirname "$(readlink -f "$0")")
sources=(.claude .config .gitattributes .gitconfig .gitignore .profile)
for shell in ${shells}; do
    if [ "${shell}" == "zsh" ]; then
        sources+=(.zshrc .zprofile)
    elif [ "${shell}" == "bash" ]; then
        sources+=(.bashrc .inputrc)
    fi
done

target() {
    local file="$1"
    if [ "${file}" != ".config/code/settings.json" ]; then
        echo "$HOME/${file}"
    else
        os=$(uname -s)
        if [ "${os}" == "Darwin" ]; then
            echo "$HOME/Library/Application Support/Code/User/settings.json"
        elif [ "${os}" == "Linux" ]; then
            echo "$HOME/.config/Code/User/settings.json"
        else
            echo "$APPDATA/Code/User/settings.json"
        fi
    fi
}

for source in "${sources[@]}"; do
    files=$(cd "${dir}"; find "${source}" -type f)
    for file in ${files}; do
        target=$(target "${file}")
        unlink "${target}" 2>/dev/null
        mkdir -p "$(dirname "${target}")"
        ln -s "${dir}/${file}" "${target}"
        echo "${target} -> ${dir}/${file}"
    done
done
