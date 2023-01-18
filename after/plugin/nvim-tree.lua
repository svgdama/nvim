require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "l", action = "edit", action_cb = "edit_or_open" },
				{ key = "L", action = "vsplit_preview", action_cb = "vsplit_preview" },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all", action_cb = "collapse_all" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
