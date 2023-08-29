return {
	"jose-elias-alvarez/null-ls.nvim",
	version = "*", -- Latest stable version
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required, lib of simplified lua fns
	},
	config = function() -- Executed when null-ls.nvim loads
		local null_ls = require("null-ls") -- Loaded, no need for protected call

		-- For conciseness
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local clear_autocmds = vim.api.nvim_clear_autocmds
		local create_autocmd = vim.api.nvim_create_autocmd
		local format = vim.lsp.buf.format

		-- Setup null-ls.nvim
		null_ls.setup({
			-- Setup formatters
			sources = {
				formatting.stylua, -- Lua
			},

			-- Setup sync format on save (blocks nvim until results are applied)
			on_attach = function(client, bufnr)
				-- Check if current client supports formatting
				if client.supports_method("textDocument/formatting") then
					-- Clear and create autocommands before formatting
					clear_autocmds({ group = augroup, buffer = bufnr })
					create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						-- Then, call format
						callback = function()
							format({
								bufnr = bufnr,
								-- Pass all formatting requests to null-ls
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
