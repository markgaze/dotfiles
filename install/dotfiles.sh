#!/bin/bash

echo "Symlinking bash dotfiles..."

symlink_files 'bash' '.bash*'
symlink_files 'common' '.*'
symlink_files 'tmux' ".*"
symlink_files 'git' ".*"
symlink_files 'vim' ".*"
