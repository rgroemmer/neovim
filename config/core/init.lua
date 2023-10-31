local async = require "plenary.async"

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Configuration --

-- Global
cmd 'colorscheme onedark'
g.mapleader = " "

-- Disable netrw acording to nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.nvim_tree_respect_buf_cwd = 1

-- System configuration
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

-- List chars
opt.list = true
vim.opt.listchars = 'tab:  ,trail:λ'

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- Layout
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 350
opt.undofile = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true

-- set termguicolors to enable highlight groups
opt.termguicolors = true
opt.showmode = false

opt.spelllang = "en"

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
