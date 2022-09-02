lua require 'init'
source ~/.config/nvim/theme.vim
lua require 'commands'
" source ~/.config/nvim/plugs.vim
" source ~/.config/nvim/commands.vim

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"
" ale
" let g:ale_linters = {
" \  'vue': ['eslint','vls', 'volar'],
" \  'javascript': ['eslint','tsserver'],
" \  'typescript': ['eslint','tsserver'],
" \  'javascriptreact': ['eslint','tsserver'],
" \  'typescriptreact': ['eslint','tsserver'],
" \  'json': ['jsonlint'],
" \  'jsonc': ['jsonlint'],
" \}
" let g:ale_completion_enabled = 0
" let g:ale_completion_autoimport = 1
" let g:ale_fixers = {
" \  'vue': ['eslint'],
" \  'javascript': ['eslint'],
" \  'typescript': ['eslint'],
" \  'javascriptreact': ['eslint'],
" \  'typescriptreact': ['eslint'],
" \  'html': ['html-beautify'],
" \  'json': ['fixjson', 'prettier'],
" \  'jsonc': ['fixjson', 'prettier'],
" \  '*': ['remove_trailing_lines', 'trim_whitespace'],
" \ }
" let g:ale_fix_on_save = 1
" let g:ale_javascript_eslint_options = {}

" Tagbar
let g:tagbar_autofocus = 1
" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
"*****************************************************************************
"" Custom configs
"*****************************************************************************
" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
" javascript
let g:javascript_enable_domhtmlcss = 1
" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl expandtab softtabstop=2
augroup END
" typescript
let g:yats_host_keyword = 1
" vuejs
" vim vue
let g:vue_disable_pre_processors=1
" vim vue plugin
let g:vim_vue_plugin_load_full_syntax = 1
"*****************************************************************************
"*****************************************************************************
"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
"*****************************************************************************
"" Convenience variables
"*****************************************************************************
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Custom Stuff
let g:javascript_plugin_jsdoc = 1
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "r"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:jsx_ext_required = 1
let g:python_host_prog = '~/.asdf/shims/python'
let g:python3_host_prog = '~/.asdf/shims/python3.10'
let g:airline_theme='onedark'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:startify_change_to_dir = 0

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.js,*.jsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'

" set autochdir
" set autoread
set foldmethod=syntax
set nofoldenable

" Cocnvim
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" NerdCommenter for Vue
"let g:ft = ''
"fu! NERDCommenter_before()
    "if &ft == 'vue'
        "let g:ft = 'vue'
        "let stack = synstack(line('.'), col('.'))
        "if len(stack) > 0
            "let syn = synIDattr((stack)[0], 'name')
            "if len(syn) > 0
                "let syn = tolower(syn)
                "exe 'setf '.syn
            "endif
        "endif
    "endif
"endfu
"fu! NERDCommenter_after()
    "if g:ft == 'vue'
        "setf vue
        "let g:ft = ''
    "endif
"endfu

" Vim Vue
"let g:vue_pre_processors = 'detect_on_enter'



" Vim Vue Plugin
" let g:vim_vue_plugin_config = {
" \'syntax': {
" \   'template': ['html'],
" \   'script': ['javascript'],
" \   'style': ['css'],
" \},
" \'full_syntax': [],
" \'initial_indent': [],
" \'attribute': 0,
" \'keyword': 0,
" \'foldexpr': 0,
" \'debug': 0,
" \}

" Hexokinase
" let g:Hexokinase_highlighters = ['virtual']
