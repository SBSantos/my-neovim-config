return {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
        local auto_session = require("auto-session")
        auto_session.setup({
            auto_restore = false,
            suppress_dirs = { "~/", "~/Downloads", "/", "~/Documents" },
        })
        vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Session search" }) -- restore last workspace session
        vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" }) -- save a new workspace session

        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end
}
