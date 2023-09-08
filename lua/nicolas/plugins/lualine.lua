return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional plugin to add icons
	},
	config = function() -- Executed when lualine.nvim loads
		-- Loaded, no need for protected call
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Setup lualine.nvim
		lualine.setup({
			sections = {
				-- Set a custom right-side lualine
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
