return {
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		},
	}


}
