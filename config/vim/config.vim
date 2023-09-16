" default configuration
let mapleader = " "
syntax on
set number
" Show file stats
set ruler
" Blink cursor on error instead of beeping (grr)
set visualbell
" Encoding
set encoding=utf-8
scriptencoding utf-8

" set timeoutlen=500

" Whitespace
set wrap
"set textwidth=79
" set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" Cursor motion
set scrolloff=3
" Make backspace work like normal
set backspace=indent,eol,start

"set matchpairs+=<:> " use % to jump between pairs
"runtime! macros/matchit.vim

" Cursor line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Allow hidden buffers
" set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

set undofile

" Make space for diagnostic signs
set signcolumn=yes

"filetypes
au BufRead,BufNewFile *.nix set filetype=nix

" highlight yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

