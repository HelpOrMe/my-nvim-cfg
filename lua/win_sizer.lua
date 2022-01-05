
function set_win_size_one_third()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width;
    cmd('vertical resize '..tostring(width / 3))
end


-- Keybinds

map('n', '<C-W>st', '<CMD>:lua set_win_size_one_third()<CR>')
