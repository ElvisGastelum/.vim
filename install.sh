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


echo Installing vim-plug for neovim and vim
# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim (~/.local/share/nvim/site/autoload)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "\" Call the versioned .vimrc file
if filereadable(expand(\"~/.vim/config/.vimrc\"))
	source ~/.vim/config/.vimrc
endif
" > ~/.vimrc

echo Install Plugins
vim +'PlugInstall --sync' +qa

echo Configuration installed
echo Installing Coc.nvim
. ~/.vim/coc-install.sh

echo Openning neovim
nvim
