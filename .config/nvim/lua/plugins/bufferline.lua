return {
  'akinsho/bufferline.nvim', 
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.cmd("nnoremap <silent><tab> :BufferLineCycleNext<CR>")
    vim.cmd("nnoremap <silent><s-tab> :BufferLineCyclePrev<CR>")

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
  end,
}
