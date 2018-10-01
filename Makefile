HOME ?= `$HOME`
PWD ?= `pwd`

.PHONY: provision
provision: bashfiles setup-git-config

.PHONY: bashfiles
bashfiles:
	@echo '##'
	@echo '# Symlink the dot files in'
	@echo '##'
	for file in  \
	.bash_aliases \
	.bash_profile \
	.bash_prompt \
	.exports \
	.gitconfig \
	.dockerfunc \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

.PHONY: setup-git-config
setup-git-config:
	@echo '##'
	@echo '# Setup the local git configuration'
	@echo '##'
ifeq ("$(wildcard $(HOME)/.gitconfig.local)","")
	cp .gitconfig.local $(HOME)/.gitconfig.local
	@echo "Enter your full name";
	@read name; \
	sed -i.orig "s/GITNAME/$$name/" $(HOME)/.gitconfig.local
	@echo "Enter your email address";
	@read email; \
	sed -i.orig.1 "s/GITEMAIL/$$email/g" $(HOME)/.gitconfig.local
	rm -f .gitconfig.local.orig*
endif

.PHONY: test
test:
	shellcheck .bash_* .exports .dockerfunc
