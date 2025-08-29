return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local current_theme = require("current-theme")

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' '
				-- displays only the first character of the mode
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}

		local filename = {
			"filename",
			file_status = true,
			newfile_status = true,
			path = 1,
			symbols = {
				modified = " ",
				readonly = " ",
				unnamed = "[No Name]",
				newfile = " ",
			},
		}

		local diagnostics = {
			"diagnostics",
			colored = true,
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			update_in_insert = true, -- Update diagnostics in insert mode.
			always_visible = false,
		}

		local branch = { "branch", icon = { "" } }

		local filetype = {
			"filetype",
			colored = true,
			icon_only = true,
		}

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{ "fileformat" },
					diagnostics,
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding" },
					filetype,
				},
				lualine_y = {}, -- removes 'progress'
			},
		})
	end,
}
