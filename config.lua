local lsp = require "lspconfig"

-- treesitter
require('nvim-treesitter.configs').setup {
  auto_install = false,
  highlight = {
    enable = true,
  },
}

-- theme 
require('onedark').setup {
  style = 'darker'
}
require('onedark').load()

-- indent-blankline
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require('indent_blankline').setup({
  char = '▏',
  show_trailing_blankline_indent = true,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})


