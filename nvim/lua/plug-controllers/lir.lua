return {
    'tamago324/lir.nvim',
    config = function()
      local lir = require('lir')
      local actions = require('lir.actions')
      local mark_actions = require('lir.mark.actions')
      local clipboard_actions = require('lir.clipboard.actions')

      lir.setup({
        hide_cursor = true,
        show_hidden_files = false,
        devicons = {
          enable = true,
          highlight_dirname = false
        },
        mappings = {
          ['l']     = actions.edit,
          ['<C-s>'] = actions.split,
          ['<C-v>'] = actions.vsplit,
          ['<C-t>'] = actions.tabedit,

          ['h']     = actions.up,
          ['q']     = actions.quit,

          ['K']     = actions.mkdir,
          ['N']     = actions.newfile,
          ['R']     = actions.rename,
          ['@']     = actions.cd,
          ['Y']     = actions.yank_path,
          ['.']     = actions.toggle_show_hidden,
          ['D']     = actions.delete,

          ['J']     = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
          end,
          ['C']     = clipboard_actions.copy,
          ['X']     = clipboard_actions.cut,
          ['P']     = clipboard_actions.paste,
        },
        -- float = {
        --   winblend = 1,
        --   win_opts = {
        --     border = 'normal'
        --   },
        -- },
      })
    end
  }
