-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = '[F]ile [E]xplorer' })

-- Clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to clipboard' })
