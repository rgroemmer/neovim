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

autocmd({'BufWritePost'}, {
  pattern = "*.go",
  callback = function()
    -- Hole den vollständigen Pfad der aktuellen Datei
    local filename = vim.fn.expand("%:p")
    -- Baue den goimports Befehl
    local command = "goimports -w " .. filename
    -- Führe den goimports Befehl aus
    vim.api.nvim_command("silent ! " .. command)
    -- Lade die Datei neu, um die von goimports vorgenommenen Änderungen zu sehen
    vim.api.nvim_command("edit")
  end,
})
