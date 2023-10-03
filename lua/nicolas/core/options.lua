local opt = vim.opt -- For conciseness

-- UI
opt.number = true -- Display line numbers
opt.relativenumber = true -- Display relative line numbers to current line
opt.signcolumn = "yes" -- Display sign column to avoid content shifting
opt.wrap = false -- Disable line wrapping
opt.guicursor = "" -- Use fat cursor always
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- Enable 24-bit RGB color in the terminal

-- Tabs and indentations
opt.tabstop = 4 -- Make <Tab> 4 character cells wide
opt.shiftwidth = 4 -- Use <Tab> for indentation
opt.softtabstop = 0 -- Default prevention of unintentional white space
opt.expandtab = false -- Default prevention of unintentional white space

-- Window management
opt.splitright = true -- Add vertical window split to the right
opt.splitbelow = true -- Add horizontal window split to the bottom

-- Miscellaneous
opt.swapfile = false -- Do not use swap files
