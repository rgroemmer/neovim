" ----------------------------# default configuration #----------------------------

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "
inoremap jk <Esc>
vnoremap jk <Esc>
" disable esc to learn above
imap <Esc> <NOP>

" Security
set modelines=0

" Show line numbers 
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8
scriptencoding utf-8

set timeoutlen=500

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Cursor line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Allow hidden buffers
set hidden

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

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Color scheme (terminal)
colorscheme onedark
set t_Co=256
set background=dark

" Make space for diagnostic signs
set signcolumn=yes

"filetypes
au BufRead,BufNewFile *.nix set filetype=nix

" highlight yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" ----------------------------# custom configuration #----------------------------

" plugin mappings
map <leader>ee :NvimTreeToggle<CR>
map <leader>t :BufferLinePick<CR>
map <leader>l :BufferLineCycleNext<CR>
map <leader>h :BufferLineCyclePrev<CR>
nnoremap <Leader>e <C-w>w

map <leader>y :! go mod tidy <CR>:LspRestart<CR><CR>