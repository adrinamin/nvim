return {
    "tigion/nvim-asciidoc-preview",
    cmd = { "AsciiDocPreview" },
    ft = { "asciidoc" },
    build = "cd server && npm install",
    opts = {
        server = {
            converter = "js",
        },
        preview = {
            position = "current",
        },
    },
    config = function()
        vim.keymap.set("n", "<Leader>cp", ":AsciiDocPreview<CR>", { desc = "Preview AsciiDoc document" })
    end,
}
-- more infos: https://github.com/tigion/nvim-asciidoc-preview
