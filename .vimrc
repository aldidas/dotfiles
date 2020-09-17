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
let javaScript_fold=1
set foldlevelstart=99
set lazyredraw
set mouse=a
set tabstop=4 softtabstop=4 expandtab shiftwidth=4
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
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'idanarye/vim-merginal'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'

call plug#end()

let mapleader = ','
let g:jsx_ext_required = 0
let g:NERDTreeWinSize = 30
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERTTreeQuitOnOpen = 1
let g:lightline = {
    \ 'colorscheme': 'nord',
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
    \ 'n' : '<N>',
    \ 'i' : '<I>',
    \ 'R' : '<R>',
    \ 'v' : '<V>',
    \ 'V' : '<VL>',
    \ "\<C-v>": '<VB>',
    \ 'c' : '<C>',
    \ 's' : '<S>',
    \ 'S' : '<SL>',
    \ "\<C-s>": '<SB>',
    \ 't': '<T>',
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
    return winwidth(0) > 70 ? WebDevIconsGetFileFormatSymbol() . ' ' : ''
endfunction
function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' : 'no ft') : ''
endfunction

let g:ale_linters = { 'javascript': ['eslint'], 'vue': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'vue': ['eslint'] }
let b:ale_linters = { 'javascript': ['eslint'], 'vue': ['eslint'] }
let b:ale_fixers = { 'javascript': ['eslint'], 'vue': ['eslint'] }
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:indentLine_char = '|'
let g:closetag_filenames = '*.html,*.htm,*.ejs,*.nunjuck,*.njk,*.twig'
let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=Nord --color=always --line-range :300 {}'"
let g:webdevicons_conceal_nerdtree_brackets = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-F><C-F> :NERDTreeFind<CR>
nnoremap <Leader>ig :IndentGuidesToggle<CR>
nnoremap <Leader>ef :ALEFix<CR>
nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <C-P> :GFiles<CR>
map <Leader>F :Files<CR>
map <Leader>f :Find<space>
map <Leader>m :MerginalToggle<CR>
map <Leader>b :Buffers<CR>
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
set fillchars+=vert:│
au BufNewFile,BufRead *.html,*.htm,*.twig,*.njk,*.nunjuck,*.swig set ft=jinja
colorscheme nord
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
hi CursorLine cterm=NONE ctermbg=235
hi SignColumn guibg=235 ctermbg=235

let s:nord0 = ["#2E3440", "NONE"]
let s:nord1 = ["#3B4252", 0]
let s:nord2 = ["#434C5E", "NONE"]
let s:nord3 = ["#4C566A", 8]
let s:nord4 = ["#D8DEE9", "NONE"]
let s:nord5 = ["#E5E9F0", 7]
let s:nord6 = ["#ECEFF4", 15]
let s:nord7 = ["#8FBCBB", 14]
let s:nord8 = ["#88C0D0", 6]
let s:nord9 = ["#81A1C1", 4]
let s:nord10 = ["#5E81AC", 12]
let s:nord11 = ["#BF616A", 1]
let s:nord12 = ["#D08770", 11]
let s:nord13 = ["#EBCB8B", 3]
let s:nord14 = ["#A3BE8C", 2]
let s:nord15 = ["#B48EAD", 5]

if exists('g:lightline')
  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:nord8, s:nord3 ], [ s:nord5, s:nord3 ] ]
  let s:p.normal.middle = [ [ s:nord5, s:nord3 ] ]
  let s:p.normal.right = [ [ s:nord5, s:nord3 ], [ s:nord5, s:nord3 ] ]
  let s:p.normal.warning = [ [ s:nord13, s:nord3 ] ]
  let s:p.normal.error = [ [ s:nord11, s:nord3 ] ]

  let s:p.inactive.left =  [ [ s:nord8, s:nord2 ], [ s:nord5, s:nord2 ] ]
  let s:p.inactive.middle = [ [ s:nord5, s:nord2 ], [ s:nord5, s:nord2 ] ]
  let s:p.inactive.right = [ [ s:nord5, s:nord2 ], [ s:nord5, s:nord2 ] ]

  let s:p.insert.left = [ [ s:nord6, s:nord3 ], [ s:nord5, s:nord3 ] ]
  let s:p.replace.left = [ [ s:nord14, s:nord3 ], [ s:nord5, s:nord3 ] ]
  let s:p.visual.left = [ [ s:nord7, s:nord3 ], [ s:nord5, s:nord3 ] ]

  let s:p.tabline.left = [ [ s:nord5, s:nord3 ] ]
  let s:p.tabline.middle = [ [ s:nord5, s:nord3 ] ]
  let s:p.tabline.right = [ [ s:nord5, s:nord3 ] ]
  let s:p.tabline.tabsel = [ [ s:nord8, s:nord3 ] ]

  let g:lightline#colorscheme#nord#palette = lightline#colorscheme#flatten(s:p)
endif

let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#arrow_parens = 'avoid'

