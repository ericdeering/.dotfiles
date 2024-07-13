return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    map('n', '<c-p>', builtin.find_files, {})
    map('n', '<leader>p', builtin.live_grep, {})
  end
}
