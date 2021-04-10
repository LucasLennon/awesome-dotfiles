" Required:
filetype plugin indent on
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"" Fix backspace indent
set backspace=indent,eol,start
"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
"" Map leader to ,
let mapleader=','
"" Enable hidden buffers
set hidden
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set inccommand=nosplit
syntax on
set ruler
set number
let no_buffers_menu=1
colorscheme onedark
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
" set gfn=Monospace\ 10
set guifont="JetBrains Mono NF"
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1
  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 1
  let g:indentLine_char = '|'
  let g:indentLine_faster = 1
  let g:indentLine_color_gui = '#A4E57E'
  let g:indentLine_leadingSpaceChar = '.'
  let g:indentLine_leadingSpaceEnabled = 1
endif
"" Disable the blinking cursor.
set gcr=a:blinkon1
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3
"" Status bar
set laststatus=2
"" Use modeline overrides
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

set autoread
