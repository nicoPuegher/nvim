return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	build = { ":TSUpdate" }, -- Specified in documentation
	config = function() -- Executed when nvim-treesitter loads
		local treesitter = require("nvim-treesitter.configs") -- Loaded, no need for protected call

		-- Setup treesitter
		treesitter.setup({
			ensure_installed = { "lua", "python", "c" },
			highlight = {
				enable = true,
			},
		})
	end,
}
