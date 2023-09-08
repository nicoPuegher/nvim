return {
	"akinsho/bufferline.nvim",
	version = "*", -- Specified in documentation
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional plugin to add icons
	opts = { -- Substitutes plugin.config(), executed when bufferline.nvim loads
		-- Set custom options
		options = {
			mode = "tabs", -- Bufferline is now a tabline, only shows tabpages
		},
	},
}
