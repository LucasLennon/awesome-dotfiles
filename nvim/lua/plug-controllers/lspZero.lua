---
-- LSP configuration
---
local lspconfig = require("lspconfig")
local lsp_zero = require("lsp-zero")
local mason = require("mason").setup({})
local masonLspConfig = require("mason-lspconfig")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

masonLspConfig.setup({
	ensure_installed = {
		"volar",
		"eslint",
		"lua_ls",
		"ts_ls",
	},
	-- handlers = {
	-- 	function(server_name)
	-- 		if server_name == "tsserver" then
	-- 			lspconfig.tsserver.setup({
	-- 				init_options = {
	-- 					plugins = {
	-- 						{
	-- 							name = "@vue/typescript-plugin",
	-- 							location = "/Users/lucas.lennonesperidiao/Library/pnpm/global/5/node_modules/@vue/language-server",
	-- 							languages = { "vue" },
	-- 						},
	-- 					},
	-- 				},
	-- 				-- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	-- 			})
	-- 		end
	-- 		if server_name == "volar" then
	-- 			lspconfig.volar.setup({
	-- 				init_options = {
	-- 					vue = {
	-- 						hybridMode = false,
	-- 					},
	-- 				},
	-- 			})
	-- 		end
	-- 		lspconfig[server_name].setup({})
	-- 	end,
	-- },
})

lspconfig.jsonls.setup({})
lspconfig.unocss.setup({})
lspconfig.eslint.setup({})
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/Users/lucas.lennonesperidiao/Library/pnpm/global/5/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
})

lspconfig.volar.setup({
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

---
-- Autocompletion setup
---
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})
