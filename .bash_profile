#!/bin/bash

# Add tab completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    # shellcheck disable=SC1091
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    # shellcheck disable=SC1091
    source /etc/bash_completion
  fi
fi

# shellcheck disable=SC1090
[ -f ~/.bash.d/cht.sh ] && . ~/.bash.d/cht.sh

# shellcheck disable=SC1090
[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# Bash scripts to load
for file in ~/.{aliases,bash_prompt,exports,*_functions}; do
  # shellcheck disable=SC1090
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file;

# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
