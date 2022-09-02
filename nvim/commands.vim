nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
nnoremap W :w<CR>
nnoremap W! :w!<CR>
nnoremap WA :wa<CR>
nnoremap WA! :wa!<CR>
nnoremap WQ :wq<CR>
nnoremap Q :q<CR>
nnoremap Q! :q!<CR>
nnoremap QA :qa<CR>
nnoremap QA! :qa!<CR>
nnoremap WQA :wqa<CR>
nnoremap WQA! :wqa!<CR>

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
"nnoremap <silent> <leader>f :Rgrep<CR>
nnoremap <silent> <leader>f :Ag<CR>

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"" Git
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>
" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"Recovery commands from history through FZF
"" Open current line on GitHub
" nnoremap <Leader><C-P> :GFiles<CR>
" nnoremap <C-P> :Files<CR>
" nnoremap <Leader>o :.Gbrowse<CR>
" nmap <silent> <F4> :TagbarToggle<CR>
" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>
" nmap <leader>y :History:<CR>

" nmap <A-S-e> :ALEFix<CR>
" nmap <leader>agtd :ALEGoToDefinition<CR>
" nmap <leader>ar :ALERename<CR>
" nmap <leader>aca :ALECodeAction<CR>
" nmap <leader>afr :ALEFindReferences<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" noremap <leader>z :bp<CR>
" noremap <leader>x :bn<CR>
"" Close buffer
" noremap <leader>c :bd<CR>
map <Leader>c :bp<bar>sp<bar>bn<bar>bd<CR>
"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Custom Configs for Hard Mode without distant keys
" This will hopefully improve my VIM key knowledge
nnoremap <BS> <nop>

vnoremap <Left> <nop>
vnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <BS> <nop>

"Close all buffers
nnoremap <Leader>bca :bufdo bwipeout<CR>

" noremap <Leader>rn :set relativenumber!<CR>
noremap <Leader>wrd :vertical resize 80<CR>

" Telescope stuff
nnoremap <C-P> <cmd>Telescope git_files<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
