local kmap = vim.keymap.set

local M = {}

local function set_terminal_keymaps()
	local opts = { buffer = 0, noremap = true, silent = true }
	-- back to normal mode
	kmap("t", "<Esc>", [[<C-\><C-n>]], opts)

	-- navigation
	kmap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
	kmap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
	kmap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
	kmap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
end

function M.setup()
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "*",
		callback = function()
			set_terminal_keymaps()
			vim.cmd("startinsert")
		end,
	})

	kmap("n", "<leader>''", ":split | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal horizontally" })
	kmap("n", "<leader>'v", ":vsplit | terminal<CR>", { noremap = true, silent = true, desc = "Open terminal vertically" })
end

return M
