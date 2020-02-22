let g:python_host_prog='/usr/bin/python3'

set nocompatible
filetype off
let mapleader=";"

set relativenumber number " 相对行号
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number

autocmd InsertLeave * :set relativenumber

call plug#begin("~/.config/nvim/bundle")
" Plugin List
Plug 'bigeagle/molokai'
Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdtree'
"Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'kien/rainbow_parentheses.vim'

Plug 'mattn/emmet-vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'zaiste/tmux.vim'
Plug 'lepture/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'npm install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'npm install --frozen-lockfile'}

Plug 'ervandew/supertab'

Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'tell-k/vim-autopep8'
Plug 'jrosiek/vim-mark'
Plug 'airblade/vim-gitgutter'
call plug#end()

" UI
if !exists("g:vimrc_loaded")
	if has("nvim")
		set termguicolors
	endif
	let g:molokai_original = 1
	colorscheme molokai
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

set completeopt=longest,menu " preview
let g:SuperTabDefaultCompletionType = "<c-n>"
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
set directory=/tmp/.swapfiles//

if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

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

noremap<leader>e $
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>it :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>

" set clipboard=unnamedplus
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p

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

set smartcase
set ignorecase
set hlsearch
set incsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>
nmap <leader>hl :set hlsearch! hlsearch?<CR>
au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()

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

" --- Plugin Configs ---------
let g:tagbar_width = 30
nmap tb :TagbarToggle<cr>

let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

autocmd Filetype json let g:indentLine_enabled = 0
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

" - Lightline -------------------
set noshowmode
set laststatus=2
let g:lightline = {
	\   'active': {
	\     'left':[ [ 'mode', 'paste' ],
	\              [ 'cocstatus', 'readonly', 'filename', 'modified' ]
	\     ]
	\   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
	\ },
	\ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
	\}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
	\}

" ----------------------------

" Completion and echodoc
set shortmess+=c
set updatetime=300
set signcolumn=yes
set completeopt=noinsert,menuone,noselect

let g:coc_auto_copen=1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <leader><space> coc#refresh()


"nmap <silent> <leader>g <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <leader>d <Plug>(coc-declaration)
nmap <silent> <leader>g <Plug>(coc-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <c-p> :CocList<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold * silent call CocActionAsync('highlight')

highlight CocErrorSign ctermfg=215 guifg=#ffaf5f
highlight default CocHighlightText guibg=#767676 ctermbg=243 cterm=underline

" ----------------------------

" - NerdTree -----------------
nmap tt :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=0
let NERDTreeMouseMode=2

let NERDTreeWinSize=25
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI=0
let NERDTreeDirArrows=1
" ----------------------------

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" - python and jedi ----------
let python_highlight_all = 1
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python setlocal cc=80
" ----------------------------

" - rainbow_parentheses ------
let g:rbpt_colorpairs = [
	\ [158, '#00ceb3'],
	\ [081, '#00a3ff'],
	\ [214, '#ff8d00'],
	\ [123, '#3fffc9'],
	\ [045, '#29b9ec'],
	\ [190, '#bfec29'],
	\ [208, '#ffad00'],
	\ [117, '#48bde0'],
	\ ]

let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee RainbowParenthesesLoadSquare
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee,scss  RainbowParenthesesLoadBraces
" ----------------------------
" - ALE ---------------------
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'python': ['flake8'],
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_python_flake8_options = "--ignore=E501,F401,E226,E741"
" Load local config if exists
if filereadable(expand("~/.config/nvim/local.vim"))
	source ~/.vim/config/local.vim
endif
