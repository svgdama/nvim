local function fzf_fallback()
    local _, err = pcall(os.execute, 'git rev-parse')
    if err == 0 then
        print("it is under a git project")
    else
        print('it is not a git project')
    end
end
_G.fzf_run = fzf_fallback
--local result = vim.api.nvim_exec([[system('git rev-parse')]], true)
--print(result)
-- fzf_fallback()
