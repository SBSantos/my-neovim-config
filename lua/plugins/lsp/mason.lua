return {
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")

			-- enable mason and configure icons
			mason.setup({
				ui = {
                    border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}
