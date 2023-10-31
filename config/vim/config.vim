" Default configuration
"syntax on

"set ttyfast " Rendering
"set visualbell                    " Blink cursor on error instead of beeping (grr)
"set encoding=utf-8                " Encoding
"scriptencoding utf-8
"set wrap

" Format
"set formatoptions=tcqrn1
"set noshiftround
"set scrolloff=3                   " Cursor motion
"set backspace=indent,eol,start    " Make backspace work like normal
"set matchpairs+=<:>               " use % to jump between pairs
"set showcmd

" Search
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set showmatch
map <leader>c :let @/=''<cr> " clear search

" Other
autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()

au BufRead,BufNewFile *.nix set filetype=nix "filetypes
au BufRead,BufNewFile *.tfvars set filetype=terraform "filetypes

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" v-snip keybindins
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
