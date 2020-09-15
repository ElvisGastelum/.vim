#!/usr/bin/env bash
#
# Simple use command
#   curl https://raw.githubusercontent.com/ElvisGastelum/.vim/master/install-from-docker.sh | bash
# 
# * install only for ubuntu/debian
# * and root user

if [ ! -x "$(command -v git)" ]; then
  echo Installing git
  apt-get install git software-properties-common -y
fi

git clone https://github.com/ElvisGastelum/.vim ~/.vim

cd ~/.vim

# Install neovim
if [ ! -x "$(command -v nvim)" ]; then
  echo Installing neovim
  add-apt-repository ppa:neovim-ppa/stable -y
  apt-get update
  apt-get install neovim -y
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
. ~/.vim/coc-install.sh


if [ ! -x "$(grep -iRl "alias vim" ~/.bashrc)" ]; then
  echo 'Adding alias vim => .bashrc for nvim'
  echo 'alias vim="nvim"' >> ~/.bashrc
fi

echo Install Plugins
nvim --headless +PlugInstall +qall

exit 0
