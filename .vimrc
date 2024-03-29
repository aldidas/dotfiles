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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nikvdp/ejs-syntax'
Plug 'evanleck/vim-svelte', { 'branch': 'main' }

call plug#end()

let mapleader = ','
let g:jsx_ext_required = 0
let g:NERDTreeWinSize = 25
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERTTreeQuitOnOpen = 1
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0
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
let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=Nord --color=always --line-range :300 {}' --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B,gutter:#2E3440"
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

"iabbrev </ </<C-X><C-O>

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
"set fillchars+=vert:│
au BufNewFile,BufRead *.html,*.htm,*.twig,*.njk,*.nunjuck,*.swig set ft=jinja
colorscheme dracula
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
hi CursorLine cterm=NONE ctermbg=235
hi SignColumn guibg=235 ctermbg=235
hi Normal ctermbg=NONE guibg=NONE

let s:black    = g:dracula#palette.bg
let s:gray     = g:dracula#palette.bglight
let s:white    = g:dracula#palette.fg
let s:darkblue = g:dracula#palette.comment
let s:cyan     = g:dracula#palette.cyan
let s:green    = g:dracula#palette.green
let s:orange   = g:dracula#palette.orange
let s:purple   = g:dracula#palette.purple
let s:red      = g:dracula#palette.red
let s:yellow   = g:dracula#palette.yellow
let s:inactive = g:dracula#palette.selection

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

let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#arrow_parens = 'avoid'
