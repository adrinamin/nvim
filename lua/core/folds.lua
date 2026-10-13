-- Native Folding Commands
-- zc: Close (collapse) the fold under the cursor.
-- zo: Open (expand) the fold under the cursor.
-- za: Toggle the fold under the cursor.
-- zM: Close all folds in the file.
-- zR: Open all folds in the file.
-- zM: Close all folds.
-- See https://neovim.io/doc/user/fold/#_2.-fold-commands
--
-- Tree-sitter Folding (deactivated in lua/core/init.lua at the moment):
vim.opt.foldcolumn = "0"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""

-- vim.opt.foldnestmax = 3
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Set foldnestmax per-buffer, not globally
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.foldnestmax = 3
	end,
})

local function close_all_folds()
	-- Activates the parser for the current buffer.
	-- The pcall guards against filetypes that have no parser installed.
	pcall(vim.treesitter.start)
	-- Forces Neovim to re-evaluate foldexpr for every line
	-- so the fold tree is populated.
	vim.cmd("normal! zx") -- recompute folds
	vim.api.nvim_exec2("%foldc!", { output = false })
end

local function open_all_folds()
	pcall(vim.treesitter.start)
	vim.cmd("normal! zx")
	vim.api.nvim_exec2("%foldo!", { output = false })
end

vim.keymap.set("n", "<leader>zs", close_all_folds, { desc = "[s]hut all folds" })
vim.keymap.set("n", "<leader>zo", open_all_folds, { desc = "[o]pen all folds" })
