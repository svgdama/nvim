local format_sync_grp = vim.api.nvim_create_augroup("TSFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.tsx",
    callback = function()
        local params = {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = ""
        }
        -- perform a syncronous request
        -- 500ms timeout depending on the size of file a bigger timeout may be needed
        vim.lsp.buf_request_sync(0, "workspace/executeCommand", params, 500)
    end,
    group = format_sync_grp,
})
