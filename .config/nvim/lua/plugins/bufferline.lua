return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup{
      options = {
        separator_style = "slant",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        }
      }
    }
    vim.keymap.set({"n","v","o"}, "<tab>", "<cmd>BufferLineCycleNext<cr>", {noremap = true, desc = 'move to open buffer tab to the right of the currently opened buffer tab'})
    vim.keymap.set({"n","v","o"}, "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", {noremap = true, desc = 'move to open buffer tab to the left of the currently opened buffer tab'})
  end,
}
