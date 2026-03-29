return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local dap = require("dap")
		local opts = { noremap = true, silent = true }
		local kmap = vim.keymap.set

        -- uncomment one of these for external terminal
        -- Windows Terminal (Windows)
        -- dap.defaults.fallback.external_terminal = {
        --     command = "wt",
        --     args = {}, -- new window
        --     -- args = { "-w", "0", "nt", "--" } -- new tab
        -- }

        -- Kitty (Linux/macOS)
        -- dap.defaults.fallback.external_terminal = {
        --     command = "kitty",
        --     args = { "--hold" },
        -- }

        -- Alacritty (Linux/macOS)
        -- dap.defaults.fallback.external_terminal = {
        --     command = "alacritty",
        --     args = { "-e" },
        -- }

        -- keymaps
        opts.desc = "Pause Debugger"
        kmap("n", "<F4>", function()
            dap.pause()
        end, opts)

        opts.desc = "Start/continue Debugger"
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
            dap.clear_breakpoints()
        end, opts)

        opts.desc = "Open debugger REPL"
        kmap("n", "<leader>dr", function()
            dap.repl.open()
        end, opts)

        opts.desc = "Run last debug session"
        kmap("n", "<leader>dl", function()
            dap.run_last()
        end, opts)

        -- C#
        opts.desc = "Debug with default profile"
        kmap("n", "<leader>dp", function()
            vim.cmd "Dotnet debug default profile"
        end, opts)
    end,
}
