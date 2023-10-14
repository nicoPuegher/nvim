return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
      	'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
		'folke/neodev.nvim',
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local neodev = require('neodev')

		mason.setup()
		mason_lspconfig.setup()
		neodev.setup()
	end,
}
