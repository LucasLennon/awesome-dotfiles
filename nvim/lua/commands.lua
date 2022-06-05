function remap (type, key, action, options)
	return vim.keymap.set(type, key, action, options)
end

remap('n', 'n', 'nzzzv')
remap('n', 'N', 'Nzzzv')

-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
-- "" no one is really happy until you have this shortcuts
remap('n', 'W', ':w<CR>')
remap('n', 'W', ':w<CR>')
remap('n', 'W!', ':w!<CR>')
remap('n', 'WA', ':wa<CR>')
remap('n', 'WA!', ':wa!<CR>')
remap('n', 'WQ', ':wq<CR>')
remap('n', 'Q', ':q<CR>')
remap('n', 'Q!', ':q!<CR>')
remap('n', 'QA', ':qa<CR>')
remap('n', 'QA!', ':qa!<CR>')
remap('n', 'WQA', ':wqa<CR>')
remap('n', 'WQA!', ':wqa!<CR>')

remap('n', '<F2>', ':NERDTreeFind<CR>')
remap('n', '<F3>', ':NERDTreeToggle<CR>')

-- " grep.vim
-- "nnoremap <leader>f :Rgrep<CR>
remap('n', '<leader>f', ':Ag<CR>')

-- " terminal emulation
--remap('n', '<leader>sh', ':terminal<CR>')
--
-- "*****************************************************************************
-- "" Commands
-- "*****************************************************************************
-- " remove trailing whitespaces
-- command! FixWhitespace :%s/\s\+$//e

-- "*****************************************************************************
-- "" Mappings
-- "*****************************************************************************
-- "" Split
remap('n', '<Leader>h', ':<C-u>split<CR>', {remap = true})
remap('n', '<Leader>v', ':<C-u>vsplit<CR>', {remap = true})
-- "" Git
-- "remap('n', '<Leader>ga', ':Gwrite<CR>')
-- "remap('n', '<Leader>gc', ':Gcommit<CR>')
-- "remap('n', '<Leader>gsh', ':Gpush<CR>')
-- "remap('n', '<Leader>gll', ':Gpull<CR>')
-- "remap('n', '<Leader>gs', ':Gstatus<CR>')
-- "remap('n', '<Leader>gb', ':Gblame<CR>')
-- "remap('n', '<Leader>gd', ':Gvdiff<CR>')
-- "remap('n', '<Leader>gr', ':Gremove<CR>')
-- " session management
remap('n', '<leader>so', ':OpenSession<Space>')
remap('n', '<leader>ss', ':SaveSession<Space>')
remap('n', '<leader>sd', ':DeleteSession<CR>')
remap('n', '<leader>sc', ':CloseSession<CR>')
-- "" Tabs
remap('n', '<Tab>', 'gt')
remap('n', '<S-Tab>', 'gT')
remap('n', '<S-t>', ':tabnew<CR>')
-- "" Set working directory
remap('n', '<leader>. :lcd', '%:p:h<CR>')
-- "" Opens an edit command with the path of the currently edited file filled in
remap('n', '<Leader>e :e <C-R>=expand("%:p:h") . "/"', '<CR>')
-- "" Opens a tab edit command with the path of the currently edited file filled
remap('n', '<Leader>te :tabe <C-R>=expand("%:p:h") . "/"', '<CR>')

-- cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
remap('n', '<leader>b', ':Buffers<CR>')
remap('n', '<leader>e :FZF', '-m<CR>')
-- "Recovery commands from history through FZF
-- remap('n', '<leader>y', ':History:<CR>')
--
-- " remap('n', '<A-S-e> :CocCommand', 'eslint.executeAutofix<CR>')
remap('n', '<A-S-e>', ':ALEFix<CR>')
remap('n', '<leader>agtd', ':ALEGoToDefinition<CR>')
remap('n', '<leader>ar', ':ALERename<CR>')
remap('n', '<leader>aca', ':ALECodeAction<CR>')
remap('n', '<leader>afr', ':ALEFindReferences<CR>')

remap('n', '<F4>', ':TagbarToggle<CR>')

remap('n', 'YY', '"+y<CR>')
remap('n', '<leader>p', '"+gP<CR>')
remap('n', 'XX', '"+x<CR>')

-- if has('macunix')
--   " pbcopy for OSX copy/paste
--   remap('v', '<C-x>', ':!pbcopy<CR>')
--   remap('v', '<C-c> :w', '!pbcopy<CR><CR>')
-- endif

-- "" Buffer nav
remap('n', '<leader>q', ':bp<CR>')
remap('n', '<leader>w', ':bn<CR>')
-- "remap('n', '<leader>z', ':bp<CR>')
-- "remap('n', '<leader>x', ':bn<CR>')
-- "" Close buffer
-- "remap('n', '<leader>c', ':bd<CR>')
-- "" Clean search (highlight)
remap('n', '<leader><space>', ':noh<cr>')
-- "" Switching windows
remap('n', '<C-j>', '<C-w>j')
remap('n', '<C-k>', '<C-w>k')
remap('n', '<C-l>', '<C-w>l')
remap('n', '<C-h>', '<C-w>h')
-- "" Vmap for maintain Visual Mode after shifting > and <
remap('v', '<', '<gv')
remap('v', '>', '>gv')
-- "" Move visual block
remap('v', 'J :m', '>+1<CR>gv=gv')
remap('v', 'K :m', '<-2<CR>gv=gv')
-- "" Open current line on GitHub
remap('n', '<Leader>o', ':.Gbrowse<CR>')

-- " Custom Configs for Hard Mode without distant keys
-- " This will hopefully improve my VIM key knowledge
remap('n', '<BS>', '<nop>')

remap('v', '<Left>', '<nop>')
remap('v', '<Right>', '<nop>')
remap('v', '<Up>', '<nop>')
remap('v', '<Down>', '<nop>')
remap('v', '<BS>', '<nop>')

remap('n', '<Leader><C-P>', ':GFiles<CR>')
remap('n', '<C-P>', ':Files<CR>')

-- "Close all buffers
--remap('n', '<Leader>bca :bufdo', 'bwipeout<CR>')
-- "remap('n', '<Leader>rn :set', 'relativenumber!<CR>')
remap('n', '<Leader>wrd :vertical resize', '80<CR>')

vim.keymap.set('', '<Leader>c', ':bp<bar>sp<bar>bn<bar>bd<CR>')
