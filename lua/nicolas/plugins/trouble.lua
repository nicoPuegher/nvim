return {
	'folke/trouble.nvim',
	branch = 'dev',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = require('nicolas.plugins.keymaps.trouble_keymaps'),
	opts = {},
}
