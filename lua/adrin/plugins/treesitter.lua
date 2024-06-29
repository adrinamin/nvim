-- when using windows, check requirements: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                -- "tsx",
                "yaml",
                "html",
                "css",
                -- "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                -- "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                -- "query",
                "vimdoc",
                "kotlin",
                "xml",
                -- "c",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
    -- Each module can also be enabled or disabled interactively through the following commands:
    --[[ :TSBufEnable {module} " enable module on current buffer
    :TSBufDisable {module} " disable module on current buffer
    :TSEnable {module} [{ft}] " enable module on every buffer. If filetype is specified, enable only for this filetype.
    :TSDisable {module} [{ft}] " disable module on every buffer. If filetype is specified, disable only for this filetype.
    :TSModuleInfo [{module}] " list information about modules state for each filetype
     ]]
}
