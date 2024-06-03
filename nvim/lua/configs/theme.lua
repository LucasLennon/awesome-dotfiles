local theme = {
	'My Theme',
	event = 'BufEnter',
	lazy = true,
	dev = true,
	pin = true,
 	config = function ()
	 local global = vim.api.nvim_set_option;

	 global('tabstop', 2);
	 global('softtabstop', 0);
	 global('shiftwidth', 2);
	 global('expandtab', true);

	 -- Visual
	 global('inccommand', "nosplit")
	 global('ruler', true)
	 -- global('number', true)
	 -- global('relativenumber', true)
	 vim.opt.mouse = "";
	 vim.wo.number = true;
	 vim.wo.relativenumber = true;

	 -- global('no_buffers_menu', 1)
	 global('mousemodel', "popup")
	 global('t_Co', '256')
	 -- global('guioptions', "egmrti")
	 global('guifont', "JetBrains Mono NF")

	 -- Disable the blinking cursor.
	 global('gcr', "a:blinkon1")
	 -- au TermEnter * setlocal scrolloff=0
	 -- au TermLeave * setlocal scrolloff=3
	 -- Status bar
	 global('laststatus', 2)
	 -- Use modeline overrides
	 global('modeline', true)
	 global('modelines', 10)
	 global('title', true)
	 global('titleold', "Terminal")
	 global('titlestring', "%F")

	 vim.opt.wildignore.append="*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite";

	 vim.g['airline_theme']="powerlineish";


	 vim.api.nvim_set_hl(0, 'LineNr', { bg = "#000000", fg = "#ffffff"})
	 vim.cmd('filetype plugin indent on');
	 vim.cmd('syntax on');
	 vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
	 vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

	 global('backspace', "indent,eol,start");
	 global('fileencoding', "utf-8");

	 -- Copy/Paste/Cut
	 global('clipboard','unnamed,unnamedplus')

	 global('hlsearch', true);
	 global('incsearch', true);
	 global('ignorecase', true);
	 global('smartcase', true);
	 global('fileformats', "unix,dos,mac");

	 vim.g['session_directory'] = "~/.config/nvim/session";
	 vim.g['session_autoload'] = "no";
	 vim.g['session_autosave'] = "no";
	 vim.g['session_command_aliases'] = 2;
	end
}
return theme
