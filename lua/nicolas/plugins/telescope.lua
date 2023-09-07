return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x", -- Specified in documentation
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required, lib of simplified lua fns
	},
	config = function() -- Executed when telescope.nvim loads
		-- Loaded, no need for protected call
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- Setup telescope.nvim
		telescope.setup({})

		-- Set custom keys
		local keymap = vim.keymap -- For conciseness
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find a string in cwd" })
	end,
}
