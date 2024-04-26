-- Leader keys
vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = '[F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selection Downwards' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move Selection Upwards' })

-- Cursor movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half Page Jump [D]ownwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half Page Jump [U]pwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center Search Highlight' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center Search Highlight' })

-- Clipboard
vim.keymap.set('n', '<leader>y', '"+Y', { desc = '[Y]ank Line To Clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank Selection To Clipboard' })

-- Diagnostic keyvim.keymap.sets
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic Message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev [D]iagnostic Message' })
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = '[D]iagnostic [M]essages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = '[D]iagnostic [Q]uickfix' })
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', { desc = 'Next Quickfix List Item' })
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', { desc = 'Prev Quickfix List Item' })
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>', { desc = '[Q]uickfix List [O]pen' })
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<CR>', { desc = '[Q]uickfix List [C]lose' })

-- Command line
vim.api.nvim_set_keymap('c', '<C-R>', '<C-F><Up>', { noremap = true, desc = 'Search Command History' })

-- Helper
require('nicolas.helper.replace')
