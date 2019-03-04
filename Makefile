HOME ?= `$HOME`
PWD ?= `pwd`

.PHONY: provision
provision: bashfiles i3files configfiles backgrounds setup-git-config

.PHONY: bashfiles
bashfiles:
	@echo '##'
	@echo '# Symlink the dot files in'
	@echo '##'
	for file in  \
	.bash_aliases \
	.bash_profile \
	.bash_prompt \
	.bashrc \
	.exports \
	.gitconfig \
	.helperfunc \
	.dockerfunc \
	.Xresources \
	.vimrc \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done

.PHONY: i3files
i3files:
	@echo '##'
	@echo '# Symlink the i3 files in'
	@echo '##'
	if [ ! -d "$(HOME)/.i3" ]; then mkdir $(HOME)/.i3/; fi
	ln -sf $(PWD)/.i3/config $(HOME)/.i3/config
	ln -sf $(PWD)/.i3/status.conf $(HOME)/.i3/status.conf

.PHONY: configfiles
configfiles:
	@echo '##'
	@echo '# Symlink the .config files in'
	@echo '##'
	if [ ! -d "$(HOME)/.config/polybar" ]; then mkdir $(HOME)/.config/polybar/; fi
	ln -sf $(PWD)/.config/polybar/config $(HOME)/.config/polybar/config
	ln -sf $(PWD)/.config/polybar/launch.sh $(HOME)/.config/polybar/launch.sh
	if [ ! -d "$(HOME)/.config/dunst" ]; then mkdir $(HOME)/.config/dunst/; fi
	ln -sf $(PWD)/.config/dunst/dunstrc $(HOME)/.config/dunst/dunstrc

.PHONY: backgrounds
backgrounds:
	@echo '##'
	@echo '# Copy backgrounds'
	@echo '##'
	if [ ! -d "$(HOME)/backgrounds" ]; then mkdir $(HOME)/backgrounds/; fi
	cp backgrounds/* $(HOME)/backgrounds/

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
