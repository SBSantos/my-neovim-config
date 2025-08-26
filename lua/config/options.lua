local o = vim.o

-- general
o.encoding = "UTF-8"
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildignorecase = true
o.splitbelow = true
o.splitright = true

-- cursor
o.cursorline = true
o.selection = "inclusive"
o.scrolloff = 31
o.sidescrolloff = 8

-- visual
o.termguicolors = true -- enable true color support
o.showmatch = true
o.matchtime = 2
o.signcolumn = "yes"

-- numbers
o.number = true
o.relativenumber = true

-- indentation
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.autoindent = true
o.expandtab = true

-- search
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- file
o.undofile = true
o.backup = false
o.writebackup = false
o.updatetime = 300
o.timeoutlen = 500
