return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional plugin to add icons
	},
	config = function() -- Executed when lualine.nvim loads
		-- Loaded, no need for protected call
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({})
	end,
}
