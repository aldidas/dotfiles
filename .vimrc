set nocompatible
syntax enable
set showcmd
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'myusuf3/numbers.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'tpope/vim-haml'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'easymotion/vim-easymotion'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Yggdroot/indentLine'

call vundle#end()

filetype plugin indent on

set encoding=utf-8
set nowrap
set number
set cursorline
set ts=4 sw=4 et
set mouse=a
set expandtab
set backspace=indent,eol,start
set background=dark
set guifont=Meslo\ LG\ L\ for\ Powerline:h14
colorscheme hybrid_material

set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set splitbelow
set splitright
set linespace=3

let mapleader = ','
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>ig :IndentLinesToggle<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-P>b :CtrlPBuffer<cr>
nnoremap <C-P>m :CtrlPMRU<cr>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'hybrid'
let g:indentLine_char = '|'
let g:jsx_ext_required = 0

