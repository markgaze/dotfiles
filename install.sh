#!/bin/bash

echo "Installing dotfiles..."

source install/dotfiles.sh

# perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
  echo -e "\\n\\nRunning on macOS..."
fi
