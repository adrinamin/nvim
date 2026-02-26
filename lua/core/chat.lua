-- state.buf = vim.api.nvim_create_buf(false, true)
-- vim.api.nvim_set_option_value("buftype", "nofile", { buf = state.buf })
-- vim.api.nvim_set_option_value("filetype", "chat", { buf = state.buf })
-- print("loading core.chat from:", debug.getinfo(1).source)
local M = {}

function M.hello()
	print("hello chat module")
end

-- ensure package.loaded stores the module table (prevents accidental boolean)
-- package.loaded["core.chat"] = M

return M