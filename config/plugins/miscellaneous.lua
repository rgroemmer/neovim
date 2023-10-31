-- autoclose brackets
require('nvim-autopairs').setup({})

-- statusbar
require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
})

-- lazygit
require('telescope').load_extension('lazygit')

