-- Keybinds

-- Move between buffers
map('n', '<A-h>', '<CMD>:BufferPrevious<CR>', {'silent'})
map('n', '<A-l>', '<CMD>:BufferNext<CR>', {'silent'})

-- Order buffers
map('n', '<CA-h>', '<CMD>:BufferMovePrevious<CR>', {'silent'})
map('n', '<CA-l>', '<CMD>:BufferMoveNext<CR>', {'silent'})

-- Goto buffers
map('n', '<A-1>', '<CMD>:BufferGoto 1<CR>', {'silent'})
map('n', '<A-2>', '<CMD>:BufferGoto 2<CR>', {'silent'})
map('n', '<A-3>', '<CMD>:BufferGoto 3<CR>', {'silent'})
map('n', '<A-4>', '<CMD>:BufferGoto 4<CR>', {'silent'})
map('n', '<A-5>', '<CMD>:BufferGoto 5<CR>', {'silent'})
map('n', '<A-6>', '<CMD>:BufferGoto 6<CR>', {'silent'})
map('n', '<A-7>', '<CMD>:BufferGoto 7<CR>', {'silent'})
map('n', '<A-8>', '<CMD>:BufferGoto 8<CR>', {'silent'})
map('n', '<A-9>', '<CMD>:BufferGoto 9<CR>', {'silent'})

-- Control buffers

map('n', '<A-p>', '<CMD>:BufferPin<CR>', {'silent'})
map('n', '<A-q>', '<CMD>:BufferClose<CR>', {'silent'})


-- Options

g.bufferline = {
    animation = false,
    icon_separator_active = '',
    icon_separator_inactive = '',
    closable = false,
    maximum_padding = 1,
    icons = 'both',
    icon_pinned = 'P'
}

