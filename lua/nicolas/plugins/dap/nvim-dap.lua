return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui", -- Adds UI to have a better debugging experience
		"mfussenegger/nvim-dap-python", -- Python adapter for debugpy
		"mxsdev/nvim-dap-vscode-js", -- Javascript adapter for js-debug-adapter
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
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
		local dap_javascript = require("dap-vscode-js")
		local javascript_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
		local keymap = vim.keymap

		-- Setup nvim-dap-ui
		dapui.setup()

		-- Setup nvim-dap-python
		dap_python.setup(python_path)

		-- Setup codelldb (C adapter)
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- Setup js-debug-adapter
		dap_javascript.setup({
			debugger_path = javascript_path,
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		-- Config codelldb (C debugger)
		dap.configurations.c = {
			{
				-- Single file
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				-- File with arguments
				name = "Launch file with arguments",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local args_string = vim.fn.input("Arguments: ")
					return vim.split(args_string, " +")
				end,
			},
		}

		-- Config js-debug-adapter (Javascript/Typescript debugger)
		for _, language in ipairs({ "javascript", "typescript", "javascriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

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
