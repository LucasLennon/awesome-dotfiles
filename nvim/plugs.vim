let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif
if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
" Themes
Plug 'joshdick/onedark.vim'
" Plug 'jonathanfilip/vim-lucius'

Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
" Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

" Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', { 'run': 'python3 -m coq deps' }
Plug 'ms-jpq/coq.artifacts'
Plug 'ms-jpq/coq.thirdparty'

Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'machakann/vim-highlightedyank'
Plug 'alvan/vim-closetag'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" if isdirectory('/usr/local/opt/fzf')
"   Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" else
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
"   Plug 'junegunn/fzf.vim'
" endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}
"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" html
"" HTML Bundle
Plug 'lilydjwg/colorizer'
Plug 'amadeus/vim-convert-color-to'
Plug 'mattn/emmet-vim'
" vuejs
" Plug 'Quramy/tsuquyomi'
" Plug 'Quramy/tsuquyomi-vue'
Plug 'posva/vim-vue'

Plug 'mhinz/vim-startify'

" Tmux Integration
Plug 'christoomey/vim-tmux-navigator'

if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif
call plug#end()
