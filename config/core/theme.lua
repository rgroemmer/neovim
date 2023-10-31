require('onedark').setup {
  style = 'cool',
  highlights = {
    ["@variable"] = {fg = '$red'},
    SpellBad = {fg = '$red', fmt = "none", sp = "none"},
    SpellRare = {fg = '$yellow', fmt = "none", sp = "none"},
  }
}
require('onedark').load()
