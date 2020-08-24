.PHONY: update zsh emacs neovim

update:
	git submodule update --recursive --checkout --remote --jobs 8

zsh:
	git add zsh
	git commit -m "[zsh] update oh my zsh"

emacs:
	git add emacs
	git commit -m "[emacs] update doom emacs"

neovim:
	git add neovim
	git commit -m "[neovim] update packages"
