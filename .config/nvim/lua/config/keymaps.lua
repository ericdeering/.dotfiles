vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", "<cmd>NvimTreeBufferDelete<cr>", {desc = 'Close Current buffer and leave nvim open'})
vim.keymap.set("v", "<leader>y", '"*y', {desc = 'Yank to system clipboard'})
vim.keymap.set("n", "gi", "<cmd>InsertIndent<cr>", {desc = 'Insert an indent at the beginning of the line'})
vim.keymap.set("n", "gI", "<cmd>RemoveIndent<cr>", {desc = 'Remove an indent from the beginning of the line'})
vim.keymap.set("n", "<leader>i", "<cmd>CloseFloats<cr>", {desc = 'Close all floats'})

--lsp keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = 'LSP: Show Definition in snippet'})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'LSP: Jump to Definition'})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = 'LSP: Show code actions'})
