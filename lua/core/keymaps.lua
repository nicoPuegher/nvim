-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = '[F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to clipboard' })
