-- statusbar
require('lualine').setup({
  options = {
    theme = 'catppuccin',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_c = {{'filename', path = 1,}}
  },
})

