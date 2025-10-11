return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{
			"ray-x/lsp_signature.nvim",
			event = { "BufReadPre", "BufNewFile", "InsertEnter" },
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local kmap = vim.keymap.set
				local border_style = "rounded"
				local signature = require("lsp_signature")

				signature.on_attach({
                    -- doc_lines:
                    -- will show two lines of comment/doc
                    -- set to 0 if you DO NOT want any API comments be shown
                    -- This setting only take effect in insert mode
                    -- it does not affect signature help in normal mode
                    -- 10 by default
                    doc_lines = 0,
					bind = true,
					hint_enable = true,
					hint_prefix = " ",
                    hint_scheme = "Number",
                    hi_parameter = "Keyword",
                    handler_opts = {
						border = border_style,
					},
                    select_signature_key = "<M-n>",
				}, ev.buf)

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

				kmap("i", "<C-h>", function()
					vim.lsp.buf.signature_help({ border = border_style })
				end, opts)

				opts.desc = "Show method definition"
				kmap("n", "<leader>D", vim.lsp.buf.definition, opts)
			end,
		})

		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		-- Set the diagnostic config with all icons
		vim.diagnostic.config({
			signs = {
				text = signs, -- Enable signs in the gutter
			},
			virtual_text = true, -- Specify Enable virtual text for diagnostics
			underline = true, -- Specify Underline diagnostics
			update_in_insert = false, -- Keep diagnostics active in insert mode
		})

		-- Setup servers
		local lsp = vim.lsp
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		lsp.config("*", {
			capabilities = capabilities,
		})

		-- Config lsp servers here
		-- lua_ls
		lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		lsp.enable("lua_ls")

		-- clangd
		lsp.config("clangd", {})
		lsp.enable("clangd")

		-- roslyn
		lsp.config("roslyn", {})

		-- html
		lsp.config("html", {})
		lsp.enable("html")

		-- cssls
		lsp.config("cssls", {})
		lsp.enable("cssls")
	end,
}
