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
	config = function() -- Executed when nvim-dap loads
		-- For conciseness
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
		local keymap = vim.keymap

		-- Setup nvim-dap-ui
		dapui.setup()

		-- Setup nvim-dap-python
		dap_python.setup(python_path)
	end,
}
