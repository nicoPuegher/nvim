return {
	"jose-elias-alvarez/null-ls.nvim",
	version = "*", -- Latest stable version
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required, lib of simplified lua fns
	},
	config = function () -- Executed when null-ls.nvim loads
		local null_ls = require("null-ls") -- Loaded, no need for protected call

		-- For conciseness
		local formatting = null_ls.builtins.formatting

		-- Setup null-ls.nvim
		null_ls.setup({
			-- Setup formatters
			sources = {
				formatting.stylua, -- Lua
			},
		})
	end,
}
