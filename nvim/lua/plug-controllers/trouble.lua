return {
	"folke/trouble.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		-- 'kyazdani42/nvim-web-devicons',
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup({})
	end,
}
