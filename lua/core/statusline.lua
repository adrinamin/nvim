local function ModeInfo()
	local m = vim.fn.mode()
	return ({
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V‑LINE",
		c = "COMMAND",
		R = "REPLACE",
	})[m] or m
end

local function GitBranch()
	local b = vim.fn.system("git symbolic-ref --short HEAD")
	b = b:gsub("%s+$", "") -- trim newline
	if b == "" or b:match("fatal") then
		return ""
	end
	return b
end

vim.o.statusline = table.concat({
	"%#StatusLine#",
	" " .. ModeInfo() .. " " .. GitBranch(), -- mode + branch
	'%=%{expand("%:~:.")} ', -- file path (relative)
	"%l:%c ", -- line:col
	"%p%%", -- percent through file
})
