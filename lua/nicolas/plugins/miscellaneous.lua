return {
	{ 'tpope/vim-sleuth', event = { 'BufReadPre', 'BufNewFile' } }, -- Detect tabstop and shiftwidth automatically
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		opts = require('nicolas.plugins.settings.comment_settings'),
		--lazy = false,
	}, -- Add and toggle comments quickly
}
