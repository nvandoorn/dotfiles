function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

if (has("termguicolors"))
 set termguicolors
endif

call plug#begin('~/.local/share/nvim/plugged')

" Pick a theme, any theme, really
Plug 'NLKNguyen/papercolor-theme'
Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

" Syntax support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'elixir-editors/vim-elixir'

" Extensions
" Chuch of tpope
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'srstevenson/vim-picker'
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

" General config
syntax enable
if $VIM_BACKGROUND == 'light'
  set background=light
endif
if $VIM_BACKGROUND == 'dark'
  set background=dark
endif
set shell=$SHELL
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
filetype plugin on
runtime macros/matchit.vim
cnoreabbrev Spec Dispatch bundle exec rspec %

let mapleader = "\<Space>"
" Key bindings
nnoremap ; :
nnoremap : ;

nnoremap <Leader>r :Ranger<CR>
nnoremap <Leader>n :NERDTree %<CR>
nnoremap <Leader>s :w <bar> :Dispatch bundle exec rspec %<cr>
nnoremap <Leader>b :Gblame<cr>
nnoremap <Leader>g :G<cr>
nnoremap <Leader>c :Gcommit<cr>
nnoremap <Leader>/ :noh<cr>
nnoremap <Leader>l :0Glog -100<cr>
nnoremap <Leader>x :PickerSplit<cr>
nnoremap <Leader>t :PickerTabedit<cr>
nnoremap <Leader>v :PickerVsplit<cr>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader><tab> :tabn<cr>
nnoremap <leader><s-tab> :tabp<cr>

let g:picker_custom_find_executable = 'ag'
let g:picker_custom_find_flags = '. -l'

" Theme
colorscheme $VIM_THEME
let g:airline_powerline_fonts = 1
let g:airline_theme=$VIM_AIRLINE_THEME
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#branch#enabled = 0

" Distribute windows when resize happens.
au VimResized * :wincmd =

let g:jsx_ext_required = 0
let g:ctrlp_working_path_mode = 'rw'

augroup jbuilder
  au!
  autocmd BufNewFile,BufRead *.jbuilder set syntax=ruby
augroup END

augroup es
  au!
  autocmd BufNewFile,BufRead *.es6 set syntax=javascript
augroup END

set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
