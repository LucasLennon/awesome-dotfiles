local Global = vim.g;

Global.NERDTreeChDirMode=2
Global.NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
Global.NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
Global.NERDTreeShowBookmarks=1
Global.nerdtree_tabs_focus_on_files=1
Global.NERDTreeMapOpenInTabSilent = '<RightMouse>'
Global.NERDTreeWinSize = 50

vim.Grep_Default_Options = '-IR'
vim.Grep_Skip_Files = '*.log *.db'
vim.Grep_Skip_Dirs = '.git node_modules'
