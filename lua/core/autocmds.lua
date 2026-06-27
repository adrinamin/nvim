vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", vim.lsp.buf.definition, "Goto Definition")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("ca", vim.lsp.buf.code_action, "Open Code action")
		map("K", vim.lsp.buf.hover, "Show docs under the cursor")
		map("<leader>rr", vim.lsp.buf.rename, "Rename all references under cursor")
	end,
})

--- should detect bicep filetype
vim.cmd([[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]])
vim.cmd([[ autocmd BufNewFile,BufRead *.bicepparam set filetype=bicep ]])

-- Optional
-- Show diagnostic popup on cursor hold
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = functio
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end,
-- })
