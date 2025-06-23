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
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason").setup();
      require("mason-lspconfig").setup {

      }


      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = 'LSP: Show Definition in snippet'})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'LSP: Jump to Definition'})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = 'LSP: Show code actions'})
    end
  },
}
