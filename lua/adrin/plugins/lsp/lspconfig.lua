return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- lazy load
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- for autocompletion
        { "antosha417/nvim-lsp-file-operations", config = true }, -- modify imports when file has been renamed
        { "folke/neodev.nvim", opts = {} }, -- for neovim config
    },
    config = function()
        local keymap = vim.keymap -- for conciseness
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        vim.diagnostic.config({ signs })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds only available when lsp attaches to client and only available in buffer
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                -- the default keymap to display hover information (documentation) about a symbol (module, function, etc.) under the cursor in Neovim is K.
            end,
        })

        -- Lua Language Server and VML Language Server are preconfigured here
        -- Configure Lua Language Server
        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Add global variables here
                    },
                },
            },
        })

        -- Configure VML Language Server
        vim.lsp.config("vmls", {
            cmd = { "vmls" },
            capabilities = capabilities,
        })

        -- After configuring, enable the LSP clients
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("vmls")
    end,
}
