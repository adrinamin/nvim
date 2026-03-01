---------------------------------------------------------------
-- Installation instructions for linux
-- 1. Download the latest release:
--    - Go to the Lua-LS Releases page and download the lua-language-server-<version>-linux-x64.tar.gz file.
--    - wget https://github.com/LuaLS/lua-language-server/releases/download/3.17.1/lua-language-server-3.17.1-linux-x64.tar.gz
--
-- 2. Extract and Install:
--  - Run these commands to put it in a sensible place:
-- # Create a directory for it
-- mkdir -p ~/.local/share/lua-language-server
-- # Extract the downloaded file (replace <version> with your actual file name)
-- tar -xvzf ~/Downloads/lua-language-server-*.tar.gz -C ~/.local/share/lua-language-server
-- # Create a symlink to your local bin so you can run it anywhere
-- mkdir -p ~/.local/bin
-- ln -s ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
--
-- 3. Reload your Path:
-- Ensure ~/.local/bin is in your $PATH. You can check with echo $PATH. If it's there, you can now simply type lua-language-server in any terminal.
--
-- 4. Double check:
-- lua-language-server --version

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
