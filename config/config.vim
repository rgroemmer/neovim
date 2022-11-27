" default configuration
:let mapleader = ' ' 
:inoremap ii <ESC>

set timeoutlen=500
"set signcolumn=yes

" map plugins with leader key
map <leader>e :NvimTreeToggle<CR>
map <leader>t :BufferLinePick<CR>

"faster scrolling
noremap <S-j> 3jzz
noremap <S-k> 3kzz

"buffer
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>

"finder
nmap ; :FzfLua files<CR>

"save undo / redo across sessions
set undofile
set undodir=~/.vim/undo

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set mouse=

"synatx
syntax enable
set number
set autoread
set encoding=UTF-8

set cursorline
set laststatus=2
set scrolloff=8
set startofline

"filetypes
au BufRead,BufNewFile *.nix set filetype=nix

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
set hidden
set nobackup
set nowritebackup
set noswapfile
set noshowmode
"automatically source .vimrc from project folder
set exrc
set secure

highlight IndentBlanklineChar guifg=grey25 gui=nocombine

"vim smoothie
nmap <C-d> <Plug>(SmoothieDownwards)
nmap <C-f> <Plug>(SmoothieUpwards)
let g:smoothie_no_default_mappings = 1

set signcolumn=yes

" COQ
let g:coq_settings = { 'xdg': v:true, "keymap.recommended": v:true, "auto_start": "shut-up", 'keymap.eval_snips': '<leader>j', "keymap.repeat": 'c-r', "keymap.jump_to_mark": '<space><CR>' }