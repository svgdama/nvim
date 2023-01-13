-- Ref: https://emilienl.medium.com/a-quick-guide-to-configure-neovim-in-lua-7c58a28e624c
local M = {}
local cmd = vim.cmd

-- We will create a few autogroup, this function will help to avoid
-- always writing cmd('augroup' .. group) etc..
function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

-- Add a apth to the rtp
function M.add_rtp(path)
    local rtp = vim.o.rtp
    rtp = rtp .. ',' .. path
end

-- Map a key with optional options
function M.map(mode, keys, action, options)
    if options == nil then
        options = {}
    end
    vim.keymap.set(mode, keys, action, options)
end

return M -- Export the module
