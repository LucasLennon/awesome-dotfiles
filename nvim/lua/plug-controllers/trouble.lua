return {
  "folke/trouble.nvim",
  cmd = 'Trouble',
  dependencies = {
    -- 'kyazdani42/nvim-web-devicons',
		"nvim-tree/nvim-web-devicons"
	},
  config = function()
    require("trouble").setup {}
  end
}
