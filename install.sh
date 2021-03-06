#!/usr/bin/env bash
#
# Simple use command
#   curl https://raw.githubusercontent.com/ElvisGastelum/.vim/master/install.sh | bash
# 
# * install only for ubuntu/debian

git clone https://github.com/ElvisGastelum/.vim ~/.vim

cd ~/.vim

# Installing vim
echo Installing vim
if [ ! -x "$(command -v vim)" ]; then
  echo Installing vim
  sudo apt update
  sudo apt install vim -y
fi

# Installing neovim
echo Installing neovim
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

echo '
" Call the versioned .vimrc file
if filereadable(expand("~/.vim/config/.vimrc"))
	source ~/.vim/config/.vimrc
endif
' > ~/.vimrc

echo Configuration installed
echo Installing Coc.nvim
. ~/.vim/scripts/coc/install-coc.sh


if [ ! -x "$(grep -iRl "alias v" ~/.bashrc)" ]; then
  echo 'Adding alias v => .bashrc for nvim'
  echo 'alias v="nvim"' >> ~/.bashrc
  source ~/.bashrc
fi

echo Install Plugins
nvim --headless +PlugInstall +qall
echo Openning neovim to finish the configuration
nvim
