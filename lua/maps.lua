vim.g.mapleader = " " -- 'vim.g' sets global variables
local utils = require("utils")

utils.map("n", "<leader>pv", vim.cmd.Ex)
utils.map({ "i", "v", "c" }, "<C-c>", "<Esc>")
utils.map("i", "jj", "<Esc>")

utils.map("v", "J", ":m '>+1<cr>gv=gv")
utils.map("v", "K", ":m '<-2<cr>gv=gv")

-- append next lines
utils.map("n", "J", "mzJ`z")

-- jump half page
utils.map("n", "<C-d>", "<C-d>zz")
utils.map("n", "<C-u>", "<C-u>zz")

-- utils.map("n", "n", "nzzzv")
-- utils.map("n", "N", "Nzzzv")

-- greatest remap ever
-- utils.map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
utils.map({ "n", "v" }, "<leader>y", [["+y]])
utils.map("n", "<leader>Y", [["+Y]])
-- utils.map({ "n", "v" }, "<leader>d", [["_d]])

utils.map("n", "Q", "<nop>")
-- utils.map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<cr>")
utils.map("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation. helpfull to navigate at ctlp results
-- open quickfix is handy in case we want to reuse ripgrep results1
-- utils.map("n", "<C-k>", ":cnext<cr>zz")
-- utils.map("n", "<C-j>", ":cprev<cr>zz")
-- utils.map("n", "<leader>k", ":lnext<cr>zz")
-- utils.map("n", "<leader>j", ":lprev<cr>zz")

-- search / replace
utils.map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
utils.map("n", "<leader>r", [[yiw:%s/\<<C-r><C-w>\>//g<left><left>]])
utils.map("n", "<leader>t", ":set hlsearch!<cr>")
-- utils.map("n", "<leader>x", ":!chmod +x %<cr>", { silent = true })

--" autoclose tags
utils.map("i", "<>", "<><Left>")
utils.map("i", "()", "()<Left>")
utils.map("i", "{}", "{}<Left>")
utils.map("i", "[]", "[]<Left>")
utils.map("i", '""', '""<Left>')
utils.map("i", "''", "''<Left>")
utils.map("i", "``", "``<Left>")

-- insert mode navigational keys
utils.map("i", "<Up>", "<Nop>")
utils.map("i", "<Down>", "<Nop>")
utils.map("i", "<Left>", "<Nop>")
utils.map("i", "<Right>", "<Nop>")
-- utils.map('i', '<C-h>', '<Left>', { noremap = true })
-- utils.map('i', '<C-j>', '<Down>', { noremap = true })
-- utils.map('i', '<C-k>', '<Up>', { noremap = true })
-- utils.map('i', '<C-l>', '<Right>', { noremap = true })

-- current buffer
utils.map("n", "<leader>w", ":write<cr>")
utils.map("n", "<leader>q", ":quit<cr>")
utils.map("n", "<leader>d", ":bd<cr>")
utils.map("n", "<leader>e", ":edit<SPACE>")
utils.map("n", "<Tab>", ":bnext<cr>")
utils.map("n", "<S-Tab>", ":bprevious<cr>")
utils.map("n", "<leader><leader>", "<C-^>")

-- window navigational
utils.map("n", "<leader>h", ":wincmd h<cr>", { noremap = true })
utils.map("n", "<leader>l", ":wincmd l<cr>", { noremap = true })
utils.map("n", "<leader>j", ":wincmd j<cr>", { noremap = true })
utils.map("n", "<leader>k", ":wincmd k<cr>", { noremap = true })
utils.map("n", "<C-c>", ":wincmd c<cr>", { noremap = true })
utils.map("n", "<C-\\>", ":vsplit<cr>", { noremap = true })
utils.map("n", "<C-x>", ":split<cr>", { noremap = true })

-- plugins related maps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
utils.map("n", "<leader>pe", ":NvimTreeToggle<cr>")
