-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- explorer
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  open_on_setup = false,
  open_on_setup_file = false,
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- treesitter
require('nvim-treesitter.configs').setup {
  -- they are managed by nix
  auto_install = false,
  --ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    -- prevents lagging in large files
    max_file_lines = 1000,
  },
}

require('treesitter-context').setup {
  enable = true,
  throttle = true,
}




-- theme 
require('onedark').setup {
  style = 'darker',
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
vim.opt.list = false
vim.opt.listchars:append "eol:↴"

require('indent_blankline').setup({
  show_current_context = true,
  show_current_context_start = true,
})

-- comments (keymap: gc, gciw)
require('Comment').setup({})

-- surround
require("nvim-surround").setup()

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

-- autoclose brackets
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require("which-key").setup {
}

local async = require "plenary.async"
require('refactoring').setup({})

require'nvim-web-devicons'.setup()
