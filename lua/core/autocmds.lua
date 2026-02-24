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
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local id = vim.tbl_get(ev, "data", "client_id")
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil then
			return
		end

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

--- should detect bicep filetype
vim.cmd([[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]])
vim.cmd([[ autocmd BufNewFile,BufRead *.bicepparam set filetype=bicep ]])
