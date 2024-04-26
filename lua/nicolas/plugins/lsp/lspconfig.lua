return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim', opts = {} },
		'folke/neodev.nvim',
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local neodev = require('neodev')
		local lspconfig = require('lspconfig')
		local lsp_settings = require('nicolas.plugins.settings.lsp_settings')
		require('nicolas.plugins.keymaps.lspconfig_keymaps')

		mason.setup()
		mason_lspconfig.setup(lsp_settings.lsp_settings())
		neodev.setup()
		mason_lspconfig.setup_handlers(lsp_settings.lsp_handlers(lspconfig))
	end,
}
