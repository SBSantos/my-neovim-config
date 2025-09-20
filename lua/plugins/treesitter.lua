return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			ident = { enable = true },
			autotage = { enable = true },
			ensure_installed = {
				"c",
				"cmake",
				"cpp",
				"c_sharp",
				"css",
				"html",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"make",
				"razor",
			},
			auto_install = false,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space",
					node_incremental = "<C-space>",
					scope_incremental = false,
				},
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
