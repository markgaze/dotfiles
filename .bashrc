#!/bin/bash

# Bash scripts to load
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

for file in ~/.{bash_aliases,bash_prompt,exports,dockerfunc,*func}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck disable=SC1090
    source "$file"
  fi
done
unset file

# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
