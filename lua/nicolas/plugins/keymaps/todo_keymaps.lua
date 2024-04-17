local map = require('nicolas.helper.map')

local opts = {
	identifier = 'Todo: ',
}

local function todo_keymaps()
	map('n', '<leader>tt', '<cmd>TodoTelescope<CR>', opts, '[T]odo [T]elescope')
	map('n', '<leader>tq', '<cmd>TodoQuickFix<CR>', opts, '[T]odo [Q]uickfix list')
end

return todo_keymaps
