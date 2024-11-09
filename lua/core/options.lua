-- User interface
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false

-- Cursor
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Buffer
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'

-- Window management
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Command line
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
