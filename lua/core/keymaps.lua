-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = '[F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<leader>vp', '"_dP', { desc = '[V]oid [P]aste' })
vim.keymap.set(
    'n',
    '<leader>r',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = '[R]eplace under cursor' }
)

-- Cursor movement
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page jump [D]own' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page jump [U]p' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center search highlight down' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center search highlight up' })

-- Clipboard
vim.keymap.set('n', '<leader>y', '"+Y', { desc = '[Y]ank line to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to clipboard' })
vim.keymap.set('v', '<leader>vd', '"_d', { desc = '[V]oid [D]elete' })

-- Diagnostics
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev [D]iagnostic message' })
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = '[D]iagnostic [M]essages' })

-- Quickfix
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setqflist, { desc = '[Q]uickfix [D]iagnostics' })
vim.keymap.set('n', '<leader>qo', '<cmd>copen<CR>', { desc = '[Q]uickfix [O]pen' })
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<CR>', { desc = '[Q]uickfix [C]lose' })
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix item' })
