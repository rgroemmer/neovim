local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- disable netrw acording to nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.nvim_tree_respect_buf_cwd = 1

-- system configuration
cmd 'colorscheme onedark'
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

vim.opt.listchars = 'tab:  ,trail:λ'
opt.list = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 250
opt.undofile = true

g.mapleader = " "

-- set termguicolors to enable highlight groups
opt.termguicolors = true
opt.showmode = false
opt.termguicolors = true

opt.spelllang = "en-gb"

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

local async = require "plenary.async"

-- load theme
require('onedark').setup {
  style = 'cool',
  highlights = {
    ["@variable"] = {fg = '$red'}
  }
}
require('onedark').load()
