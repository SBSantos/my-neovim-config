return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsings
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

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

            map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
            map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

            map("n", "<leader>gbl", function() gs.blame_line({ full = true }) end, "Blame line")
            map("n", "<leader>gtl", gs.toggle_current_line_blame, "Toggle line blame")

            map("n", "<leader>gd", gs.diffthis, "Diff this")
            map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this ~")

            map("n", "]h", gs.next_hunk, "Next hunk")
            map("n", "[h", gs.prev_hunk, "Previous hunk")

            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
        end
    }
}
