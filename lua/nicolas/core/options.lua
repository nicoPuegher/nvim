local opt = vim.opt -- For conciseness

-- Tabs and indentations
opt.tabstop = 4 -- Make <Tab> 4 character cells wide
opt.shiftwidth = 4 -- Use <Tab> for indentation
opt.softtabstop = 0 -- Default prevention of unintentional white space
opt.expandtab = false -- Default prevention of unintentional white space

-- Window management
opt.splitright = true -- Add vertical window split to the right
opt.splitbelow = true -- Add horizontal window split to the bottom
