filetype off
call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdcommenter'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/syntastic'
	Plug 'mattn/emmet-vim'

" Syntax and linters
	Plug 'rust-lang/rust.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'nvie/vim-flake8'
	Plug 'vim-erlang/vim-erlang-runtime'
	Plug 'tell-k/vim-autopep8'
	Plug 'elixir-editors/vim-elixir'
	Plug 'mitsuhiko/vim-jinja'
	Plug 'fatih/vim-go'
	Plug 'tomlion/vim-solidity'
call plug#end()
" Filetype indent with plugin possibility load after vundle to avoid errors
filetype indent plugin on

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmode=longest,list
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Set history commandline (q:) history size
set history=10000
set viminfo+=:10000

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Allow switchin between tabs without save
set hidden
" When using tab convert into spaces/tabstop/shiftwidth
set expandtab
" Set tabsize
set shiftwidth=4
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
"set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Mappings
nnoremap <C-L> :GFiles<cr>
nnoremap <C-p> :FZF<cr>

" Enter after search will cancel highlighting
nnoremap <cr> :noh<cr><cr>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END