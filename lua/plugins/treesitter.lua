return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
    lazy = false,
	build = ":TSUpdate",
	config = function()
        local ts = require("nvim-treesitter")

        ts.setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "<filetype>" },
            callback = function()
                vim.treesitter.start()
            end,
        })

        vim.bo.indentexpr = "v:lua.require'nvim_treesitter'.indentexpr()"
	end,
}
