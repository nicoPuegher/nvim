return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local key = require('which-key')
		local key_settings = require('nicolas.plugins.settings.key_settings')

		key.setup(key_settings())

		key.register({
			['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
			['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
			['<leader>d'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },
			['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
			['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
			['<leader>n'] = { name = '[N]otes', _ = 'which_key_ignore' },
			['<leader>q'] = { name = '[Q]uickfix', _ = 'which_key_ignore' },
			['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
			['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
			['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
			['<leader>sg'] = { name = '[G]it', _ = 'which_key_ignore' },
		})
	end,
}
