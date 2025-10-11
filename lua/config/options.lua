local o = vim.o

-- general
o.encoding = "UTF-8"
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildignorecase = true
o.splitbelow = true
o.splitright = true
o.wrap = false
o.backspace = "indent,eol,start"

-- cursor
o.cursorline = true
o.selection = "inclusive"
o.scrolloff = 31
o.sidescrolloff = 8
o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkon400-blinkoff250-blinkwait700"

-- visual
o.termguicolors = true -- enable true color support
o.showmatch = true
o.matchtime = 2
o.signcolumn = "yes"
o.pumheight = 12 -- sets the maximum number of items to show in popup menus
o.pumblend = 0 -- sets popup menu transparency
o.winblend = 10 -- sets floating window transparency
o.lazyredraw = false -- redraw while executing macros
o.redrawtime = 10000 -- timeout for syntax highlighting redraw
o.maxmempattern = 20000 -- max memory for pattern matching

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
