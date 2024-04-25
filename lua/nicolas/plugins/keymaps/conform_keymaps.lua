local map = require('nicolas.helper.map')

local function conform_keymaps(conform)
	map({ 'n', 'v' }, '<leader>cf', function()
		conform.format({
			lsp_fallback = true,
			timeout_ms = 500,
		})
	end, {}, '[C]ode [F]ormat')
end

return conform_keymaps
