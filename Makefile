HOME ?= `$HOME`
PWD ?= `pwd`

.PHONY: test
test:
  shellcheck .aliases .bash_* .exports .*_functions
