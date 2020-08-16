" Open NerdTree by Default
autocmd VimEnter * NERDTree

" Focus Editor
autocmd VimEnter * wincmd p

" AutoClose NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


