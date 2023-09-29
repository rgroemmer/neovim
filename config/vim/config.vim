" Default configuration
let mapleader = " "
syntax on
set number
set ttyfast " Rendering
set ruler                         " Show file stats
set visualbell                    " Blink cursor on error instead of beeping (grr)
set encoding=utf-8                " Encoding
scriptencoding utf-8
set timeoutlen=700
set wrap
set signcolumn=yes                " Make space for diagnostic signs

" Format
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set scrolloff=3                   " Cursor motion
set backspace=indent,eol,start    " Make backspace work like normal
set matchpairs+=<:>               " use % to jump between pairs
set laststatus=2
set showmode
set showcmd

" Search
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
set undofile

" Other
autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()

au BufRead,BufNewFile *.nix set filetype=nix "filetypes
au BufRead,BufNewFile *.tfvars set filetype=terraform "filetypes

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
