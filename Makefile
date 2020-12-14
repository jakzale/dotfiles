doom = emacs/.emacs.d/bin/doom

.PHONY: update
update:
	git submodule update --recursive --checkout --remote --jobs 8

.PHONY: init-dirs
init-dirs:
	mkdir -p ~/Developer ~/IOHK ~/Pozitive
	mkdir -p ~/.local/share/fonts
	mkdir -p ~/.local/bin

.PHONY: init
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



.PHONY: zsh
zsh:
	git add zsh
	git commit -m "[zsh] update oh my zsh"

.PHONY: emacs
emacs:
	git add emacs
	git commit -m "[emacs] update doom emacs"

.PHONY: fish
fish:
	git add fish
	git commit -m "[fish] update oh my fish"

.PHONY: neovim
neovim:
	git add neovim
	git commit -m "[neovim] update packages"

.PHONY: neovim-helptags
neovim-helptags:
	nvim -es +helptags\ ALL +q || echo "ignored some errors during :helptags ALL"

.PHONY: doom
doom:
	$(doom) clean
	$(doom) sync
	$(doom) sync -u
	$(doom) compile

