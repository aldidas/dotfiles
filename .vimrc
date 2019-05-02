set nocompatible
syntax enable
set showcmd
filetype off
set smartcase
set nowrap
set noshowmode
set number
set cursorline
set backspace=indent,eol,start
set hidden
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99
set lazyredraw
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
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'lepture/vim-jinja'
Plug 'gioele/vim-autoswap'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'junegunn/gv.vim'
Plug 'jparise/vim-graphql'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let mapleader = ','
let g:jsx_ext_required = 0
let g:NERDTreeWinSize = 30
let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'active': {
    \ 'left': [ ['mode', 'paste'], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'lineinfo': '》 %3l:%-2v'
    \ },
    \ 'component_function': {
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'readonly': 'LightlineReadonly',
    \   'gitbranch': 'LightlineFugitive'
    \ },
    \ 'separator': {
    \ 'right': '》', 'left': '《'
    \ },
    \ 'subseparator': {
    \ 'right': '》', 'left': '《'
    \ },
    \ 'mode_map': {
    \ 'n' : '[N]',
    \ 'i' : '[I]',
    \ 'R' : '[R]',
    \ 'v' : '[V]',
    \ 'V' : '[VL]',
    \ "\<C-v>": '[VB]',
    \ 'c' : '[C]',
    \ 's' : '[S]',
    \ 'S' : '[SL]',
    \ "\<C-s>": '[SB]',
    \ 't': '[T]',
    \ }
    \ }
function! LightlineReadonly()
    return &readonly ? "\ue0a2 " : ''
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? "\ue0a0 ".branch : ''
    endif
    return ''
endfunction
function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
    return winwidth(0) > 70 ? ($filetype !=# '' ? &filetype : 'no fit') : ''
endfunction

let g:ale_linters = {
\ 'javascript': ['eslint']
\ }
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:indentLine_char = '|'
let g:closetag_filenames = '*.html,*.htm,*.ejs,*.nunjuck,*.njk,*.twig'
let g:Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:fzf_layout = { 'down': '~40%' }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-F><C-F> :NERDTreeFind<CR>
nnoremap <C-B><C-B> :TagbarToggle<CR>
nnoremap <Leader>ig :IndentGuidesToggle<CR>
nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <C-P> :GFiles<CR>
map <Leader>F :Files<CR>
map <Leader>f :Find<space>
map <Leader>m :MerginalToggle<CR>
map <Leader>b :Buffers<CR>
map <Leader>G :NumbersDisable<CR>:Goyo<CR>
map <Leader>g :NumbersEnable<CR>:Goyo!<CR>
map <Leader>ns :%s/\s\+$//e<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
set diffopt+=vertical
set fillchars+=vert:\ 
au BufNewFile,BufRead *.html,*.htm,*.twig,*.njk,*.nunjuck,*.swig set ft=jinja
colorscheme dracula
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
hi CursorLine cterm=NONE ctermbg=235
hi SignColumn guibg=235 ctermbg=235


let s:black    = g:dracula_palette.bg
let s:gray     = g:dracula_palette.bglight
let s:white    = g:dracula_palette.fg
let s:darkblue = g:dracula_palette.comment
let s:cyan     = g:dracula_palette.cyan
let s:green    = g:dracula_palette.green
let s:orange   = g:dracula_palette.orange
let s:purple   = g:dracula_palette.purple
let s:red      = g:dracula_palette.red
let s:yellow   = g:dracula_palette.yellow
let s:inactive = g:dracula_palette.selection

if exists('g:lightline')

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:purple, s:gray ], [ s:cyan, s:gray ] ]
  let s:p.normal.right = [ [ s:purple, s:gray ], [ s:white, s:gray ] ]
  let s:p.inactive.right = [ [ s:inactive, s:black ], [ s:inactive, s:black ] ]
  let s:p.inactive.left =  [ [ s:inactive, s:black ], [ s:inactive, s:black ] ]
  let s:p.insert.left = [ [ s:green, s:gray ], [ s:cyan, s:gray ] ]
  let s:p.replace.left = [ [ s:red, s:gray ], [ s:cyan, s:gray ] ]
  let s:p.visual.left = [ [ s:orange, s:gray ], [ s:cyan, s:gray ] ]
  let s:p.normal.middle = [ [ s:white, s:gray ] ]
  let s:p.inactive.middle = [ [ s:inactive, s:black ] ]
  let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.tabsel = [ [ s:cyan, s:gray ] ]
  let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:gray, s:red ] ]
  let s:p.normal.warning = [ [ s:gray, s:yellow ] ]

  let g:lightline#colorscheme#dracula#palette = lightline#colorscheme#flatten(s:p)

endif
