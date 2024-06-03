return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'VonHeikemen/lsp-zero.nvim'
    },
    -- config = function()
    --   require("mason").setup()
    -- end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- config = function()
    --   local lsp = require('lsp-zero');
    --   require("mason-lspconfig").setup({
    --     ensure_installed = {},
    --     -- handlers = {
    --     --   lsp.default_setup,
    --     -- },
    --   })
    -- end,
  },
}
