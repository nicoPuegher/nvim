vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = 'Open [F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Move selected line upwards
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv") -- Move selected line downwards
