vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = 'Open [F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = '(Vm) - Move selected line downwards [J]' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = '(Vm) - Move selected line upwards [K]' })

-- Cursor movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = '(Nm) - Half page jump <C>[D]ownwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = '(Nm) - Half page jump <C>[U]pwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep cursor in the middle for next item in highlight search' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep cursor in the middle for prev item in highlight search' })

-- Clipboard
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank current line to system clipboard including EOL' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selected text to system clipboard' })
vim.keymap.set('n', '<leader>d', '"*dd', { desc = '[D]elete current line to system clipboard' })
vim.keymap.set('v', '<leader>d', '"*dd', { desc = '[D]elete selected lines to system clipboard' })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', { desc = 'Go to next item in quickfix list <C>[J]' })
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', { desc = 'Go to prev item in quickfix list <C>[K]' })
vim.keymap.set('n', '<leader>co', '<cmd>copen<CR>', { desc = '[C]ompiler [O]pen (quickfix list)' })
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<CR>', { desc = '[C]ompiler [C]lose (quickfix list)' })
