return {
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason").setup();
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          if (server_name ~= "jdtls") then
           require("lspconfig")[server_name].setup{ capabilities = capabilities }
         end
        end
      }

      require("lspconfig")["jdtls"].setup{ capabilities = capabilities }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = 'LSP: Show Definition in snippet'})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'LSP: Jump to Definition'})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = 'LSP: Show code actions'})
    end
  },
}
