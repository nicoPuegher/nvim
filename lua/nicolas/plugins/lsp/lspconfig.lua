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
		local utils = require('nicolas.utils')
		local lspconfig = require('lspconfig')
		require('nicolas.plugins.keymaps.lspconfig_keymaps')

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(utils.servers),
		})

		neodev.setup()

		mason_lspconfig.setup_handlers({
			function(server_name)
				local server = utils.servers[server_name] or {}
				lspconfig[server_name].setup({
					capabilities = vim.tbl_deep_extend('force', {}, utils.capabilities, server.capabilities or {}),
					on_attach = utils.attach_lsp,
					settings = utils.servers[server_name],
					filetypes = (utils.servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
