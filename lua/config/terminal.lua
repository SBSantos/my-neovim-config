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

			vim.bo.bufhidden = "hide"

			vim.bo.buflisted = false
		end,
	})

	vim.api.nvim_create_autocmd("TermClose", {
		pattern = "*",
		callback = function(args)
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(args.buf) then
					vim.api.nvim_buf_delete(args.buf, { force = true })
				end
			end)
		end,
	})

	kmap(
		"n",
		"<leader>th",
		":split | terminal<CR>",
		{ noremap = true, silent = true, desc = "Open horizontal terminal" }
	)

	kmap(
		"n",
		"<leader>tv",
		":vsplit | terminal<CR>",
		{ noremap = true, silent = true, desc = "Open vertical terminal" }
	)
end

return M
