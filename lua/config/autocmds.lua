local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- hightlight yanked text
local highlight_yank_group = augroup("Highlight yank", {})
autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 400,
		})
	end,
})

-- Close other buffers
function CloseOtherBuffers()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
            vim.api.nvim_buf_delete(buf, {})
        end
    end
end

vim.api.nvim_create_user_command("BDeleteOther", CloseOtherBuffers, {})
