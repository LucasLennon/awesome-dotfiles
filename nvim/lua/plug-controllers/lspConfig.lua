local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lspconfig.eslint.setup({
--     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
--     -- on_attach = function(client, bufnr)
--     --   vim.api.nvim_create_autocmd("BufWritePre", {
--     --     buffer = bufnr,
--     --     command = "EslintFixAll",
--     --   })
--     -- end,
-- })


-- lspconfig.volar.setup({
--     capabilities = capabilities,
--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
-- })
--
-- lspconfig.vimls.setup({
--     capabilities = capabilities,
--     filetypes = { 'vim' },
-- })


-- lspconfig.tsserver.setup({
--     capabilities = capabilities,
--     filetypes = { 'typescriptreact', 'javascriptreact', 'typescript', 'javascript' },
-- })

-- lspconfig.lua_ls.setup {
--     capabilities = capabilities,
--     settings = {
--       Lua = {
--         runtime = {
--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--           version = 'LuaJIT',
--         },
--         diagnostics = {
--           -- Get the language server to recognize the `vim` global
--           globals = {'vim'},
--         },
--         workspace = {
--           -- Make the server aware of Neovim runtime files
--           library = vim.api.nvim_get_runtime_file("", true),
--         },
--         -- Do not send telemetry data containing a randomized but unique identifier
--         telemetry = {
--           enable = false,
--         },
--       },
--     },
-- }
