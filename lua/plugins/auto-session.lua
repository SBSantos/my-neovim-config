return {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
        local auto_session = require("auto-session")
        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "~/Documents" },
        })
        vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Session search" }) -- restore last workspace session
        vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" }) -- save a new workspace session
    end
}
