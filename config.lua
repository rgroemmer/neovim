-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lsp = require "lspconfig"

vim.g.coq_settings = {
  xdg = true,
  auto_start = 'shut-up',
}
require 'coq'

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

-- statusbar
vim.opt.showmode = false

require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
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

-- comments (keymap: gc, gciw)
require('Comment').setup({})

-- surround
require("nvim-surround").setup()

-- explorer
require('nvim-tree').setup({
  --open_on_setup_file = true,
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["ii"] = actions.close,
            },
        },
    },
})
