load('trouble').setup({
    position = 'right',
    use_lsp_diagnostic_signs = true
})

map('n', '<Leader>trr', '<CMD>Trouble<CR>')
map('n', '<Leader>trw', '<CMD>Trouble lsp_workspace_diagnostics<CR>')
map('n', '<Leader>trd', '<CMD>Trouble lsp_document_diagnostics<CR>')
map('n', '<Leader>trq', '<CMD>Trouble quickfix<CR>')
map('n', '<Leader>trl', '<CMD>Trouble loclist<CR>')
