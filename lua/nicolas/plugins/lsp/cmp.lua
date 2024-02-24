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
		local mappings = require('nicolas.helper.cmp-mappings').cmp_mappings

		luasnip.config.setup({})

		loaders.lazy_load()

		---@diagnostic disable-next-line missing-fields
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert(mappings(cmp, luasnip)),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'path' },
			},
		})
	end,
}
