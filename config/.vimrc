set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode


" Call the .vimrc.plug file
if filereadable(expand("~/.vim/config/.vimrc.plug"))
	source ~/.vim/config/.vimrc.plug
endif


autocmd VimEnter * if exists(":NERDTree") | exe "source ~/.vim/config/nerdtree.vim" | endif

autocmd VimEnter * if exists(":CocAction") | exe "source ~/.vim/config/coc.vim" | endif
