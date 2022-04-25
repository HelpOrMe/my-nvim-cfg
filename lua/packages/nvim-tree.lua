
-- Config

load('nvim-tree').setup(merge_config("nvim_tree", {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    number = false,
    relativenumber = false,
    update_focused_file = {
        enable = true
    },
    git = {
        enable = false,
    },
    view = {
        auto_reisze = true
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}))


-- Integration

local nerdtree_opened = false

function nvim_tree_toggle()
    nerdtree_opened = not nerdtree_opened
    
    if nerdtree_opened then
        -- Offset 30 for 11 font size
        -- Offset 31 for 12 font size
        require('bufferline.state').set_offset(30, 'FileTree')
        require('nvim-tree').open()
    else
        require('bufferline.state').set_offset(0)
        require('nvim-tree.view').close()
    end
end


-- Keybinds

map('n', '<Leader>d', '<CMD>lua nvim_tree_toggle()<CR>')

