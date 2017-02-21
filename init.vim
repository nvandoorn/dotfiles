call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'

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

let g:deoplete#enable_at_startup = 1
let mapleader=" "
set number 
let g:jsx_ext_required = 0

