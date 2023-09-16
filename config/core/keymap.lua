local builtin = require('telescope.builtin')

-- Keymappings //

-- Seraching
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Explorer
vim.keymap.set('n', '<leader>t', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>l', '<CMD>NvimTreeCycleNext<CR>')
vim.keymap.set('n', '<leader>h', '<CMD>NvimTreeCyclePrev<CR>')

-- BetterEscape
vim.keymap.set('n', '<leader>qq', ':qa!<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Go
vim.keymap.set('n', '<leader>gt', '<CMD>! go mod tidy <CR>:LspRestart<CR>')
