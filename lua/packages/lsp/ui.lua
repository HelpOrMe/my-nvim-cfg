local telescope = load 'telescope.builtin'

local function cursor_dropdown(fn)
    return function(...)
        local tbl = {...}
        fn(require('telescope.themes').get_cursor(), tbl[2], tbl[3])
    end
end

local function ivy(fn)
    return function(...)
        local tbl = {...}
        fn(require('telescope.themes').get_ivy(), tbl[2], tbl[3])
    end
end

vim.lsp.handlers['textDocument/codeAction'] = cursor_dropdown(telescope.lsp_code_actions)
vim.lsp.handlers['textDocument/references'] = telescope.lsp_references
vim.lsp.handlers['textDocument/definition'] = cursor_dropdown(telescope.lsp_definitions)
vim.lsp.handlers['textDocument/typeDefinition'] = cursor_dropdown(telescope.lsp_type_definitions)
vim.lsp.handlers['textDocument/implementation'] = cursor_dropdown(telescope.lsp_implementations)
vim.lsp.handlers['textDocument/documentSymbol'] = telescope.lsp_document_symbols
vim.lsp.handlers['workspace/symbol'] = telescope.lsp_workspace_symbols
