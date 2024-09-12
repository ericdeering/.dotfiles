return {
  {
	  "folke/which-key.nvim",
    dependencies = { 'echasnovski/mini.icons', version = false },
	  event = "VeryLazy",
	  opts = {
      triggers = {
        { "<leader>?", mode = {"n", "v" } },
      },
	  },
	  keys = {
	    {
	      "<leader>?",
	      function()
	        require("which-key").show({ global = false })
	      end,
	      desc = "Buffer Local Keymaps (which-key)",
	    },
    },
    config = function()
      require("mini.icons").setup()
    end,
  },
}
