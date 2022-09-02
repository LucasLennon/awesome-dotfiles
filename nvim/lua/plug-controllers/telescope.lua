local actions = require 'telescope.actions'

require'telescope'.setup {
	pickers = {
		buffers = {
			selection_strategy = "row",
			show_all_buffers = true,
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = {
					["x"] = actions.delete_buffer,
				}
			}
		}
	}
}
