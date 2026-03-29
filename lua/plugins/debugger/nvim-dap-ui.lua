return {
	"rcarriga/nvim-dap-ui",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		local kmap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- dapui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
        dap.listeners.after.event_initialized.dapui_config = function()
            dapui.open()
        end

		vim.fn.sign_define("DapBreakpoint", {
            text = "󰯯",
            texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "yellow",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "",
            texthl = "DapStoppedSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		dapui.setup({
            floating = {
                border = "rounded",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
			layouts = {
				{
					elements = {
						-- { id = "breakpoints", size = 0.25 },
                        -- { id = "watches", size = 0.25 },
						{ id = "easy-dotnet_cpu", size = 0.40 }, -- CPU usage panel (50% of layout)
						{ id = "easy-dotnet_mem", size = 0.40 }, -- Memory usage panel (50% of layout)
						{ id = "stacks", size = 0.20 },
					},
					position = "left",
					size = 30, -- Width of the sidebar
				},
				{
					elements = {
						-- { id = "repl", size = 0.5 },
                        { id = "scopes", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					position = "bottom",
					size = 10,
				},
			},
			render = {
				max_type_length = 60,
				max_value_lines = 200,
			},
		})

		opts.desc = "Toggle Debugger"
		kmap("n", "<leader>dt", dapui.toggle, opts)

		opts.desc = "Debugger eval single value"
		kmap({ "n", "v" }, "<leader>de", function()
			require("dapui").eval()
		end, opts)

		opts.desc = "Reset Debugger Interface"
		kmap("n", "<leader>di", function()
			dapui.open({ reset = true })
		end, opts)
	end,
}
