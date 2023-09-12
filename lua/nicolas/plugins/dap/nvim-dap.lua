return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = { -- Loads on key
		{
			"<localleader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ desc = "Debugging: Toggle breakpoint" },
		},
		{
			"<localleader>dc",
			function()
				require("dap").continue()
			end,
			{ desc = "Debugging: Continue" },
		},
	},
}
