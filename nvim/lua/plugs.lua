local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

-- Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'tomtom/tcomment_vim'
Plug('mg979/vim-visual-multi', {
	['branch'] = 'master'
})

Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = ':TSUpdate'
})

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb'

Plug 'neovim/nvim-lspconfig'
-- Plug('ms-jpq/coq_nvim', {
-- 	['run'] = 'python3 -m coq deps'
-- })
-- Plug 'ms-jpq/coq.artifacts'
-- Plug 'ms-jpq/coq.thirdparty'
-- Plug('neoclide/coc.nvim', {
-- 	['branch'] = 'release'
-- })
Plug 'github/copilot.vim'

Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'machakann/vim-highlightedyank'
Plug 'alvan/vim-closetag'


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/trouble.nvim'
-- if isdirectory('/usr/local/opt/fzf')
--   Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
-- else
-- Plug('junegunn/fzf', {
-- 	['dir'] = '~/.fzf',
-- 	['do'] = './install --bin'
-- })
-- Plug 'junegunn/fzf.vim'
-- endif
-- let g:make = 'gmake'
-- if exists('make')
--         let g:make = 'make'
-- endif
-- Plug 'Shougo/vimproc.vim', {'do': g:make}
-- Snippets
-- Plug 'SirVer/ultisnips'
-- Plug 'honza/vim-snippets'
Plug 'lilydjwg/colorizer'
Plug 'amadeus/vim-convert-color-to'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
--
-- Miscellaneos
Plug 'mhinz/vim-startify'
--
-- -- Tmux Integration
Plug 'christoomey/vim-tmux-navigator'
--
vim.call('plug#end')
