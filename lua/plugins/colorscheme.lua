-- transparency func
-- local function enable_transparency()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- end

return {
    {
	    "2giosangmitom/nightfall.nvim",
	    lazy = false,
	    priority = 1000,
	    opts = {}, -- Add custom configuration here
	    config = function()
	        -- require("nightfall").setup()
	        -- vim.cmd("colorscheme nightfall") -- Choose from: nightfall, deeper-night, maron, nord
	        -- enable_transparency() -- enable transparency
	    end
    },
    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        -- vim.cmd.colorscheme('gruvbox-material')
      end
    },
}
