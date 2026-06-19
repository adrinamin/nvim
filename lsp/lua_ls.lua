return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = { globals = { "vim", "describe", "it", "before_each", "after_each" } },
			codeLens = { enable = true },
			hint = { enable = true, semicolon = "Disable" },
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
