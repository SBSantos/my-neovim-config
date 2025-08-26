local kmap = vim.keymap.set

vim.g.mapleader = " "

-- kmap("n", "<leader>cd", vim.cmd.Ex, { desc = "Moves to Neovim directory" })

-- search
-- kmap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
-- kmap("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- page
kmap("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
kmap("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- buffer
kmap("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
kmap("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- navigation
kmap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
kmap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
kmap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
kmap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- splitting window
kmap("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
kmap("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })

-- window & terminal resize
-- kmap("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Incrase terminal height by 2" })
-- kmap("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Decrease terminal height by 2" })
kmap("n", "<C-Right>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
kmap("n", "<C-Left>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- indenting in visual mode
kmap("v", "<", "<gv", { desc = "Indent left and reselect" })
kmap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
kmap("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
