return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui", -- Adds UI to have a better debugging experience
		"mfussenegger/nvim-dap-python", -- Python adapter for debugpy
	},
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
