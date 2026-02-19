function modeInfo()
    local m = vim.fn.mode()
    return ({
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'V‑LINE',
        c = 'COMMAND',
        R = 'REPLACE',
    })[m] or m
end

vim.o.statusline = table.concat({
    '%#StatusLine#',
    ' %{v:lua.modeInfo()} ',                -- mode
    '%=%{expand("%:~:.")} ',           -- file path (relative)
    '%l:%c ',                          -- line:col
    '%p%%',                            -- percent through file
})
