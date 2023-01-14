local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    'tsserver',
    'gopls',
    'eslint',
    'sumneko_lua',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
    
    --    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    --    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    --    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    --    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    --    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    --    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    --    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    --    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    --    -- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
