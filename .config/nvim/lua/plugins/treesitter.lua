return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        highlight = {enable = true},
        indent = {enable = true},
        auto_install = true,
        ensure_installed = {
          -- defaults
          "vim",
          "lua",
          "vimdoc",

          -- web dev 
          "html",
          "css",
          "javascript",
          "typescript",
          "php",

          -- high level
          "java",
          "python",
          "c_sharp",
          "lua",

          -- low level
          "c",
          "arduino",

          -- scripting
          "bash",

          -- misc
          "dockerfile",
        }
      })
    end
  },
}
