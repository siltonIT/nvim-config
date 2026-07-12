vim.g.mapleader = " "

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-w>", ":bd<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- Ctrl+A, C, X, V
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-x>", '"+d')
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<C-r>+')

-- jj для выхода из режима вставки
vim.keymap.set("i", "jj", "<Esc>")

-- ===== НОВОЕ: открыть/закрыть терминал по Alt+C =====
vim.keymap.set("n", "<M-c>", ":ToggleTerm<CR>")
-- Также в режиме терминала: Alt+C для выхода и закрытия (если нужно)
vim.keymap.set("t", "<M-c>", "<C-\\><C-n>:ToggleTerm<CR>")
