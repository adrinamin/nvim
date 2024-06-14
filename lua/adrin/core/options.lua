vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true             -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.wrap = false
vim.opt.background = "dark"         -- colorschmes that can be light or dark will be made dark
vim.opt.signcolumn = "yes"          -- shwo sign column so that text doesn't shift

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- liststyle
vim.cmd("let g:netrw_liststyle = 3")

-- split windows
vim.opt.splitright = true           -- split vertical window to the right
vim.opt.splitbelow = true           -- split horizontal window to the bottom
