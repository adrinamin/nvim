return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()

        local keymap = vim.keymap -- for conciseness

        -- not working atm
        -- Just use the commands :MarkdownPreview :MarkdownPreviewStop :MarkdownPreviewToggle
        --[[ keymap.set("n", "<leader>la", "<cmd>MarkdownPreview<CR>", { desc = "Open markdown preview" })
        keymap.set("n", "<leader>mc", "<cmd>MarkdownPreviewStop<CR>", { desc = "Close markdown preview" })
        keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" }) ]]
    end,
}
