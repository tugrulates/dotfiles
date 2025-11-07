# ./init.sh      : install configs for default shell
# ./init.sh zsh  : install configs for zsh
# ./init.sh bash : install configs for bash

shell=$(basename ${@} $SHELL)
dir=$(dirname "$(readlink -f "$0")")

sources=(.gitattributes .gitconfig .gitignore .claude .config)
if [ "${shell}" == "zsh" ]; then
  sources+=(.zshrc)
elif [ "${shell}" == "bash" ]; then
  sources+=(.bash_aliases .bash_profile .bashrc)
fi

files+=("$(cd "${dir}" && find .claude -type f)")
files+=("$(cd "${dir}" && find .config -type f)")

for source in "${sources[@]}"; do
  files=$(cd "${dir}"; find "${source}" -type f)
  for file in ${files}; do
    unlink ~/"${file}" 2>/dev/null
    mkdir -p "$(dirname ~/"${file}")"
    ln -s "${dir}/${file}" ~/"${file}"
  done
done
