local set = vim.opt

set.clipboard = "unnamedplus" -- use system clipboard
-- Appearance
set.number = true -- line numbers
set.relativenumber = true -- relative numbers (easier jumps)
set.termguicolors = true -- true colour support
set.cursorline = true -- highlight current line
set.showmode = false -- we don’t need the "-- INSERT --" echo (statusline will show mode)

-- Editing behaviour
set.expandtab = true -- use spaces instead of tabs
set.shiftwidth = 2 -- indent size for >>, <<, = etc.
set.tabstop = 2 -- number of spaces a <Tab> inserts
set.smartindent = true -- auto‑indent new lines
set.autoindent = true
set.wrap = false -- long lines don’t wrap
set.scrolloff = 4 -- keep 4 lines visible above/below cursor
set.sidescrolloff = 8

-- Search
set.ignorecase = true -- case‑insensitive unless capital letters used
set.smartcase = true
set.incsearch = true -- incremental search
set.hlsearch = false -- don’t highlight all matches after search

-- Backups (optional, safe defaults)
set.backup = false
set.writebackup = false
set.swapfile = false

set.splitright = true
set.splitbelow = true
-- set.winborder = "rounded"

-- fixes lsp completion when enabled
-- displays it without selecting the first item.
vim.o.completeopt = "menu,menuone,noselect,noinsert"
set.shortmess:append("c")

vim.o.showtabline = 2