-- For conciseness
local opt = vim.opt

-- User interface
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.signcolumn = 'yes'
opt.wrap = false
opt.guicursor = { 'a:block' }
opt.cursorline = true
opt.termguicolors = true

-- Indentation
opt.smartindent = true
opt.breakindent = true

-- Window management
opt.splitright = true
opt.splitbelow = true

-- Command line
opt.inccommand = 'split'

-- Timer
opt.updatetime = 250

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Backup
opt.swapfile = false
