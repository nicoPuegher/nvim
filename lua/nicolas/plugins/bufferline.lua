return {
	"akinsho/bufferline.nvim",
	version = "*", -- Specified in documentation
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional plugins to add icons
	opts = { -- Substitutes plugin.config(), executes when bufferline.nvim loads
		-- Set custom options
		options = {
			mode = "tabs", -- Bufferline is now a tabline, only shows tabpages
		},
	},
}
