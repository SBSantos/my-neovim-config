return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_DiffCommand = "FC" -- to work on Windows
        vim.g.undotree_DiffpanelHeight = 15

        vim.keymap.set("n", "<C-z>", "<cmd>UndotreeToggle<CR>", { desc = "Opens Undotree history" } )
    end,
}
