return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{ 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'rafamadriz/friendly-snippets',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local loaders = require('luasnip.loaders.from_vscode')
		local cmp_settings = require('nicolas.plugins.settings.cmp_settings')

		luasnip.config.setup({})

		loaders.lazy_load()

		cmp.setup(cmp_settings(luasnip, cmp))
	end,
}
