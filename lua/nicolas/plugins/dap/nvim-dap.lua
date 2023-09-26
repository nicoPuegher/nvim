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
		local c_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
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
				command = c_path,
				args = { "--port", "${port}" },
			},
		}

		-- Setup js-debug-adapter (Javascript & Typescript adapter)
		for _, js_adapters in ipairs({ "pwa-node", "pwa-chrome" }) do
			dap.adapters[js_adapters] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}
		end

		-- Config codelldb (C debugger)
		-- Debugger needs a compiled file like: clang --debug program.c -o program
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
		for _, language in ipairs({ "javascript", "typescript" }) do
			dap.configurations[language] = {
				-- Runs a server automatically, for example express.js
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
		end

		-- Config js-debug-adapter (Javascript/Typescript debugger)
		for _, language in ipairs({ "javascriptreact", "typescriptreact" }) do
			dap.configurations[language] = {
				-- Server running needed, for example npm run dev with vite port 5173
				{
					type = "pwa-chrome",
					name = "Launch Chrome to debug client",
					request = "launch",
					port = 9222,
					url = "http://localhost:5173",
					sourceMaps = true,
					protocol = "inspector",
					webRoot = "${workspaceFolder}/src",
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
