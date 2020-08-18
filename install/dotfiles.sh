#!/bin/bash

symlink_files() {
  directory=$1
  pattern=$2
  files=$(find "$directory" -name "$pattern")
  for file in $files; do
    filename=$(basename "$file")
    echo "Symlinking $file to $HOME/$filename"
    ln -sf "$(pwd)/$file" "$HOME/$filename"
  done
}

echo "Symlinking bash dotfiles..."

symlink_files './bash' '.bash*'
symlink_files './common' '.*'
