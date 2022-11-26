" default configuration
:let mapleader = ' ' 
:inoremap ii <ESC>

syntax enable
set number
set encoding=UTF-8
" tabs and spaces
set expandtab
set tabstop=2
set shiftwidth=2

" searching
set ignorecase
set smartcase
set cursorline
set laststatus=2
set startofline

set updatetime=300
" set timeout for double keymaps
set timeoutlen=250


" map plugins with leader key
map <leader>e :NvimTreeFocus<CR>
map <leader>t :BufferLinePick<CR>

set completeopt=menu,menuone,noselect
