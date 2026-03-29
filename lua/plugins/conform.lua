return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				cs = { "csharpier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				xml = { "xmlformat" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 500,
			-- },
		})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}

        conform.formatters.csharpier = {
            command = "csharpier",
            args = {
                "format",
                "--write-stdout",
            },
            stdin = true,
        }

		conform.formatters.xmlformat = {
			command = "xmlformat",
			args = { "--selfclose", "-" },
			stdin = true,
		}

		vim.keymap.set({ "n", "v" }, "<C-f>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format whole file (or range in visual mode)" })
	end,
}
