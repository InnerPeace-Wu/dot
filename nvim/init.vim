let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

set nocompatible
filetype off

call plug#begin("~/.nvim/bundle")
" Plugin List
Plug 'ervandew/supertab'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'jlanzarotta/bufexplorer'
Plug 'Raimondi/delimitMate'
Plug 'bigeagle/molokai'
Plug 'bling/vim-airline'
Plug 'hkupty/nvimux'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

Plug 'vim-scripts/DrawIt'
Plug 'terryma/vim-multiple-cursors'
" Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'embear/vim-localvimrc'
Plug 'jrosiek/vim-mark'
Plug 'mbbill/undotree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

Plug 'mattn/emmet-vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'fatih/vim-go'
Plug 'lervag/vim-latex'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-fugitive'
Plug 'sudar/vim-arduino-syntax'
Plug 'zaiste/tmux.vim'
Plug 'elzr/vim-json'
Plug 'lepture/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'
Plug 'isRuslan/vim-es6'
Plug 'bigeagle/sieve.vim'
Plug 'posva/vim-vue'
Plug 'google/vim-ft-bzl'
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'

Plug 'junegunn/fzf.vim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" " Plug 'autozimu/LanguageClient-neovim', {
" "     \ 'branch': 'next',
" "     \ 'do': 'bash install.sh',
" "     \ }
" " Plug 'prabirshrestha/async.vim'
" " Plug 'prabirshrestha/vim-lsp'
" 
" Plug 'zchee/deoplete-jedi'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" "Plug 'zchee/deoplete-clang'
" Plug 'tweekmonster/deoplete-clang2'
"

" Plug 'roxma/ncm-clang'
" Plug 'roxma/nvim-completion-manager', {'for': ['python', 'go', 'typescript']}

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-bufword'

" Plug 'Valloric/YouCompleteMe', {'for': ['cpp', 'hpp', 'c', 'h']}
Plug 'Shougo/echodoc.vim'

Plug 'davidhalter/jedi-vim'

Plug 'caio/querycommandcomplete.vim'
Plug 'justinmk/vim-gtfo'
Plug 'freitass/todo.txt-vim'

Plug '~/.nvim/bundle/colorpicker'

" innerpeace plug
Plug 'tpope/vim-commentary'
Plug 'tell-k/vim-autopep8'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
call plug#end()

" innerpeace config
let g:go_version_warning = 0
let mapleader=";"

let g:pydocstring_doq_path = "/usr/local/bin/doq"
let g:pydocstring_formatter = 'google'


set relativenumber number " 相对行号
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

set completeopt=longest,menu " preview
let g:SuperTabDefaultCompletionType = "<c-n>"

" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vnoremap <Space> zf

noremap<leader>e $
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>it :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>

" set clipboard=unnamedplus
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p

nmap T :tabnew<cr>
noremap <leader>hl :set hlsearch! hlsearch?<CR>

"swift tab
nmap <C-t>n :tabnew<CR>
nmap <C-t>l :tabnext<CR>
nmap <C-t>h :tabprevious<CR>
nmap <C-t>c :tabclose<CR>

nmap <leader>1 1gt<CR>
nmap <leader>2 2gt<CR>
nmap <leader>3 3gt<CR>
nmap <leader>4 4gt<CR>
nmap <leader>5 5gt<CR>
nmap <leader>6 6gt<CR>
nmap <leader>7 7gt<CR>

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


" UI
if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
    endif " has
endif " exists(...)

set so=10
set number
syntax on
filetype on
filetype plugin on
filetype indent on

set list lcs=tab:\¦\   

if has("autocmd")  " go back to where you exited
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

if has('mouse')
    set mouse=a
    set selectmode=mouse,key
    set nomousehide
endif

set autoindent
set modeline
set cursorline
set cursorcolumn

set shiftwidth=4
set tabstop=4
set softtabstop=4

set showmatch
set matchtime=0
set nobackup
set nowritebackup
set directory=~/.nvim/.swapfiles//

if has('nvim')
  set termguicolors
  set ttimeout
  set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"conceal
set conceallevel=2
set concealcursor=""

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"按缩进或手动折叠
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldcolumn=0 "设置折叠区域的宽度
set foldlevelstart=200
set foldlevel=200  " disable auto folding
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vnoremap <Space> zf


set smartcase
set ignorecase
set nohlsearch
set incsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()
au FileType vue syntax sync minlines=500

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env python3"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(2, cfg)
    endif
    normal ''
endfunction


source ~/.config/nvim/config/airline.vim
source ~/.config/nvim/config/python.vim
source ~/.config/nvim/config/tagbar.vim
source ~/.config/nvim/config/nerdtree.vim
source ~/.config/nvim/config/syntastic.vim
source ~/.config/nvim/config/completion.vim
source ~/.config/nvim/config/ultisnips.vim
source ~/.config/nvim/config/rainbow_brackets.vim
source ~/.config/nvim/config/latex.vim
source ~/.config/nvim/config/vim-go.vim
source ~/.config/nvim/config/pandoc.vim
source ~/.config/nvim/config/scss.vim
source ~/.config/nvim/config/querycommand.vim
source ~/.config/nvim/config/localvimrc.vim
source ~/.config/nvim/config/ctrlp.vim
source ~/.config/nvim/config/vim-notes.vim
source ~/.config/nvim/config/indentLine.vim
source ~/.config/nvim/config/noplaintext.vim
source ~/.config/nvim/config/json.vim
source ~/.config/nvim/config/terminal.vim

" Load local config if exists
if filereadable(expand("~/.nvim/config/local.vim"))
	source ~/.nvim/config/local.vim
endif

