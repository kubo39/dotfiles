#!/bin/sh
# Thanks, @kaorimatz!

set -ue

setup() {
	dotfiles=$HOME/.dotfiles

	has() {
		type "$1" > /dev/null 2>&1
	}

	symlink() {
		[ -e "$2" ] || ln -s "$1" "$2"
	}

	if [ -d "$dotfiles" ]; then
		(cd "$dotfiles" && git pull --rebase)
	else
		git clone git@github.com:kubo39/dotfiles "$dotfiles"
	fi

	symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
	symlink "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"

	if has zsh; then
		symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
		symlink "$dotfiles/.zshenv" "$HOME/.zshenv"
	fi
}

setup
