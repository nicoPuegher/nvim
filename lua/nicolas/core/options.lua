local opt = vim.opt -- For conciseness

-- UI
opt.number = true -- Display line numbers
opt.relativenumber = true -- Display relative line numbers to current line
opt.signcolumn = "yes" -- Display sign column to avoid content shifting
opt.guicursor = { "a:block" } -- Use block cursor always
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- Enable 24-bit RGB color in the terminal

-- Tabs and indentations
opt.tabstop = 4 -- Make <Tab> 4 character cells wide
opt.shiftwidth = 4 -- Use <Tab> for indentation
opt.smartindent = true

-- Window management
opt.splitright = true -- Add vertical window split to the right
opt.splitbelow = true -- Add horizontal window split to the bottom

-- Miscellaneous
opt.swapfile = false -- Do not use swap files
opt.scrolloff = 10 -- Minimal number of screen lines to keep above or below
opt.ignorecase = true -- Ignore case in search pattern
opt.smartcase = true -- Override ignorecase when writing mixed case
opt.breakindent = true -- Respect current indent when wrapping
