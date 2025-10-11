return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local opts = { noremap = true, silent = true }
		local kmap = vim.keymap.set

		-- C#
		-- WARNING: Mason's netcoredbg did not worked. Download netcoredbg from https://github.com/Samsung/netcoredbg
		-- repository instead
		local netcoredbg_path = vim.fn.expand("~") .. "/tools/netcoredbg/netcoredbg"

		local netcoredbg_adapter = {
			type = "executable",
			command = netcoredbg_path,
			args = { "--interpreter=vscode" },
		}

		dap.adapters.netcoredbg = netcoredbg_adapter
		dap.adapters.coreclr = netcoredbg_adapter

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
			},
		}

		-- .NET specific setup using 'easy-dotnet'
		require("easy-dotnet.netcoredbg").register_dap_variables_viewer() -- especial variables viewer specific for .NET

		-- keymaps
		opts.desc = "Pause Debugger"
		kmap("n", "<F4>", function()
			dap.pause()
		end, opts)
		opts.desc = "Continue Debugger"
		kmap("n", "<F5>", function()
			dap.continue()
		end, opts)
		opts.desc = "Debug toggle breakpoint"
		kmap("n", "<F9>", function()
			dap.toggle_breakpoint()
		end, opts)
		opts.desc = "Debug step over"
		kmap("n", "<F6>", function()
			dap.step_over()
		end, opts)
		opts.desc = "Debug step into"
		kmap("n", "<F7>", function()
			dap.step_into()
		end, opts)
		opts.desc = "Debug step out"
		kmap("n", "<F8>", function()
			dap.step_out()
		end, opts)
		opts.desc = "Close Debugger"
		kmap("n", "<F12>", function()
			dap.terminate()
			-- dap.clear_breakpoints()
		end, opts)
		opts.desc = "Open debugger REPL"
		kmap("n", "<leader>dr", function()
			dap.repl.open()
		end, opts)
		opts.desc = "Run last debug session"
		kmap("n", "<leader>dl", function()
			dap.run_last()
		end, opts)
	end,
}
