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

		-- Open and clouse nvim-dap-ui automatically when debugging starts or ends
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Custom keymaps to control debugging
		keymap.set("n", "<localleader>do", dap.step_over, { desc = "Debugging: Step over" })
		keymap.set("n", "<localleader>di", dap.step_into, { desc = "Debugging: Step into" })
		keymap.set("n", "<localleader>dO", dap.step_out, { desc = "Debugging: Step out" })
	end,
}
