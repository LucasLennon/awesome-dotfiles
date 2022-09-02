local lspconfig = require('lspconfig')

vim.g.coq_settings = {
  clients = {
    tabnine = {
      enabled = true
    }
  },
  auto_start = 'shut-up',
  keymap = {
    jump_to_mark = ""
  }
}

-- local servers = { 'cssls', 'html', 'jsonls', 'eslint', 'tsserver', 'tailwindcss', 'vls', 'volar', 'vimls', 'yamlls' }
--
--
-- for _, lsp in pairs(servers) do
--   lspconfig[lsp].setup(
--     require('coq').lsp_ensure_capabilities({
--       -- on_attach = my_custom_on_attach,
--     })
--   )
-- end

-- Specific cases

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
})

lspconfig.eslint.setup({
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
})

-- vim.api.nvim_command('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue EslintFixAll')

-- lspconfig.vuels.setup({
-- })

lspconfig.volar.setup({
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
})

lspconfig.vimls.setup({
    filetypes = { 'vim' },
})

lspconfig.tailwindcss.setup({
    filetypes = { 'vue', 'html', 'css', 'sass', 'scss' },
})

lspconfig.tsserver.setup({
    filetypes = { 'typescriptreact', 'javascriptreact', 'typescript', 'javascript' },
})

lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
