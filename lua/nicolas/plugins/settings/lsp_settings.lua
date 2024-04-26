local utils = require('nicolas.utils')

local function lsp_settings()
	return {
		ensure_installed = vim.tbl_keys(utils.servers),
	}
end

local function lsp_handlers(lspconfig)
	return {
		function(server_name)
			local server = utils.servers[server_name] or {}
			lspconfig[server_name].setup({
				capabilities = vim.tbl_deep_extend('force', {}, utils.capabilities, server.capabilities or {}),
				on_attach = utils.attach_lsp,
				settings = utils.servers[server_name],
				filetypes = (utils.servers[server_name] or {}).filetypes,
			})
		end,
	}
end

return {
	lsp_settings = lsp_settings,
	lsp_handlers = lsp_handlers,
}
