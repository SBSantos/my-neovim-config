return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
            local gs = require("gitsigns")

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

            -- Navigation
            map("n", "]h", function()
                if vim.wo.diff then
                    vim.cmd.normal({"]c", bang = true})
                else
                    gs.nav_hunk("next")
                end
            end)

            map("n", "[h", function()
                if vim.wo.diff then
                    vim.cmd.normal({"[c", bang = true})
                else
                    gs.nav_hunk("prev")
                end
            end)

            -- Actions
			map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")

			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")

			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

            map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
            map("n", "<leader>gi", gs.preview_hunk_inline, "Preview hunk inline")

			map("n", "<leader>gbl", function()
				gs.blame_line({ full = true })
			end, "Blame line")

            map("n", "<leader>gd", gs.diffthis, "Diff this")

            map("n", "<leader>gD", function()
                gs.diffthis("~")
            end, "Diff this ~")

            map("n", "<leader>gQ", function() gs.setqflist("all") end, "Quickfix list all")
            map("n", "<leader>gq", gs.setqflist, "Quickfix list")

            -- Toggles
			map("n", "<leader>gtl", gs.toggle_current_line_blame, "Toggle line blame")

            map("n", "<leader>tw", gs.toggle_word_diff, "Toggle word diff")

            -- Text object
            map({"o", "x"}, "gh", gs.select_hunk, "Select hunk")
		end,
	},
}
