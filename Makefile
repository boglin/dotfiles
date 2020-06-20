.PHONY: help install-links update-vim-plugins

help:
	@echo "Usage:"
	@echo "  install"
	@echo "  install-apps"
	@echo "  install-links"
	@echo "  update-vim-plugins : Update vim plugin submodules"


install-apps:
	# For ipad: ish
	apk add \
	  git \
	  vim \
	  tmux \
	  gcc \
	  gdb  \
	  musl-dev \
	  python3 \
	  python3-dev

install-links:
	mkdir -p ~/.vim
	mkdir -p ~/.tmux
	ln -sf $(CURDIR)/vim/pack ~/.vim/
	ln -sf $(CURDIR)/vim/vimrc ~/.vimrc
	ln -sf $(CURDIR)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(CURDIR)/tmux/tmuxline.conf ~/.tmux/tmuxline.conf

install: install-apps install-links
	@echo "Installation complete."

update-vim-plugins:
	git submodule update --remote --merge
