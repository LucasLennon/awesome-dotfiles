local commands = {
	'My Commands',
	event = 'BufEnter',
	lazy = true,
	dev = true,
	pin = true,
	config = function()
		local function mapkey (mode, method, action, options)
			return vim.keymap.set(mode, method, action, options)
		end

    -- vim.keymap.del('n', '<ScrollWheelUp>')
    -- vim.keymap.del('n', '<ScrollWheelLeft>')
    -- vim.keymap.del('n', '<ScrollWheelRight>')
    -- vim.keymap.del('n', '<ScrollWheelDown>')
    --
    -- vim.keymap.del('n', '<S-ScrollWheelUp>')
    -- vim.keymap.del('n', '<S-ScrollWheelLeft>')
    -- vim.keymap.del('n', '<S-ScrollWheelRight>')
    -- vim.keymap.del('n', '<S-ScrollWheelDown>')
    --
    -- vim.keymap.del('n', '<C-ScrollWheelUp>')
    -- vim.keymap.del('n', '<C-ScrollWheelLeft>')
    -- vim.keymap.del('n', '<C-ScrollWheelRight>')
    -- vim.keymap.del('n', '<C-ScrollWheelDown>')

		mapkey('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
		mapkey('i', '<Esc>', function ()
			vim.notify("Bad habits need to die")
		end)

		mapkey('n', 'n', 'nzzzv')
		mapkey('n', 'N', 'Nzzzv') 

		-- "*****************************************************************************
		-- "" Abbreviations
		-- "*****************************************************************************
		-- "" no one is really happy until you have this shortcuts
		-- mapkey('n', '<F2>', '::NERDTreeFind<CR>')
		-- mapkey('n', '<F3>', '::NERDTreeToggle<CR>')
		mapkey('n', '<F2>', ':NvimTreeFindFile<CR>')
		mapkey('n', '<F3>', ':NvimTreeToggle<CR>')
		-- "*****************************************************************************
		-- "" Mappings
		-- "*****************************************************************************
		-- "" Git
		-- "mapkey('n', '<Leader>ga', '::Gwrite<CR>')
		-- "mapkey('n', '<Leader>gc', '::Gcommit<CR>')
		-- "mapkey('n', '<Leader>gsh', '::Gpush<CR>')
		-- "mapkey('n', '<Leader>gll', '::Gpull<CR>')
		-- "mapkey('n', '<Leader>gs', '::Gstatus<CR>')
		-- "mapkey('n', '<Leader>gb', '::Gblame<CR>')
		-- "mapkey('n', '<Leader>gd', '::Gvdiff<CR>')
		-- "mapkey('n', '<Leader>gr', '::Gremove<CR>')
		-- " session management
		-- mapkey('n', '<leader>so', 'OpenSession<Space>')
		-- mapkey('n', '<leader>ss', 'SaveSession<Space>')
		-- mapkey('n', '<leader>sd', '::DeleteSession<CR>')
		-- mapkey('n', '<leader>sc', '::CloseSession<CR>')
		-- "" Tabs
		-- mapkey('n', '<Tab>', 'gt')
		-- mapkey('n', '<S-Tab>', 'gT')
		-- mapkey('n', '<S-t>', '::tabnew<CR>')
		-- "" Set working directory
		mapkey('n', '<leader>. :lcd', '::%:p:h<CR>')
		-- "" Opens an edit command with the path of the currently edited file filled in
		mapkey('n', '<Leader>e :e <C-R>=expand("%:p:h") . "/"', '<CR>')
		-- "" Opens a tab edit command with the path of the currently edited file filled
		mapkey('n', '<Leader>te :tabe <C-R>=expand("%:p:h") . "/"', '<CR>')

		-- cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
		-- "Recovery commands from history through FZF
		mapkey('n', '<leader>y', '::History:<CR>')
		--
		-- mapkey('n', '<A-S-e>', '::ALEFix<CR>')
		-- mapkey('n', '<leader>agtd', '::ALEGoToDefinition<CR>')
		-- mapkey('n', '<leader>ar', '::ALERename<CR>')
		-- mapkey('n', '<leader>aca', '::ALECodeAction<CR>')
		-- mapkey('n', '<leader>afr', '::ALEFindReferences<CR>')

		mapkey('n', '<F4>', '::TagbarToggle<CR>')

		-- mapkey('n', 'YY', '::"+y<CR>')
		-- mapkey('n', '<leader>p', '::"+gP<CR>')
		-- mapkey('n', 'XX', '::"+x<CR>')

		-- "" Clean search (highlight)
		mapkey('n', '<leader><space>', 'noh<cr>')
		-- "" Switching windows
		mapkey('n', '<C-j>', '<C-w>j')
		mapkey('n', '<C-k>', '<C-w>k')
		mapkey('n', '<C-l>', '<C-w>l')
		mapkey('n', '<C-h>', '<C-w>h')
		-- "" Vmap for maintain Visual Mode after shifting > and <
		mapkey('v', '<', '<gv')
		mapkey('v', '>', '>gv')
		-- "" Move visual block
		mapkey('v', 'J :m', '>+1<CR>gv=gv')
		mapkey('v', 'K :m', '<-2<CR>gv=gv')

		-- " Custom Configs for Hard Mode without distant keys
		-- " This will hopefully improve my VIM key knowledge
		mapkey('n', '<BS>', '<nop>')

		mapkey('v', '<Left>', '<nop>')
		mapkey('v', '<Right>', '<nop>')
		mapkey('v', '<Up>', '<nop>')
		mapkey('v', '<Down>', '<nop>')
		mapkey('v', '<BS>', '<nop>')

		-- mapkey('n', '<Leader><C-P>', ':GFiles<CR>')
		-- mapkey('n', '<C-P>', ':Files<CR>')
		-- mapkey('n', '<Leader>o', ':.Gbrowse<CR>')
		-- mapkey('n', '<leader>b', ':Buffers<CR>')
		-- mapkey('n', '<leader>e :FZF', ':-m<CR>')
		-- mapkey('n', '<leader>f', ':Ag<CR>')

		-- "Close all buffers
		--mapkey('n', '<Leader>bca :bufdo', ':bwipeout<CR>')
		-- "mapkey('n', '<Leader>rn :set', ':relativenumber!<CR>')
		-- mapkey('n', '<leader>fl', ':Telescope resume<cr>')
		-- mapkey('n', '<leader>fd', ':Telescope lsp_definitions<cr>')
		-- mapkey('n', '<leader>fi', ':Telescope lsp_implementations<cr>')
		-- mapkey('n', '<leader>fr', ':Telescope lsp_references<cr>')
		-- mapkey('n', '<leader>fg', ':Telescope live_grep<cr>')
		-- mapkey('n', '<leader>fb', ':Telescope buffers<cr>')
		-- mapkey('n', '<leader>fh', ':Telescope help_tags<cr>')

		-- "" Split
		-- mapkey('n', '<Leader>h', '<C-u>split<CR>', {remap = true})
		-- mapkey('n', '<Leader>v', '<C-u>vsplit<CR>', {remap = true})

		-- pbcopy for OSX copy/paste
		-- if has('macunix') then
		--   mapkey('v', '<C-x>', '!pbcopy<CR>')
		--   mapkey('v', '<C-c> :w', '!pbcopy<CR><CR>')
		-- end

		-- vim.cmd([[
		-- 	inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
		-- 	inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
		-- ]])
		-- HOP
		-- place this in one of your configuration file(s)


		-- vim.keymap.set('', 'f', function()
		--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		-- end, {remap=true})
		-- vim.keymap.set('', 'F', function()
		--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		-- end, {remap=true})
	end
}

return commands;
