return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.ast_grep.setup({ capabilities = capabilities })
      lspconfig.apex_ls.setup{ capabilities = capabilities }
      lspconfig.arduino_language_server.setup{ capabilities = capabilities }
      lspconfig.dockerls.setup{ capabilities = capabilities }
      lspconfig.docker_compose_language_service.setup{ capabilities = capabilities }
      lspconfig.spectral.setup{ capabilities = capabilities }
      lspconfig.lua_ls.setup{ capabilities = capabilities }
      lspconfig.bashls.setup{ capabilities = capabilities }
      lspconfig.pylsp.setup{ capabilities = capabilities }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = {'LSP: Show Definition in snippet'}})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = {'LSP: Jump to Definition'}})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {{desc = 'LSP: Show code actions'}})
    end
  },
}
