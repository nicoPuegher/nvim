-- For conciseness
local opt = vim.opt

-- User interface
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.guicursor = { 'a:block' }
opt.cursorline = true
opt.termguicolors = true

-- Indentation
opt.smartindent = true

-- Window management
opt.splitright = true
opt.splitbelow = true

-- Miscellaneous
opt.swapfile = false
opt.scrolloff = 10
opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
