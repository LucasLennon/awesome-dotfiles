return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  ['do'] = ':TSUpdate',
  dependencies = {
    'nkrkv/nvim-treesitter-rescript'
  },
  config = function()
    local treesitter = require("nvim-treesitter");
    local configs = require("nvim-treesitter.configs");

    configs.setup {
      ensure_installed = { "lua", "vim", "vimdoc", "vue", "typescript", "javascript", "scss", "css", "html" },
      auto_install = true,
      highlight = {
        enable = true
      }
    }

    -- vim.opt.foldmethod = 'expr';
    -- vim.opt.foldexpr = nvim_treesitter#foldexpr();
    -- vim.opt.nofoldenable = true;
  end,
}
