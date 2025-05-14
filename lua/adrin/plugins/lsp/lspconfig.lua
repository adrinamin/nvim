return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- lazy load
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- for autocompletion
        { "antosha417/nvim-lsp-file-operations", config = true }, -- modify imports when file has been renamed
        { "folke/neodev.nvim", opts = {} }, -- for neovim config
    },
    config = function()
        -- import lspconfig
        local lspconfig = require("lspconfig")

        -- Import mason_lpconfig plugin
        -- local mason_lspconfig = require("mason-lspconfig")

        -- Import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

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

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                -- the default keymap to display hover information (documentation) about a symbol (module, function, etc.) under the cursor in Neovim is K.
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        -- end
        vim.diagnostic.config({ signs })

        -- mason_lspconfig.setup_handlers({
        --     -- default handler for installed servers
        --     function(server_name)
        --         lspconfig[server_name].setup({
        --             capabilities = capabilities,
        --         })
        --     end,
        -- })

        -- You always have to do the setup for an lsp.
        -- So at least the default config is used.
        -- lspconfig.svelte.setup({})
        -- lspconfig.tailwindcsstailwindcss.setup({})
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            -- see https://github.com/nvim-lua/kickstart.nvim/issues/543
            settings = {
                Lua = {
                    diagnostics = {
                        disable = { "missing-fields" },
                    },
                },
            },
        })

        lspconfig.vmls.setup({
            capabilities = capabilities,
        })

        -- Or you can do something like this:
        --[[ require("lspinstall").setup()
        local servers = require("lspinstall").installed_servers()
        for _, server in pairs(servers) do
            require("lspconfig")[server].setup({})
        end ]]
    end,
}
