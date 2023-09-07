return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x", -- Specified in documentation
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required, lib of simplified lua fns
	},
	config = function() -- Executed when telescope.nvim loads
		local telescope = require("telescope") -- Loaded, no need for protected call

		-- Setup telescope.nvim
		telescope.setup({})
	end,
}
