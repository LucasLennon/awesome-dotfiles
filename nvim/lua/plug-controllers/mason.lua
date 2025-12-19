return {
	{
		"williamboman/mason.nvim",
		-- lazy = true,
		-- event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- lazy = true,
		-- event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local vue_language_server_path =
				vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}

			vim.lsp.config("vtsls", {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						vim.lsp.enable(server_name)
					end,
				},
			})
		end,
	},
}
