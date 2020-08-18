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
