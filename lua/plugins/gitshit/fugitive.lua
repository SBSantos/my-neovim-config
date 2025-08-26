return {
    'tpope/vim-fugitive',
    config = function()
        local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})
        local autocmd = vim.api.nvim_create_autocmd

        autocmd("BufWinEnter", {
            group = myFugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end
                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "<leader>gP", function()
                    vim.cmd.Git('push')
                end, opts)

                -- NOTE: rebase always
                vim.keymap.set("n", "<leader>gp", function()
                    vim.cmd.Git({'pull', '--rebase'})
                end, opts)

                -- NOTE: easy set up branch that wasn't setup properly
                vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)
            end
        })
        vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Activates fugitive" })
    end
}
