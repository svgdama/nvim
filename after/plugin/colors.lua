local c = require("vscode.colors").get_colors()
require("vscode").setup({
	-- Enable transparent background
	-- transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		-- vscLineNumber = "#FFFFFF",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	},
})
-- require("rose-pine").setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = "main",
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = false,
--
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = "base",
-- 		panel = "surface",
-- 		border = "highlight_med",
-- 		comment = "muted",
-- 		link = "iris",
-- 		punctuation = "subtle",
--
-- 		error = "love",
-- 		hint = "iris",
-- 		info = "foam",
-- 		warn = "gold",
--
-- 		headings = {
-- 			h1 = "iris",
-- 			h2 = "foam",
-- 			h3 = "rose",
-- 			h4 = "gold",
-- 			h5 = "pine",
-- 			h6 = "foam",
-- 		},
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	highlight_groups = {
-- 		ColorColumn = { bg = "surface" },
-- 	},
-- })
-- -- set colorscheme after options
-- vim.cmd("colorscheme rose-pine")
