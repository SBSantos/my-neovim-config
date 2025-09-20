return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	key = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			keys = {
				scroll_down = "<C-g>",
				scroll_up = "<C-y>",
			},
		})
	end,
}
