-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd 'colorscheme onedark'

-- explorer
require('nvim-tree').setup({
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
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
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
--local npairs = require('nvim-autopairs')
--npairs.setup({
--  disable_filetype = { "TelescopePrompt" , "vim" },
--  map_bs = false,
--  map_cr = false,
--})

require("which-key").setup {
  triggers_blacklist = {
    i = { "i" },
  },
}
local wk = require('which-key')

wk.register({
  f = {
    name = "find", -- optional group name
    f = { "find files" },
    g = { "ripgrep" },
    a = { "format file" },
  }}, { prefix = "<leader>" }
)

wk.register({
  g = {
    d = { "goto definition" },
    D = { "goto declaration" },
    r = { "goto references" },
    t = { "goto type definition" },
  }}
)

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

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "trail:λ"

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

local async = require "plenary.async"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


