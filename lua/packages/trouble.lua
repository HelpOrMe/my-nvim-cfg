load('trouble').setup({
    position = 'right',
    use_diagnostic_signs = true
})

map('n', '<Leader>Tr', '<CMD>Trouble<CR>')
map('n', '<Leader>Tw', '<CMD>Trouble lsp_workspace_diagnostics<CR>')
map('n', '<Leader>Td', '<CMD>Trouble lsp_document_diagnostics<CR>')
map('n', '<Leader>Tq', '<CMD>Trouble quickfix<CR>')
map('n', '<Leader>Tl', '<CMD>Trouble loclist<CR>')
