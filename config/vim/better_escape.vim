inoremap <expr> k EscapeInsertOrNot()

function! EscapeInsertOrNot() abort
  " If k is preceded by j, then remove j and go to normal mode.
  let line_text = getline('.')
  let cur_ch_idx = CursorCharIdx()
  let pre_char = CharAtIdx(line_text, cur_ch_idx-1)
  echom 'pre_char is:' pre_char
  if pre_char ==# 'j'
    return "\b\e"
  else
    return 'k'
  endif
endfunction

" split(line_text, '\zs') can split string into separate char
"汉字测试这是一些汉字 some charjust
" byte index of 这 is 14 (using col('.'))

" let my_str = '你好吗'
" strcharpart(my_str, 0, 1) is the first char in my_str (it is like my_str[0] in Python)
" strcharpart(my_str, 1, 1) is the second char in my_str

" let ch = '你'
" byteidx(ch, 1) is the number of byte in UTF-8 encoding for ch (suppose
" that the character encoding is UTF-8)

function! CharAtIdx(str, idx) abort
  " Get char at idx from str. Note that this is based on character index
  " instead of the byte index.
  return strcharpart(a:str, a:idx, 1)
endfunction

function! CursorCharIdx() abort
  " A more concise way to get character index under cursor.
  let cursor_byte_idx = col('.')
  if cursor_byte_idx == 1
    return 0
  endif

  let pre_cursor_text = getline('.')[:col('.')-2]
  return strchars(pre_cursor_text)
endfunction

