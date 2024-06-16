return {
    "Exafunction/codeium.vim",
    event = { "BufEnter" },
    config = function()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set("i", "<c-y>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true }) -- Tab is the default
        vim.keymap.set("i", "<c-n>", function()
            return vim.fn["codeium#CycleCompletions"](1)
        end, { expr = true, silent = true })
        vim.keymap.set("i", "<c-p>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
        end, { expr = true, silent = true })
        vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true, silent = true })
    end,
    -- currently there is an issue with codeium#Accept function
    -- https://github.com/Exafunction/codeium.vim/issues/381
}
