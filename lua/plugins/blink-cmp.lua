return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	aversion = "1.*",
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-q>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },

			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },

			["<C-y>"] = { function(cmp) cmp.scroll_signature_up(0) end },
			["<C-g>"] = { function(cmp) cmp.scroll_signature_down(0) end },

			["<C-l>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Class = " ",
				Color = " ",
				Constant = " ",
				Constructor = " ",

				Enum = " ",
				EnumMember = " ",
				Event = " ",

				Field = " ",
				File = " ",
				Folder = " ",
				Function = " ",

				Interface = " ",

				Keyword = " ",

				Method = " ",
				Module = " ",

				Operator = " ",

				Property = " ",

				Reference = " ",

				Snippet = " ",
				Struct = " ",

				Text = " ",
				TypeParameter = " ",

				Unit = " ",

				Value = " ",
				Variable = " ",
			},
		},

		completion = {
			menu = {
				min_width = 15,
				max_height = 14,
				border = "rounded",
				auto_show = true,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:IncSearch",

				draw = {
					align_to = "cursor",
					padding = 0,
					gap = 0,
					treesitter = { "lsp" },

					components = {
						label = {
							width = { fill = true, max = 25 },
						},
						label_description = {
							width = { max = 25 },
						},
					},
				},
			},
			documentation = {
				auto_show = true,

				window = {
					min_width = 10,
					max_width = 30,
					max_height = 32,
					border = "single",
				},
			},
			list = { selection = { preselect = true, auto_insert = false } },
		},

		sources = {
			default = { "lsp", "easy-dotnet", "path", "snippets", "buffer" },
            providers = {
                ["easy-dotnet"] = {
                    name = "easy-dotnet",
                    enabled = true,
                    module = "easy-dotnet.completion.blink",
                    score_offset = 10000,
                    async = true,
                },
            },
		},

		signature = {
			enabled = true,
			window = {
				min_width = 1,
				max_width = 50,
				max_height = 7,
				border = "rounded",
				winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
				scrollbar = true,

				-- Disable if you run into performance issues
				treesitter_highlighting = true,
				show_documentation = true,
			},
		},

		fuzzy = { implementation = "lua" },
	},
	opts_extend = { "sources.default" },
}
