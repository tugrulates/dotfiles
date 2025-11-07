# ./init.sh [shell...]

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

files+=("$(cd "${dir}" && find .claude -type f)")
files+=("$(cd "${dir}" && find .config -type f)")

for source in "${sources[@]}"; do
    files=$(cd "${dir}"; find "${source}" -type f)
    for file in ${files}; do
        unlink "$HOME/${file}" 2>/dev/null
        mkdir -p "$(dirname "$HOME/${file}")"
        ln -s "${dir}/${file}" "$HOME/${file}"
        echo "~/${file} -> ${dir}/${file}"
    done
done
