return {
	"kdheepak/lazygit.nvim",
	enabled = true, -- NOTE: set false to use lazygit in Snacks.nvim
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- window border thing
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting up with keys={} allows plugin to load when command runs at the start
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
