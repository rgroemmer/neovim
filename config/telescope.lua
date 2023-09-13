local builtin = require('telescope.builtin')

-- keymappings //

-- seraching
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>t', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>l', '<CMD>NvimTreeCycleNext<CR>')
vim.keymap.set('n', '<leader>h', '<CMD>NvimTreeCyclePrev<CR>')

vim.keymap.set('n', '<leader>h', '<CMD>! go mod tidy <CR>:LspRestart<CR><CR>')
