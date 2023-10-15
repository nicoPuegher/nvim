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

		local utils = require('nicolas.utils')
		local lspconfig = require('lspconfig')

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(utils.servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = utils.capabilities,
					on_attach = utils.attach_lsp,
					settings = utils.servers[server_name],
					filetypes = (utils.servers[server_name] or {}).filetypes,
				})
			end
		})
	end,
}
