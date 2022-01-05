
function open_terminal_vertical()
    cmd('only')
    cmd('vsplit')
    cmd('exe "normal \\<C-W>\\<C-w>"')
    set_win_size_one_third()
    cmd('ter')
end


-- Keybinds

map('n', '<Leader>t', '<CMD>:ter<CR>')
map('n', '<Leader>T', '<CMD>:lua open_terminal_vertical()<CR>')

