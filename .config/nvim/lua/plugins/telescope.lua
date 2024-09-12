return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    --   or                              , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd',
      'nvim-treesitter/nvim-treesitter',
    },

    config = function()
      local builtin = require("telescope.builtin")
      local map = vim.keymap.set
      map('n', '<leader>ff', builtin.find_files, {})
      map('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    config = function()
      require("telescope").setup ({
        pickers = {
          find_files = {
            hidden = true
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" } --"rg", "--hidden", "--glob", '!{**/.git/*,**/node_modules/*,**/package-lock.json,**/yarn.lock}', }
            end
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end
  },
}
