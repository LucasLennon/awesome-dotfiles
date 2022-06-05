local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
-- Plug 'mg979/vim-visual-multi', {'branch': 'master'}
--
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

Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'machakann/vim-highlightedyank'
Plug 'alvan/vim-closetag'
-- if isdirectory('/usr/local/opt/fzf')
--   Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
-- else
Plug('junegunn/fzf', {
	['dir'] = '~/.fzf',
	['do'] = './install --bin'
})
Plug 'junegunn/fzf.vim'
-- endif
-- let g:make = 'gmake'
-- if exists('make')
--         let g:make = 'make'
-- endif
-- Plug 'Shougo/vimproc.vim', {'do': g:make}
-- Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
