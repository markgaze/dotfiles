#!/bin/bash

symlink_file() {
  file="$(pwd)/$1"
  target="$HOME/$2"
  echo "Symlinking $file to $target"
  ln -sf "$file" "$target"
}

symlink_files() {
  directory=$1
  pattern=$2
  files=$(find "$directory" -name "$pattern")
  for file in $files; do
    filename=$(basename "$file")
    symlink_file "$file" "$filename"
  done
}

echo "Symlinking bash dotfiles..."

symlink_files 'bash' '.bash*'
symlink_files 'common' '.*'
symlink_file 'tmux/.tmux.conf' ".tmux.conf"
symlink_file 'git/.gitconfig' ".gitconfig"
symlink_file 'vim/.vimrc' ".vimrc"
