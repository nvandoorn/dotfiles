function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugged')

" Pick a theme, any theme, really
Plug 'NLKNguyen/papercolor-theme'
Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Syntax support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'elixir-editors/vim-elixir'
Plug 'elzr/vim-json'

" Extensions
" Chuch of tpope
Plug 'wellle/targets.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'
Plug 'bkad/CamelCaseMotion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" General config
syntax on
set gfn=OperatorMonoLig\ Nerd\ Font:h16
set timeoutlen=10 ttimeoutlen=0
set background=dark
set bs=2
set tabstop=2
set foldmethod=syntax
set foldlevelstart=99
set expandtab
set shiftwidth=2
set softtabstop=2
set ai
set number
set relativenumber
set mouse=a
" TODO load this from a file
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*,*/coverage/*,*/.nyc_output/*,*/build/*,*/.cache/*,*/public/*,*/dist/*
filetype plugin on
runtime macros/matchit.vim

" Key bindings
nmap <C-u> [e
nmap <C-d> ]e
vmap <C-u> [egv
vmap <C-d> ]egv
nnoremap ; :
nnoremap : ;
nnoremap : :Ranger<CR>

" Theme
colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'rw'

augroup jbuilder
  au!
  autocmd BufNewFile,BufRead *.jbuilder set syntax=ruby
augroup END

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
