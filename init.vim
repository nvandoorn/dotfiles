call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'isRuslan/vim-es6'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
let g:airline_theme='wombat'

let g:deoplete#enable_at_startup = 1
let mapleader=" "
let g:jsx_ext_required = 0
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

