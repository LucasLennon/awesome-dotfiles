local function mapkey(mode, method, action, options)
	return vim.keymap.set(mode, method, action, options)
end

mapkey("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
mapkey("i", "<Esc>", function()
	vim.notify("Bad habits need to die")
end)

mapkey("n", "n", "nzzzv")
mapkey("n", "N", "Nzzzv")

-- "" Set working directory
mapkey("n", "<leader>. :lcd", "::%:p:h<CR>")
-- "" Opens an edit command with the path of the currently edited file filled in
mapkey("n", '<Leader>e :e <C-R>=expand("%:p:h") . "/"', "<CR>")
-- "" Opens a tab edit command with the path of the currently edited file filled
mapkey("n", '<Leader>te :tabe <C-R>=expand("%:p:h") . "/"', "<CR>")

mapkey("n", "<leader>y", "::History:<CR>")
--
mapkey("n", "<F4>", "::TagbarToggle<CR>")

-- "" Clean search (highlight)
mapkey("n", "<leader><space>", "noh<cr>")
-- "" Switching windows
mapkey("n", "<C-j>", "<C-w>j")
mapkey("n", "<C-k>", "<C-w>k")
mapkey("n", "<C-l>", "<C-w>l")
mapkey("n", "<C-h>", "<C-w>h")
-- "" Vmap for maintain Visual Mode after shifting > and <
mapkey("v", "<", "<gv")
mapkey("v", ">", ">gv")
