return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			-- "VonHeikemen/lsp-zero.nvim",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		-- config = function()
		-- 	require("mason-lspconfig").setup({
		-- 		ensure_installed = {
		-- 			-- "lua_ls",
		-- 			"volar",
		-- 			"eslint",
		-- 			-- "html",
		-- 			-- "tsserver",
		-- 			-- "dockerls",
		-- 			-- "rust_analyzer",
		-- 		},
		-- 		automatic_installation = true,
		-- 	})
		-- end,
	},
}
