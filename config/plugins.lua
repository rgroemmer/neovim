-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- theme 
require('onedark').setup {
  style = 'deep',
  transparent = true;
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
}
require('onedark').load()
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true