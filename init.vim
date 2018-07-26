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

Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhartington/oceanic-next'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/deoplete.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set ai
set number
set relativenumber
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*,*/coverage/*,*/.nyc_output/*,*/mangoh-src/*,*/_build**,*/legato/*,*/build/*
nnoremap ; :
nnoremap : ;

if (has("termguicolors"))
 set termguicolors
endif

map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

let g:node_host_prog = '/Users/nick/.nvm/versions/node/v8.11.1/lib/node_modules/neovim/bin/cli.js'
