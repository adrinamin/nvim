require("core.keymappings")
require("core.settings")
require("core.statusline")
require("core.lsp")
require("core.autocmds")

-- this is for testing purposes only!
vim.api.nvim_create_user_command("MyHello", function()
	local ok, err = pcall(function()
		local m = require("core.chat")
		print("require type:", type(m))
		m.hello()
	end)
	if not ok then
		print("MyHello error:", err)
	end
end, {})