return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

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
				newfile = " ",
			},
		}

		local diagnostics = {
			"diagnostics",
			colored = true,
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			update_in_insert = true, -- Update diagnostics in insert mode.
			always_visible = false,
		}

		local branch = { "branch", icon = { "" } }

		local filetype = {
			"filetype",
			colored = true,
			icon_only = true,
		}

		-- local lspstatus = {
		-- 	"lsp_status",
		-- 	icon = "", -- f013
		-- 	symbols = {
		-- 		-- Standard unicode symbols to cycle through for LSP progress:
		-- 		spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
		-- 		-- Standard unicode symbol for when LSP is done:
		-- 		done = "",
		-- 		-- Delimiter inserted between LSP names:
		-- 		separator = " ",
		-- 	},
		-- 	-- List of LSP names to ignore (e.g., `null-ls`):
		-- 	ignore_lsp = { "roslyn" },
		-- }

        -- count buffers
        local function buffer_count()
            local count = #vim.fn.getbufinfo({ buflisted = 1 })
            return "󰓩 " .. count
        end

        local function get_max_buffer_width()
            local total_width = vim.o.columns
            local reserved_width = 15 -- reserved espace for buffer_count
            return math.floor(total_width - reserved_width)
        end

		local buffers = {
			"buffers",
			show_filename_only = true, -- Shows shortened relative path when set to false.
			hide_filename_extension = false, -- Hide filename extension when set to true.
			show_modified_status = true, -- Shows indicator when the buffer is modified.

			mode = 0, -- 0: Shows buffer name
			-- 1: Shows buffer index
			-- 2: Shows buffer name + buffer index
			-- 3: Shows buffer number
			-- 4: Shows buffer name + buffer number

			max_length = get_max_buffer_width, -- * 2 / 3, -- Maximum width of buffers component,
			-- it can also be a function that returns
			-- the value of `max_length` dynamically.
			filetype_names = {
				TelescopePrompt = "Telescope",
				dashboard = "Dashboard",
				packer = "Packer",
				fzf = "FZF",
				alpha = "Alpha",
			}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

			-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
			use_mode_colors = false,

			-- buffers_color = {
			-- 	-- Same values as the general color option can be used here.
			-- 	active = "lualine_{section}_normal", -- Color for active buffer.
			-- 	inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
			-- },

			symbols = {
				modified = " ●", -- Text to show when the buffer is modified
				alternate_file = "#", -- Text to show to identify the alternate file
				directory = "", -- Text to show when the buffer is a directory
			},
		}

        local job_indicator = {
            require("easy-dotnet.ui-modules.jobs").lualine
        }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_show_tabline = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					-- lspstatus,
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
					{ "fileformat" },
				},
				lualine_y = {}, -- removes 'progress'
                lualine_z = {
                    job_indicator,
                    "location",
                }
			},
			tabline = {
				lualine_a = { buffers },
                lualine_z = { buffer_count },
			},
		})
	end,
}
