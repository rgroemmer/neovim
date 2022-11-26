local lsp = require "lspconfig"

-- theme 
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- status bar
require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabeld = true,
    component_separators = '|',
    section_seperators = '|',
  },
})

-- tab-manager
require('bufferline').setup({})

