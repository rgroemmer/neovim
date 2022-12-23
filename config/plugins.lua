-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- theme 
require('onedark').setup {
  style = 'darker',
  colors = {
    red = "#e06c75",
    grey = "#7a7f89",
  },
   -- Plugins Config --
  diagnostics = {
    darker = false, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,    -- use background color for virtual text
  },
  highlights = {
    Whitespace = {fg = "#2B313B"},
    NonText = {fg = "#2B313B"},
  },
}

require('onedark').load()
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- explorer
require('nvim-tree').setup({
  -- open_on_setup_file = true,
  view = {
    mappings = {
      list = {
        { key = "d", action = "cd" },
      },
    },
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
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" }
})

require("which-key").setup {
  triggers_blacklist = {
    i = { "i" },
  },
}

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
