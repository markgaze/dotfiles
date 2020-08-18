#!/bin/bash

echo "Symlinking bash dotfiles..."

symlink_files 'bash' '.bash*'
symlink_files 'common' '.*'
symlink_file 'tmux/.tmux.conf' ".tmux.conf"
symlink_file 'git/.gitconfig' ".gitconfig"
symlink_file 'vim/.vimrc' ".vimrc"
