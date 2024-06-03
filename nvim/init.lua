local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local snippetsConfig = require("plug-controllers/snippets")
local lspZeroConfig = require("plug-controllers/lspZero")
local illuminateConfig = require("plug-controllers/vim-illuminate")
local masonConfig = require("plug-controllers/mason")
local troubleConfig = require("plug-controllers/trouble")
local whichKeyConfig = require("plug-controllers/whichKey")

vim.g.mapleader = ","

require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
		end,
	},
	"nvim-lualine/lualine.nvim",
	{
		"akinsho/bufferline.nvim",
	},
	{
		"pocco81/true-zen.nvim",
		lazy = true,
		config = function()
			require("true-zen").setup()
		end,
	},
	whichKeyConfig,
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true,
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	masonConfig,
	lspZeroConfig,
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					vue = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
	"rafamadriz/friendly-snippets",
	snippetsConfig,
	troubleConfig,
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	"saadparwaiz1/cmp_luasnip",
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("notify")
		end,
	},
	illuminateConfig,
	require("plug-controllers/treesitter"),
	{
		"rcarriga/nvim-notify",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {
			startVisible = true,
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	"airblade/vim-gitgutter",
	"vim-scripts/grep.vim",
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	-- "tpope/vim-fugitive",
	{
		import = "configs/theme",
	},
	{
		import = "configs/commands",
	},
}, opts)

require("plug-controllers/bufferline")
require("plug-controllers/lualine")
require("plug-controllers/telescope")
require("plug-controllers/autopairs")
require("plug-controllers/icons")

vim.diagnostic.config({
	virtual_text = false,
})
