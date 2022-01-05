local lsp_setup = {ignore = {}}

local lsp = load 'lspconfig'
local lsp_installer = load 'nvim-lsp-installer'


-- Capabilities

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = load('cmp_nvim_lsp').update_capabilities(capabilities)


-- Attach

local function on_attach(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', 'g<', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', 'g>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

local function config(filename, default)
    local path = lsp.util.root_pattern(filename)(fn.expand('%:p'))
    if path then
        return table.merge(default, loadfile(path..'/'..filename)())
    else
        return default
    end
end


-- UI (Telescope)

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



-- LSP Servers

-- Lua

function lsp_setup.sumneko_lua(server)
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    server:setup(config('.lua.lua', {
        capabilities = capabilities,
        root_dir = function(...)
            local tbl = {...}
            return lsp.util.root_pattern(".git")(...)
                or lsp.util.root_pattern("init.lua")(...)
                or tbl[1]
        end,
        on_attach = on_attach,
        single_file_support = true,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true)
                },
                telemetry = {
                    enable = false
                }
            }
        }
    }))
end

function lsp_setup.eslint(server)
    server:setup(config('.js.lua', {
        capabilities = capabilities,
        on_attach = on_attach
    }))
end


-- Rust

function lsp_setup.rust_analyzer(server)
    server:setup(config('.rs.lua', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ["rust_analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    }))
end


-- Setup

lsp_installer.on_server_ready(function(server)
    if lsp_setup[server.name] ~= nil then
        lsp_setup[server.name](server)
    elseif not lsp_setup.ignore[server.name] then
        server:setup({
            capabilities = capabilities,
            on_attach = on_attach
        })
    end
end)
