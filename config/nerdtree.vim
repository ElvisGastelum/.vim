" Open NerdTree by Default
NERDTree

" Focus Editor
wincmd p

" AutoClose NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


