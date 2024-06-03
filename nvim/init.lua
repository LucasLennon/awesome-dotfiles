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

local snippetsConfig = require 'plug-controllers/snippets';
local lspZeroConfig = require 'plug-controllers/lspZero';
local illuminateConfig = require 'plug-controllers/vim-illuminate';
local lirConfig = require 'plug-controllers/lir';
-- local cmpConfig = require 'plug-controllers/cmp';
local masonConfig = require 'plug-controllers/mason';
local troubleConfig = require 'plug-controllers/trouble';
local whichKeyConfig = require 'plug-controllers/whichKey';

vim.g.mapleader = ",";

require("lazy").setup({
	-- {
	-- 	'nvim-tree/nvim-tree.lua',
	-- 	config = function()
	-- 		require("nvim-tree").setup()
	-- 	end
	-- },
	-- {
	--   "theniceboy/nvim",
	--   lazy = false,
	--   priority = 1000,
	-- },
	-- Visual stuff
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
		end
	},
	'nvim-lualine/lualine.nvim',
	{
		'akinsho/bufferline.nvim',
		tag = '*',
	},
	-- Things
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("zen-mode").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	whichKeyConfig,
	{
		'alexghergh/nvim-tmux-navigation',
		event = "VeryLazy",
		config = function()
			require('nvim-tmux-navigation').setup({
				disable_when_zoomed = true,
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				}
			})
		end
	},
	-- Mason
	masonConfig,
	lspZeroConfig,
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			require('conform').setup({
				formatters_by_ft = {
					volar = { "eslint_d" },
					vue = { "eslint_d" },
					javascript = { "eslint_d" },
					typescript = { "eslint_d" }
				}
			})
		end
	},
	-- LSP, CMP, Telescope and Treesitter
	'neovim/nvim-lspconfig',
	'rafamadriz/friendly-snippets',
	snippetsConfig,
	troubleConfig,
	-- cmpConfig,
	'saadparwaiz1/cmp_luasnip',
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		config = function()
			require('telescope').load_extension('notify')
		end
	},
	illuminateConfig,
	lirConfig,
	require('plug-controllers/treesitter'),
	-- Helpers
	{
		"rcarriga/nvim-notify",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require('notify').setup({
				background_colour = "#000000"
			})
			vim.notify = require("notify");
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "VeryLazy"
	},
	{
		'phaazon/hop.nvim',
		event = "VeryLazy"
	},
	{
		'echasnovski/mini.comment',
		version = false,
		event = "VeryLazy",
		config = function()
			require('mini.comment').setup()
		end
	},
	'airblade/vim-gitgutter',
	'vim-scripts/grep.vim',
	'tpope/vim-surround',
	'machakann/vim-highlightedyank',
	'tpope/vim-fugitive',
	-- 'tpope/vim-rhubarb',
	{
		import = 'configs/theme'
	},
	{
		import = 'configs/commands'
	},
}, opts)

-- require 'plug-controllers/cmp'
-- require 'plug-controllers/lspConfig'
require 'plug-controllers/hop'
require 'plug-controllers/bufferline'
require 'plug-controllers/lualine'
require 'plug-controllers/telescope'
require 'plug-controllers/autopairs'
require 'plug-controllers/icons'

vim.diagnostic.config({
	virtual_text = false
})
