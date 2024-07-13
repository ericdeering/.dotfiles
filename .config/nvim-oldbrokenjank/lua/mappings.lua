require "nvchad.mappings"

-- add yours here
local nomap = vim.keymap.del

-- nomap("n", "<Esc>")

local myMap = vim.keymap.set

myMap("n", "<C-_>", "<cmd>noh<cr>", {desc = "send noh (no highlight) command" }) -- "<C-_>" actually represents CTRL+/

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
