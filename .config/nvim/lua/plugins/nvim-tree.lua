return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()

    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      -- your removals and mappings go here

      -- delete mappings
      --vim.keymap.del('n', '<c-k>', { buffer = bufnr })

      -- custom mappings
        -- example: vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
        -- exmpale: vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      --vim.keymap.set('n', '<c-i>', api.node.show_info_popup, opts('Info'))

      -- override mappings
      vim.keymap.set('n', '<C-u>', api.node.show_info_popup, opts('Info'))
    end

    require("nvim-tree").setup {
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      on_attach = my_on_attach,
    }
  end,
  keys = function()
    local map = vim.keymap.set
    map("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", {desc = "Toggle Nvim-Tree"})
  end,
}
