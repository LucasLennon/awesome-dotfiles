return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<SPACE>b", group = "Buffer" },
		{ "<SPACE>bc", group = "Comments" },
		{ "<SPACE>bcc", "<cmd>gc<cr>", desc = "Comment" },
		{ "<SPACE>bcl", "<cmd>gcc<cr>", desc = "Comment Line" },
		{ "<SPACE>bd", "<cmd>bd<cr>", desc = "Delete" },
		{ "<SPACE>bn", "<cmd>bn<cr>", desc = "Next" },
		{ "<SPACE>bp", "<cmd>bp<cr>", desc = "Previous" },
		{ "<SPACE>bq", "<cmd>q<cr>", desc = "Quit" },
		{ "<SPACE>bqa", "<cmd>qa<cr>", desc = "Quit All" },
		{ "<SPACE>bw", "<cmd>w<cr>", desc = "Save Buffer" },
		{ "<SPACE>bwa", "<cmd>wa<cr>", desc = "Save All Buffers" },
		{ "<SPACE>bwq", "<cmd>wq<cr>", desc = "Save and Quit" },
		{ "<SPACE>f", group = "Find" },
		{ "<SPACE>fa", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find all" },
		{ "<SPACE>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
		{ "<SPACE>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Find Definitions" },
		{ "<SPACE>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
		{ "<SPACE>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git File" },
		{ "<SPACE>fgrep", "<cmd>Telescope live_grep<cr>", desc = "Find in Grep" },
		{ "<SPACE>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Find Implementations" },
		{ "<SPACE>ftrf", "<cmd>Telescope lsp_references<cr>", desc = "Find References" },
		{ "<SPACE>ftrs", "<cmd>Telescope resume<cr>", desc = "Resume Telescope Search" },
		{ "<SPACE>l", group = "LSP Commands" },
		{
			"<SPACE>lls",
			function()
				vim.lsp.start_client(vim.lsp.get_clients())
			end,
			desc = "Start",
		},
		{
			"<SPACE>llx",
			function()
				vim.lsp.stop_client(vim.lsp.get_clients())
			end,
			desc = "Stop",
		},
		-- { "<SPACE>lr", vim.lsp.rename(), desc = "Rename" },
		{
			"<SPACE>lca",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Code Action",
		},
		{
			"<SPACE>lcd",
			function()
				vim.lsp.buf.definition()
			end,
			desc = "Definition",
		},
		{
			"<SPACE>lci",
			function()
				vim.lsp.buf.implementation()
			end,
			desc = "Implementation",
		},
		{ "<SPACE>lc", group = "Code" },
		{ "<SPACE>ll", group = "LSP" },
		{ "<SPACE>p", group = "Plugins" },
		{ "<SPACE>pn", "<cmd>Neotree<cr>", desc = "NeoTree" },
		{ "<SPACE>pt", group = "Trouble" },
		{ "<SPACE>ptc", "<cmd>TroubleClose<cr>", desc = "Close Trouble" },
		{ "<SPACE>pto", "<cmd>Trouble<cr>", desc = "Open Trouble" },
		{ "<SPACE>ptr", "<cmd>TroubleRefresh<cr>", desc = "Refresh Trouble" },
		{ "<SPACE>ptt", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
		{ "<SPACE>t", group = "Tabs" },
		{ "<SPACE>td", "<cmd>tabclose<cr>", desc = "Close Tab" },
		{ "<SPACE>te", "<cmd>tabedit", desc = "Edit Tab" },
		{ "<SPACE>tn", "<cmd>tabnext<cr>", desc = "Next Tab" },
		{ "<SPACE>to", "<cmd>tabnew<cr>", desc = "Open a new Tab" },
		{ "<SPACE>tp", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
		{ "<SPACE>z", group = "ZenModes" },
		{
			"<SPACE>za",
			"<cmd>TZAtaraxis<cr>",
			desc = "Toogle Ataraxis",
		},
		{
			"<SPACE>zf",
			"<cmd>TZFocus<cr>",
			desc = "Toogle Focus",
		},
		{
			"<SPACE>zm",
			"<cmd>TZMinimalist<cr>",
			desc = "Toogle Minimalist",
		},
		{
			"<SPACE>zn",
			"<cmd>TZNarrow<cr>",
			desc = "Toogle Narrow",
			mode = { "n", "v" },
		},
		{
			"<SPACE>nd",
			function()
				local notify = require("notify")
				notify.dismiss()
			end,
			desc = "Dismiss Notifications",
		},
		-- { "<SPACE>llr", <function 1>, desc = "Restart" },
		-- {
		-- 	"<SPACE>nd",
		-- 	function()
		-- 		notify.dismiss()
		-- 	end,
		-- 	desc = "Dismiss",
		-- },
		-- {
		-- 	"<SPACE>bf",
		-- 	function()
		-- 		require("conform").format({ async = true })
		-- 	end,
		-- 	desc = "Format",
		-- },
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		-- local illuminate = require("illuminate")
		local notify = require("notify")
		local wk = require("which-key")

		-- wk.register({
		-- 	v = {
		-- 		c = {
		-- 			name = "Vim Config",
		-- 			b = {
		-- 				name = "Background",
		-- 				l = {
		-- 					function()
		-- 						vim.opt.background = "light"
		-- 					end,
		-- 					"Light Mode",
		-- 				},
		-- 				d = {
		-- 					function()
		-- 						vim.opt.background = "dark"
		-- 					end,
		-- 					"Dark Mode",
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- 	l = {
		-- 		name = "LSP Commands",
		-- 		l = {
		-- 			name = "LSP",
		-- 			x = {
		-- 				function()
		-- 					vim.cmd("LspStop")
		-- 				end,
		-- 				"Stop",
		-- 			},
		-- 			s = {
		-- 				function()
		-- 					vim.cmd("LspStart")
		-- 				end,
		-- 				"Start",
		-- 			},
		-- 			r = {
		-- 				function()
		-- 					vim.cmd("LspRestart")
		-- 				end,
		-- 				"Restart",
		-- 			},
		-- 		},
		-- 		r = {
		-- 			function()
		-- 				vim.lsp.buf.rename()
		-- 			end,
		-- 			"Rename",
		-- 		},
		-- 		c = {
		-- 			name = "Code",
		-- 			d = {
		-- 				function()
		-- 					vim.lsp.buf.definition()
		-- 				end,
		-- 				"Definition",
		-- 			},
		-- 			i = {
		-- 				function()
		-- 					vim.lsp.buf.implementation()
		-- 				end,
		-- 				"Implementation",
		-- 			},
		-- 			a = {
		-- 				function()
		-- 					vim.lsp.buf.code_action()
		-- 				end,
		-- 				"Code Action",
		-- 			},
		-- 		},
		-- 	},
		-- 	n = {
		-- 		name = "Notifications",
		-- 		n = {
		-- 			function()
		-- 				telescope.extensions.notify.notify({
		-- 					selection_strategy = "row",
		-- 					show_all_buffers = true,
		-- 					sort_lastused = true,
		-- 					theme = "dropdown",
		-- 					previewer = false,
		-- 				})
		-- 			end,
		-- 			"Notifications",
		-- 		},
		-- 		d = {
		-- 			function()
		-- 				notify.dismiss()
		-- 			end,
		-- 			"Dismiss",
		-- 		},
		-- 	},
		-- 	f = {
		-- 		name = "Find",
		-- 		p = {
		-- 			function()
		-- 				illuminate.goto_prev_reference()
		-- 			end,
		-- 			"Go to Previous Reference",
		-- 		},
		-- 		n = {
		-- 			function()
		-- 				illuminate.goto_next_reference()
		-- 			end,
		-- 			"Go to Next Reference",
		-- 		},
		-- 		t = {
		-- 			name = "Telescope",
		-- 			rs = { "<cmd>Telescope resume<cr>", "Resume Telescope Search" },
		-- 			f = { "<cmd>Telescope find_files<cr>", "Find File" },
		-- 			g = { "<cmd>Telescope git_files<cr>", "Find Git File" },
		-- 			d = { "<cmd>Telescope lsp_definitions<cr>", "Find Definitions" },
		-- 			i = { "<cmd>Telescope lsp_implementations<cr>", "Find Implementations" },
		-- 			rf = { "<cmd>Telescope lsp_references<cr>", "Find References" },
		-- 			grep = { "<cmd>Telescope live_grep<cr>", "Find in Grep" },
		-- 			b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		-- 		},
		-- 	},
		-- 	t = {
		-- 		name = "Tabs",
		-- 		o = {
		-- 			"<cmd>tabnew<cr>",
		-- 			"Open a new Tab",
		-- 		},
		-- 		n = {
		-- 			"<cmd>tabnext<cr>",
		-- 			"Next Tab",
		-- 		},
		-- 		p = {
		-- 			"<cmd>tabprevious<cr>",
		-- 			"Previous Tab",
		-- 		},
		-- 		e = {
		-- 			"<cmd>tabedit",
		-- 			"Edit Tab",
		-- 		},
		-- 		d = {
		-- 			"<cmd>tabclose<cr>",
		-- 			"Close Tab",
		-- 		},
		-- 	},
		-- 	b = {
		-- 		name = "Buffer",
		-- 		f = {
		-- 			function()
		-- 				require("conform").format({ async = true })
		-- 			end,
		-- 			"Format",
		-- 		},
		-- 		c = {
		-- 			name = "Comments",
		-- 			c = {
		-- 				"<cmd>gc<cr>",
		-- 				"Comment",
		-- 			},
		-- 			l = {
		-- 				"<cmd>gcc<cr>",
		-- 				"Comment Line",
		-- 			},
		-- 		},
		-- 		p = {
		-- 			"<cmd>bp<cr>",
		-- 			"Previous",
		-- 		},
		-- 		n = {
		-- 			"<cmd>bn<cr>",
		-- 			"Next",
		-- 		},
		-- 		d = {
		-- 			"<cmd>bd<cr>",
		-- 			"Delete",
		-- 		},
		-- 		w = {
		-- 			"<cmd>w<cr>",
		-- 			"Save Buffer",
		-- 		},
		-- 		q = {
		-- 			"<cmd>q<cr>",
		-- 			"Quit",
		-- 		},
		-- 		qa = {
		-- 			"<cmd>qa<cr>",
		-- 			"Quit All",
		-- 		},
		-- 		wa = {
		-- 			"<cmd>wa<cr>",
		-- 			"Save All Buffers",
		-- 		},
		-- 		wq = {
		-- 			"<cmd>wq<cr>",
		-- 			"Save and Quit",
		-- 		},
		-- 		wqa = {
		-- 			"<cmd>wqa<cr>",
		-- 			"Save and Quit All",
		-- 		},
		-- 	},
		-- 	p = {
		-- 		name = "Plugins",
		-- 		n = {
		-- 			function()
		-- 				vim.cmd("Neotree")
		-- 			end,
		-- 			"NeoTree",
		-- 		},
		-- 		t = {
		-- 			name = "Trouble",
		-- 			o = {
		-- 				"<cmd>Trouble<cr>",
		-- 				"Open Trouble",
		-- 			},
		-- 			c = {
		-- 				"<cmd>TroubleClose<cr>",
		-- 				"Close Trouble",
		-- 			},
		-- 			r = {
		-- 				"<cmd>TroubleRefresh<cr>",
		-- 				"Refresh Trouble",
		-- 			},
		-- 			t = {
		-- 				"<cmd>TroubleToggle<cr>",
		-- 				"Toggle Trouble",
		-- 			},
		-- 		},
		-- 	},
		-- 	z = {
		-- 		name = "ZenModes",
		-- 		a = {
		-- 			function()
		-- 				require("true-zen.ataraxis").toggle()
		-- 			end,
		-- 			"Toogle Ataraxis",
		-- 		},
		-- 		f = {
		-- 			function()
		-- 				require("true-zen.focus").toggle()
		-- 			end,
		-- 			"Toogle Focus",
		-- 		},
		-- 		m = {
		-- 			function()
		-- 				require("true-zen.minimalist").toggle()
		-- 			end,
		-- 			"Toogle Minimalist",
		-- 		},
		-- 		n = {
		-- 			function()
		-- 				require("true-zen.narrow").toggle(vim.fn.line("v"), vim.fn.line("."))
		-- 			end,
		-- 			"Toogle Narrow",
		-- 		},
		-- 	},
		-- }, { prefix = "<SPACE>" })
	end,
}
