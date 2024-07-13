return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
  keys = function()
    local map = vim.keymap.set
    map("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {desc = "Toggle Nvim-Tree"})
  end,
}
