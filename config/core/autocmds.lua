-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Set filetypes when buf event
autocmd({'BufRead', 'BufNewFile',}, {
  pattern = "*.nix",
  callback = function()
    vim.api.nvim_command('set filetype=nix')
  end
})

autocmd({'BufRead', 'BufNewFile',}, {
  pattern = "*.tfvars",
  callback = function()
    vim.api.nvim_command('set filetype=terraform')
  end
})

autocmd({'BufEnter'}, {
  pattern = "*",
  callback = function()
    require('lazygit.utils').project_root_dir()
  end
})
