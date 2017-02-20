call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'vimlab/neojs'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set ai

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
