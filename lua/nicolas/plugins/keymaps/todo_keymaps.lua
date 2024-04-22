local map = require('nicolas.helper.map')

local function todo_keymaps()
	map('n', '<leader>nt', '<cmd>TodoTelescope<CR>', {}, '[N]otes [T]elescope')
	map('n', '<leader>nq', '<cmd>TodoQuickFix<CR>', {}, '[N]otes [Q]uickfix')
end

return todo_keymaps
