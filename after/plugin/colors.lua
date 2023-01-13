-- Ref: https://github.com/ellisonleao/gruvbox.nvim
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    dim_inactive = false,
    transparent_mode = false,
    overrides = {},
})
vim.cmd("colorscheme gruvbox")
-- -- require('rose-pine').setup({
-- --     disable_background = true
-- -- })
-- --
-- -- function ColorMyPencils(color)
-- -- 	color = color or "rose-pine"
-- -- 	vim.cmd.colorscheme(color)
-- -- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- -- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- --
-- -- end
-- --
-- -- ColorMyPencils()
-- --
-- require('rose-pine').setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = true,
--
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		panel = 'surface',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
--
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
--
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'muted' }
-- 	}
-- })
--
-- -- set colorscheme after options
-- vim.cmd.colorscheme("rose-pine")
