return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- "leoluz/nvim-dap-go", -- only for debugging go programs
        -- { "Mgenuit/nvim-dap-kotlin", config = true },
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio", -- needed for dap-ui
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local dap = require("dap")

        -- local dapgo = require("dap-go")
        -- dapgo.setup()

        --[[ local dapkotlin = require("dap-kotlin")
        dapkotlin.setup({
            dap_command = "kotlin-debug-adapter",
            project_root = "${workspaceFolder}",
        }) ]]

        dap.adapters.kotlin = {
            type = "executable",
            command = "/Users/aam/.local/share/nvim/mason/packages/kotlin-debug-adapter/adapter/bin/kotlin-debug-adapter",
            options = { auto_continue_if_many_stopped = false }, -- This option can help prevent issues with multiple threads stopping simultaneously
        }

        dap.configurations.kotlin = {
            {
                type = "kotlin",
                request = "launch",
                name = "Launch kotlin program",
                projectRoot = "${workspaceFolder}",
                -- may differ, when in doubt, whatever your project structure may be,
                -- it has to correspond to the class file located at `build/classes/`
                -- and of course you have to build before you debug
                mainClass = function()
                    local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1]
                        or ""
                    local fname = vim.api.nvim_buf_get_name(0)
                    -- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
                    return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
                end,
                jsonLogFile = "",
                enableJsonLogging = false,
            },
        }

        -- dap.defaults.kotlin.auto_continue_if_many_stopped = false

        local dapui = require("dapui")
        dapui.setup()

        local dapvirtualtext = require("nvim-dap-virtual-text")
        -- you can find more infos about configuration at https://github.com/theHamsta/nvim-dap-virtual-text
        dapvirtualtext.setup()

        -- keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle a breakpoint" })
        keymap.set("n", "<leader>bg", dap.run_to_cursor, { desc = "Run to cursor" })

        keymap.set("n", "<leader>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        keymap.set("n", "<leader>bs", dap.continue, { desc = "Run or continue debugging" })
        keymap.set("n", "<leader>bi", dap.step_into, { desc = "step into" })
        keymap.set("n", "<leader>bo", dap.step_over, { desc = "step over" })
        keymap.set("n", "<leader>bu", dap.step_out, { desc = "step out" })
        keymap.set("n", "<leader>ba", dap.step_back, { desc = "step back" })
        keymap.set("n", "<leader>br", dap.restart, { desc = "Restart debugging" })
        keymap.set("n", "<leader>bx", dap.terminate, { desc = "Close debugging" })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
