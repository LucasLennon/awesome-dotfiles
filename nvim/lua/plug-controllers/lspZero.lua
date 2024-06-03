return {
  'VonHeikemen/lsp-zero.nvim',
  event = 'VeryLazy',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    -- {                                      -- Optional
    --   'williamboman/mason.nvim',
    --   build = function()
    --     pcall(vim.cmd, 'MasonUpdate')
    --   end,
    -- },
    -- {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
      })
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      })
    })
  end
}
