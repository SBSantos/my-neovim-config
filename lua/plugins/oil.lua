return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"size",
			},
			keymaps = {
				["<C-c>"] = false,
				["<M-h>"] = "actions.select_split",
				["<C-b>"] = "actions.close",
			},
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		})
		-- keymaps
		vim.keymap.set("n", "<C-b>", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle float oil" })
	end,
}
