return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
        "saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
                local bufnr = ev.buf
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local kmap = vim.keymap.set
                local border_style = "rounded"

				-- keymaps
				opts.desc = "Show LSP references"
				kmap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				kmap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				kmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				kmap("n", "gli", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				kmap("n", "glt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				kmap({ "n", "v" }, "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				kmap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Telescope diagnostics buffer"
				kmap("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				kmap("n", "<leader>ld", function()
					vim.diagnostic.open_float({ border = border_style })
				end, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				kmap("n", "K", function()
					vim.lsp.buf.hover({ border = border_style })
				end, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				kmap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				opts.desc = "Show method definition"
				kmap("n", "<leader>D", vim.lsp.buf.definition, opts)
			end,
		})

        local signs = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
        }

		vim.diagnostic.config({
			signs = { text = signs, }, -- Enable signs in the gutter
			virtual_text = true, -- Specify Enable virtual text for diagnostics
			underline = true, -- Specify Underline diagnostics
			update_in_insert = false, -- Keep diagnostics active in insert mode
		})

        local lsp = vim.lsp
        local blink = require("blink.cmp")
        local capabilities = blink.get_lsp_capabilities()

        lsp.config("*", {
            capabilities = capabilities,
        })

		-- Config lsp servers here
		-- lua_ls
		lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})

		-- clangd
		lsp.config("clangd", {})

        -- enable
        lsp.enable({
            "lua_ls",
            "clangd"
        })
	end,
}
