function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

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
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'akz92/vim-ionic2'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*
nnoremap ; :
nnoremap : ;
nnoremap    v   <C-V>
nnoremap <C-V>     v

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1
let mapleader=" "

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
