-- general config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd 'colorscheme onedark'
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append "trail:λ"

local async = require "plenary.async"
