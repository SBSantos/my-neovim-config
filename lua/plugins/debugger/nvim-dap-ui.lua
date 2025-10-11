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

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		vim.fn.sign_define("DapBreakpoint", {
			text = "󰯯", -- ⚪
			texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapStopped", {
			text = "", -- 🔴 󰊍   
			texthl = "yellow",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "", -- ⭕
			texthl = "DapStoppedSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		-- dapui default configuration
		dapui.setup()

	       opts.desc = "Toggle Debugger"
		kmap("n", "<leader>dt", dapui.toggle, opts)

	       opts.desc = "Debugger eval single value"
	       kmap({ "n", "v" }, "<leader>de", function()
	           dapui.eval()
	       end, opts)

	       opts.desc = "Reset Debugger Interface"
	       -- kmap("n", "<leader>do", "<CMD>lua require('dapui').open({ reset = true })<CR>", opts)
	       kmap("n", "<leader>di", function()
	           dapui.open({ reset = true })
	       end, opts)
	end,
}
