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
local troubleConfig = require("plug-controllers/trouble")
local whichKeyConfig = require("plug-controllers/whichKey")

vim.g.mapleader = ","

require("lazy").setup({
	{
		"m4xshen/hardtime.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = true,
		event = "VeryLazy",
		version = "1.5.1",
		build = "cargo build --release",
		config = function()
			require("blink.cmp").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			theme = "auto",
		},
		config = function()
			require("lualine").setup({
				sections = {
					lualine_a = { "mode" },
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = {},
					lualine_z = { "searchcount", "location" },
				},
			})
		end,
	},
	{
		"pocco81/true-zen.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("true-zen").setup()
		end,
	},
	whichKeyConfig,
	{
		"alexghergh/nvim-tmux-navigation",
		lazy = true,
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
	require("plug-controllers/mason"),
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			formatters_by_ft = {
				typescript = {
					lsp_format = "fallback",
				},
				lua = { "stylua" },
				vue = { "eslint_d" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "never",
			},
		},
	},
	"rafamadriz/friendly-snippets",
	snippetsConfig,
	troubleConfig,
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("notify")
		end,
	},
	-- illuminateConfig,
	require("plug-controllers/treesitter"),
	{
		"rcarriga/nvim-notify",
		lazy = false,
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
		lazy = true,
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = true,
		event = "VeryLazy",
	},
	{
		"airblade/vim-gitgutter",
		lazy = true,
		event = "VeryLazy",
	},
	-- "vim-scripts/grep.vim",
	{
		"echasnovski/mini.surround",
		lazy = true,
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			-- vim.cmd("TransparentEnable")
			vim.cmd("TransparentDisable")
		end,
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = true,
				theme = "fluoromachine",
				transparent = false,
			})

			vim.cmd.colorscheme("fluoromachine")
		end,
	},
	-- {
	-- 	"danymat/neogen",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	config = true,
	-- 	-- Uncomment next line if you want to follow only stable versions
	-- 	-- version = "*"
	-- },
	{
		"startup-nvim/startup.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("startup").setup({
				main = {
					type = "text",
					oldfiles_directory = false,
					align = "center",
					fold_section = false,
					title = "",
					margin = 1,
					content = {
						"                                   ",
						"                                   ",
						"                                   ",
						"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
						"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
						"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
						"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
						"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
						"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
						"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
						" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
						" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
						"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
						"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
						"                                   ",
					},
					highlight = "Normal",
					default_color = "",
					oldfiles_amount = 0,
				},
				parts = { "main" },
			})
		end,
	},
}, opts)

require("configs/commands")
require("configs/theme")
require("plug-controllers/telescope")
require("plug-controllers/autopairs")
require("plug-controllers/icons")

vim.diagnostic.config({
	virtual_text = false,
})
