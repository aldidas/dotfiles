set nocompatible
syntax enable
set showcmd
filetype off
set smartcase
set nowrap
set number
set cursorline
set backspace=indent,eol,start
set hidden
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set lazyredraw
set foldlevel=2
set mouse=a
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
if has("mouse_sgr")
	set ttymouse=sgr
else
	if !has('nvim')
		set ttymouse=xterm2
	endif
end
set clipboard=unnamed
set swapfile
set directory=
set directory=~/.vim/swaps//

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dikiaap/minimalist'
Plug 'chriskempson/base16-vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else 
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ternjs/tern_for_vim', { 'do': 'yarn global add tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'easymotion/vim-easymotion'
Plug 'lepture/vim-jinja'
Plug 'gioele/vim-autoswap'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'elzr/vim-json'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/gv.vim'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let mapleader = ','
let g:jsx_ext_required = 0
let g:NERDTreeWinSize = 30
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#close_symbol = '‚úñÔ∏é'
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
\ '__' : '-',
\ 'n' : '<N>',
\ 'i' : '<I>',
\ 'R' : '<R>',
\ 'c': '<C>',
\ 'v': '<V>',
\ 'V': '<V>',
\ }

let g:ale_linters = {
\ 'javascript': ['eslint']
\ }
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_sign_error = '‚úò'
let g:ale_sign_warning = '‚ö†Ô∏é'
let g:gruvbox_vert_split = 'bg0'
let g:gruvbox_invert_tabline = 1
let g:gruvbox_contrast_dark = 'dark'

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#sources#ternjs#tern_bin = '/Users/aldidas/.config/yarn/global/node_modules/tern/bin/tern'
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#ternjs#filetypes = [
\ 'jsx'
\ ]
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"let g:nvim_typescript#javascript_support = 1
let g:indentLine_char = '|'
let g:closetag_filenames = '*.html,*.htm,*.ejs,*.nunjuck,*.njk,*.twig'
let g:Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:numbers_exclude = ['goyo.vim']
let g:goyo_width = 100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-F><C-F> :NERDTreeFind<CR>
nnoremap <C-B><C-B> :TagbarToggle<CR>
nnoremap <Leader>ig :IndentGuidesToggle<CR>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <C-P> :GFiles<CR>
map <Leader>F :Files<CR>
map <Leader>f :Find<space>
map <Leader>m :MerginalToggle<CR>
map <Leader>b :Buffers<CR>
map <Leader>G :NumbersDisable<CR>:Goyo<CR>
map <Leader>g :NumbersEnable<CR>:Goyo!<CR>

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set t_Co=256
set background=dark
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
set termguicolors
set splitright
set splitbelow
set fillchars+=vert:‚îÇ
set diffopt+=vertical
"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
"set guicursor=
au BufNewFile,BufRead *.html,*.htm,*.twig,*.njk,*.nunjuck,*.swig set ft=jinja
colorscheme dracula 
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
hi CursorLine cterm=NONE ctermbg=235
hi SignColumn guibg=235 ctermbg=235
autocmd BufWritePre * :%s/\s\+$//e
