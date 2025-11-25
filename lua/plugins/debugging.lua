return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"lldb",
			},
			automatic_setup = true,
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.5,
							},
							{
								id = "console",
								size = 0.5,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})

			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-dap-18",
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "lldb",
					request = "launch",
					program = function()
						-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/Build/", "file")
						local file = vim.fn.input("Executable: ")
						return vim.fn.getcwd() .. "/Build/" .. file .. "/" .. file
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open()
				print("after_event_init")
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Keybinds
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>dr", function()
				dap.continue()
			end)
		end,
	},
}
