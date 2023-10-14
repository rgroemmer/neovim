-- disable netrw acording to nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

-- system configuration
vim.cmd 'colorscheme onedark'
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.termguicolors = true

local async = require "plenary.async"

-- Lua
require('onedark').setup {
    style = 'cool'
  highlights = {
    ["@variable"] = {fg = '$red'}
  }
}
require('onedark').load()
