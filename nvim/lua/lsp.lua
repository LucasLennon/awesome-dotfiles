local servers = { 'cssls', 'html', 'jsonls', 'eslint', 'emmet_ls', 'tsserver', 'tailwindcss', 'vls', 'volar', 'vimls', 'yamlls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end
