.PHONY: update zsh emacs neovim doom init

doom = emacs/.emacs.d/bin/doom

update:
	git submodule update --recursive --checkout --remote --jobs 8

init:
	# Init git
	mkdir -p ~/Developer ~/IOHK ~/Pozitive
	stow -v git
	# Init fonts
	mkdir -p ~/.local/share/fonts
	stow -v fonts
	# Init emacs
	mkdir -p ~/.local/bin
	stow -v emacs

zsh:
	git add zsh
	git commit -m "[zsh] update oh my zsh"

emacs:
	git add emacs
	git commit -m "[emacs] update doom emacs"

neovim:
	git add neovim
	git commit -m "[neovim] update packages"

doom:
	$(doom) clean
	$(doom) sync
	$(doom) sync -u
	$(doom) compile

