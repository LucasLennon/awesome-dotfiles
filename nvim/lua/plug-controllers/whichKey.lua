return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true;
    vim.o.timeoutlen = 300;
  end,
  config = function()
    local illuminate = require('illuminate');
    -- local Popup = require('nui.popup');
    -- local Layout = require('nui.layout');
    -- local lir = require('lir.float');
    -- local telescope = require('telescope');
    local notify = require('notify');
    local wk = require('which-key');

    wk.register({
      n = {
        name = "Notifications",
        n = {
          function()
            telescope.extensions.notify.notify({
              selection_strategy = "row",
              show_all_buffers = true,
              sort_lastused = true,
              theme = "dropdown",
              previewer = false,
            })
          end,
          'Notifications'
        },
        d = {
          function()
            notify.dismiss()
          end,
          'Dismiss'
        }
      },
      f = {
        name = "Find",
        p = {
          function()
            illuminate.goto_prev_reference()
          end,
          "Go to Previous Reference"
        },
        n = {
          function()
            illuminate.goto_next_reference()
          end,
          "Go to Next Reference"
        },
        -- fb = {
        --   -- "<cmd>Telescope file_browser<cr>",
        --   function()
        --     -- local event = require("nui.utils.autocmd").event
        --     -- local popup = Popup({
        --     --   enter = true,
        --     --   focusable = true,
        --     --   border = {
        --     --     style = "rounded",
        --     --   },
        --     --   position = "50%",
        --     --   size = {
        --     --     width = "80%",
        --     --     height = "60%",
        --     --   },
        --     -- })
        --     --
        --     -- popup:on(event.BufLeave, function()
        --     --   popup:unmount()
        --     -- end)
        --     --
        --     -- popup:mount()
        --     --
        --     -- local buf = vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, {})
        --     -- buf.vim.cmd('edit .')
        --     lir.toggle()
        --   end,
        --   "File Browser"
        -- },
        t = {
          name = "Telescope",
          rs = { "<cmd>Telescope resume<cr>", "Resume Telescope Search" },
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope git_files<cr>", "Find Git File" },
          d = { "<cmd>Telescope lsp_definitions<cr>", "Find Definitions" },
          i = { "<cmd>Telescope lsp_implementations<cr>", "Find Implementations" },
          rf = { "<cmd>Telescope lsp_references<cr>", "Find References" },
          grep = { "<cmd>Telescope live_grep<cr>", "Find in Grep" },
          b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
        },
      },
      -- h = {
      --   name = "Hop",
      --   f = { "<cmd>HopChar1AC<cr>", "Jump to Char Forward" },
      --   F = { "<cmd>HopChar1BC<cr>", "Jump to Char Before" },
      --   -- f = hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }),
      --   -- F = hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      -- },
      t = {
        name = "Tabs",
        o = {
          "<cmd>tabnew<cr>", "Open a new Tab"
        },
        n = {
          "<cmd>tabnext<cr>", "Next Tab"
        },
        p = {
          "<cmd>tabprevious<cr>", "Previous Tab"
        },
        e = {
          "<cmd>tabedit", "Edit Tab"
        },
        d = {
          "<cmd>tabclose<cr>", "Close Tab"
        },
      },
      b = {
        name = "Buffer",
        f = {
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end,
          "Format"
        },
        c = {
          name = "Comments",
          c = {
            "<cmd>gc<cr>", "Comment"
          },
          l = {
            "<cmd>gcc<cr>", "Comment Line"
          },
        },
        p = {
          "<cmd>bp<cr>", "Previous"
        },
        n = {
          "<cmd>bn<cr>", "Next"
        },
        d = {
          "<cmd>bd<cr>", "Delete"
        },
        w = {
          "<cmd>w<cr>", "Save Buffer"
        },
        q = {
          "<cmd>q<cr>", "Quit"
        },
        qa = {
          "<cmd>qa<cr>", "Quit All"
        },
        wa = {
          "<cmd>wa<cr>", "Save All Buffers"
        },
        wq = {
          "<cmd>wq<cr>", "Save and Quit"
        },
        wqa = {
          "<cmd>wqa<cr>", "Save and Quit All"
        },
      },
      P = {
        name = "Plugins",
        t = {
          name = "Trouble",
          o = {
            "<cmd>Trouble<cr>",
            "Open Trouble"
          },
          c = {
            "<cmd>TroubleClose<cr>",
            "Close Trouble"
          },
          r = {
            "<cmd>TroubleRefresh<cr>",
            "Refresh Trouble"
          },
          t = {
            "<cmd>TroubleToggle<cr>",
            "Toggle Trouble"
          }
        }
      },
      z = {
        name = "ZenModes",
        a = {
          function()
            require("true-zen.ataraxis").toggle();
          end, "Toogle Ataraxis"
        },
        f = {
          function()
            require("true-zen.focus").toggle();
          end, "Toogle Focus"
        },
        m = {
          function()
            require("true-zen.minimalist").toggle();
          end, "Toogle Minimalist"
        },
      },
    }, { prefix = "<SPACE>" })

    wk.register({
      z = {
        mode = 'v',
        name = "ZenModes",
        n = {
          function()
            require("true-zen.narrow").toggle(vim.fn.line('v'), vim.fn.line('.'));
          end, "Toogle Narrow"
        },
      },
    }, { prefix = "<SPACE>" })
  end
}
