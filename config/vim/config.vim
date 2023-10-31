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


" v-snip keybindins
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
