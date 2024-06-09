return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
      }
    }
  },
}
