return {
	{ 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
	{
		'numToStr/Comment.nvim',
		opts = require('nicolas.plugins.settings.comment_settings'),
		lazy = false,
	},
}
