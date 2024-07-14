return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        "Dockerfile"
      }
    }
  },
}
