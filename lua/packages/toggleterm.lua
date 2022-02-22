load('toggleterm').setup {
    open_mapping = '<Leader>t',
    direction = 'vertical',
    start_in_insert = false,
    size = function(term) 
        return vim.o.columns * 0.3
    end,
    shell = '/bin/fish'
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end


vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
