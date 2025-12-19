return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "vue", "typescript", "javascript", "scss", "css", "html" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
