return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local key = require('which-key')

		key.setup()
	end,
}
