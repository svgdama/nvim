-- vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 54
vim.opt.colorcolumn = "80"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.t_Co = 256
vim.g.syntax = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25

--vim.o.background = "dark" -- or "light" for light mode
--vim.g.gruvbox_transparent_bg = 'yes'
--vim.cmd([[colorscheme gruvbox]])

--  local utils = require('utils')
--  utils.create_augroup({
--      { 'BufNewFile,BufReadPost', '*.md', 'set', 'filetype=markdown' },
--      { 'BufRead,BufNewFile', '*.yaml', 'set', 'filetype=yaml' }
--  }, 'BufE')
