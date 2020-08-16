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
  sudo add-apt-repository ppa:neovim-ppa/stable -y
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

# Neovim 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo Openning neovim for install plug-vim

echo "\" Call the versioned .vimrc file
if filereadable(expand(\"~/.vim/config/.vimrc\"))
	source ~/.vim/config/.vimrc
endif
" > ~/.vimrc

echo Install Plugins
nvim +PlugInstall +qall

echo Configuration installed
echo Installing Coc.nvim
. ~/.vim/coc-install.sh

echo 'alias v="nvim"' >> ~/.bashrc
source ~/.bashrc
if [ -x "$(command -v zsh)" ]; then
  echo 'alias v="nvim"' >> ~/.zshrc
  . ~/.zshrc
fi

echo Openning neovim
nvim
