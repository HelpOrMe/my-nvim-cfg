load 'utils'

-- Options

o.undofile = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.number = true
o.relativenumber = true
o.cursorline = true
wo.colorcolumn = "99999" -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
o.hlsearch = true
o.incsearch = true

g.mapleader = ","
o.timeout = false
o.timeoutlen = 0
o.hidden = true

o.termguicolors = true


-- Load

load 'packages'
load 'win_sizer'
load 'terminal'
load 'diagnostic'
load 'theme.night'


-- Autocmd

nvim_create_augroups({
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
    },
    session = {
        { "VimLeave", "*", "mksession" };
        -- { "VimEnter", "*", "source ~/Session.vim" };
    }
})


-- Keybinds

map('n', '<Leader>c', '<CMD>noh<CR>')
map('n', '<Leader>x', '<CMD>lua reload_selected()<CR>')

