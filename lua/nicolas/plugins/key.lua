return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local key = require('which-key')
		local key_settings = require('nicolas.plugins.settings.key_settings')

		key.setup(key_settings.key_settings())
		key.register(key_settings.key_register())
	end,
}
