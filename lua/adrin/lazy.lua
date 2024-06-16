-- check https://github.com/folke/lazy.nvim for more information about configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "adrin.plugins" }, { import = "adrin.plugins.lsp" } }, {
    checker = {
        enabled = true,
        notify = true,
    },
    change_detection = {
        notifiy = true,
    },
})

-- The syntax of adding a third-party plugin in lazy.nvim is adding specification in the ... of require("lazy").setup({}).
