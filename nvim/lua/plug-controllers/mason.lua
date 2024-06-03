return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"VonHeikemen/lsp-zero.nvim",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			-- require("mason-lspconfig").setup({
			-- 	ensure_installed = {
			-- 		"lua_ls",
			-- 		"volar",
			-- 		"eslint",
			-- 		"html",
			-- 		"tsserver",
			-- 		-- "stylua",
			-- 		-- "prettier",
			-- 		"dockerls",
			-- 		"rust_analyzer",
			-- 	},
			-- 	automatic_installation = true,
			-- })
		end,
	},
}
