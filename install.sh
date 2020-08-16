#!/usr/bin/env bash

# Install vim
if [ ! -x "$(command -v vim)" ]; then
  echo Installing vim
  sudo apt update
  sudo apt install vim -y
fi

# Install neovim
if [ ! -x "$(command -v nvim)" ]; then
  echo Installing neovim
  sudo apt update
  sudo apt install neovim -y
fi

echo Setting up neovim
mkdir -p ~/.config/nvim
echo "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
" > ~/.config/nvim/init.vim


echo "\" Call the versioned .vimrc file
if filereadable(expand(\"~/.vim/config/.vimrc\"))
	source ~/.vim/config/.vimrc
endif
" > ~/.vimrc

echo Configuration installed
echo Installing Coc.nvim
. ~/.vim/coc-install.sh
echo Openning neovim
nvim
