-- explorer
require('nvim-tree').setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = {
        quit_on_open = true,
    },
  },
   git = {
     ignore = false;
   },
  diagnostics = {
    enable = true;
    show_on_dirs = true;
  },
})

-- tab manager
require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})

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

require('telescope').load_extension('lazygit')
