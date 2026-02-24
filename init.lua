vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#717171", italic = true })

vim.cmd("filetype plugin indent on")

require("core")
require("config.lazy")

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
