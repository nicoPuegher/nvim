return {
	"nvim-tree/nvim-tree.lua",
	version = "*", -- Latest stable version
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true }, -- Optional plugin
	},
	config = function() -- Executed when nvim-tree loads
		-- Disable Netrw (default file explorer)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Require and setup nvim-tree
		local tree = require("nvim-tree") -- Loaded, no need for protected call
		tree.setup({
			-- Change default arrows in file explorer
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
		})

		-- Set custom keys
		local keymap = vim.keymap -- For conciseness
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find current file" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
	end,
}
