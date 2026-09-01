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

-- Use buffer and omnifunc for completion sources
vim.o.complete = ".,o"
-- fixes lsp completion when enabled
-- displays it without selecting the first item.
-- vim.o.completeopt = "menu,menuone,noselect,noinsert,popup"
-- Set menu behavior: fuzzy matching, show menu even with one item, no auto-selection
vim.o.completeopt = "fuzzy,menuone,noselect"
-- Enable the new autocomplete system
vim.o.autocomplete = true
-- Set popup height
vim.o.pumheight = 7

set.shortmess:append("c")

-- tabs
vim.o.showtabline = 2

-- Source - https://stackoverflow.com/a/79344770
-- Posted by Carson
-- Retrieved 2026-04-14, License - CC BY-SA 4.0

function _G.get_tabline()
	local s = ""
	for tabnr = 1, vim.fn.tabpagenr("$") do
		local winnr = vim.fn.tabpagewinnr(tabnr)
		local buflist = vim.fn.tabpagebuflist(tabnr)[winnr]
		local bufname = vim.fn.bufname(buflist)
		local bufname_short = vim.fn.fnamemodify(bufname, ":t")
		if tabnr == vim.fn.tabpagenr() then
			s = s .. "%#TabLineSel#" .. " " .. tabnr .. ": " .. bufname_short .. " "
		else
			s = s .. "%#TabLine#" .. " " .. tabnr .. ": " .. bufname_short .. " "
		end
	end
	s = s .. "%#TabLineFill#"
	return s
end

vim.o.tabline = "%!v:lua.get_tabline()"
