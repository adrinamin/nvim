vim.g.mapleader = " "

local map   = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Normal mode shortcuts
map('n', '<Leader>sf', ':w<CR>',               { desc = 'Save file' })
map("n", "<Leader>q", ":q<CR>", { desc = "quit file" })
map('n', '<Leader>qq', ':qa<CR>',              { desc = 'Quit all' })
map('n', '<Leader>h',  ':nohlsearch<CR>',      { desc = 'Clear search highlight' })


-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- Better window navigation (Ctrl + hjkl)
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Resize windows with Alt + arrows
map('n', '<A-Up>',    ':resize -2<CR>',   { noremap = true, silent = true })
map('n', '<A-Down>',  ':resize +2<CR>',   { noremap = true, silent = true })
map('n', '<A-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
map('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- tabs
map("n", "<Leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
map("n", "<Leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- Close current tab
map("n", "<Leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
map("n", "<Leader>tp", "<cmd>tabp<CR>", { desc = "Open to previous tab" }) -- go to previous tab
map("n", "<Leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- Open current buffer in new tab

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- explore
map("n", "<leader>ef", "<cmd>Explore<CR>", { desc = "Open explore" })
