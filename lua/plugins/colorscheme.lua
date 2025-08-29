return {
	{
		"2giosangmitom/nightfall.nvim",
		lazy = false,
		priority = 1000,
		opts = {}, -- Add custom configuration here
		config = function()
			require("nightfall").setup({
				transparent = true,
			})
			-- vim.cmd("colorscheme nightfall") -- Choose from: nightfall, deeper-night, maron, nord
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			-- vim.cmd.colorscheme('gruvbox-material')
			vim.g.gruvbox_material_transparent_background = 0
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_transparent_background = 1
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
		end,
	},
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			dark_style_background = "transparent", -- default, dark, transparent, #RRGGBB
			light_style_background = "default", -- default, dark, transparent, #RRGGBB
		},
	},
	{
		"ErichDonGubler/vim-sublime-monokai",
		lazy = false,
		config = function()
			vim.g.sublimemonokai_transparent_bg = 0
		end,
	},
	{
		"Koalhack/darcubox-nvim",
		lazy = false,
		config = function()
			require("darcubox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				transparent = false,
			})
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- custom options here
		},
		config = function()
			require("tokyodark").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				-- uncomment for transparency
				overrides = {
					Normal = { bg = "None" },
					NormalFloat = { bg = "none" },
					ColorColumn = { bg = "None" },
					SignColumn = { bg = "None" },
					Folded = { bg = "None" },
					FoldColumn = { bg = "None" },
					CursorLine = { bg = "None" },
					CursorColumn = { bg = "None" },
					VertSplit = { bg = "None" },
				},
			})
		end,
	},
	{
		"datsfilipe/vesper.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vesper").setup({
				transparent = false,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		lazy = false,
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = false,
				},
			})
		end,
	},
}
