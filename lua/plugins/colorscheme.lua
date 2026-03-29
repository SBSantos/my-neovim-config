return {
	{
		"2giosangmitom/nightfall.nvim",
		lazy = false,
		priority = 1000,
		opts = {}, -- Add custom configuration here
		config = function()
			require("nightfall").setup({
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					coroutines = { italic = false },
				},
			})
			-- vim.cmd("colorscheme nightfall") -- Choose from: nightfall, deeper-night, maron, nord
		end,
	},
	{
		"datsfilipe/vesper.nvim",
		lazy = false,
		config = function()
			require("vesper").setup({
				transparent = true,
				italics = {
					comments = false, -- Boolean: Italicizes comments
					keywords = false, -- Boolean: Italicizes keywords
					functions = false, -- Boolean: Italicizes functions
					strings = false, -- Boolean: Italicizes strings
					variables = false, -- Boolean: Italicizes variables
				},
			})
		end,
	},
	{
		"ficcdaf/ashen.nvim",
		-- optional but recommended,
		-- pin to the latest stable release:
		tag = "v0.11.0",
		lazy = false,
		-- configuration is optional!
		config = function()
			require("ashen").setup({
				hl = {
					force_override = {
						["@boolean"] = { "#e5a72a" },
						["@number"] = { "#e5a72a" },
					},
				},
				transparent = true,
			})
		end,
	},
	{
		"Koalhack/darcubox-nvim",
		lazy = false,
		config = function()
			require("darcubox").setup({
				options = {
					transparent = false,
				},
			})
		end,
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		config = function()
			require("ayu").setup({
				-- uncomment for transparency
				-- overrides = {
				-- 	Normal = { bg = "None" },
				-- 	NormalFloat = { bg = "none" },
				-- 	ColorColumn = { bg = "None" },
				-- 	SignColumn = { bg = "None" },
				-- 	Folded = { bg = "None" },
				-- 	FoldColumn = { bg = "None" },
				-- 	CursorLine = { bg = "None" },
				-- 	CursorColumn = { bg = "None" },
				-- 	VertSplit = { bg = "None" },
				-- },
			})
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		config = function()
			vim.g.everforest_transparent_background = 1
		end,
	},
	{ "jacoborus/tender.vim",
		lazy = false,
	},
}
