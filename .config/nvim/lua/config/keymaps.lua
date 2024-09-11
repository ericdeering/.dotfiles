vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr><bar><cmd>NvimTreeToggle<cr><bar><cmd>NvimTreeToggle<cr><bar><cmd>TmuxNavigateRight<cr>")
vim.keymap.set("v", "<leader>y", '"*y')
vim.keymap.set({"n", "i"}, "gi", "<cmd>InsertIndent<cr>")
