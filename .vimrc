set nocompatible
syntax enable
set showcmd
filetype off
set nowrap
set number
set cursorline
set backspace=indent,eol,start
set hidden
set guioptions=
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set mouse=a
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dikiaap/minimalist'
Plug 'chriskempson/base16-vim'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mklabs/split-term.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'lepture/vim-jinja'
Plug 'gioele/vim-autoswap'
Plug 'terryma/vim-smooth-scroll'

call plug#end()

let mapleader = ','
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'minimalist'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:indentLine_char = '|'
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_STORE\|git'
let g:hardtime_default_on = 1
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n' : 'N',
	\ 'i' : 'I',
	\ 'R' : 'R',
	\ 'c': 'C',
	\ 'v': 'V',
	\ 'V': 'V',
	\ }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-F><C-F> :NERDTreeFind<CR>
nnoremap <C-B><C-B> :TagbarToggle<CR>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>

iabbrev </ </<C-X><C-O>

inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
vnoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
vnoremap <right> <nop>
nnoremap <right> <nop>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

set t_Co=256
set background=dark
if has("gui_mac")
	set macligatures
endif
set linespace=1
set guifont=Hasklig\ Light:h15
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
set splitright
set splitbelow
set diffopt+=vertical
au BufNewFile,BufRead *.html,*.htm,*.twig,*.njk,*.nunjuck set ft=jinja
colorscheme base16-onedark 
