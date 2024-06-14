return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500 -- how long which key will wait until activation
    end,
    opts = {
        -- your configuratiokn comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
}
