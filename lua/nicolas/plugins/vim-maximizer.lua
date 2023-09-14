return {
	"szw/vim-maximizer",
	keys = { -- Define keymap through lazy.nvim (Loads on key)
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize window split" } },
	},
}
