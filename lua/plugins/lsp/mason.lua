return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				-- install these using MasonInstall command
				ensure_installed = {
					"roslyn",
					"rzls",
				},
			})

			mason_lspconfig.setup({
				-- servers for mason to install
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"marksman",
					"clangd",
				},
				-- auto installs configured servers (with lspconfig)
				automatic_intallation = true,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"clang-format",
					"csharpier",
					"netcoredbg",
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"xmlformatter",
				},
			})
		end,
	},
}
