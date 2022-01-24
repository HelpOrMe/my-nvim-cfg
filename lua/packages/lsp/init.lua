local lsp_setup = {ignore = {}}

local lsp = load 'lspconfig'
local lsp_installer = load 'nvim-lsp-installer'


-- Attach

local on_attach = load 'on_attach'


-- Capabilities

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = load('cmp_nvim_lsp').update_capabilities(capabilities)


-- Tools

local function config(filename, default)
    local path = lsp.util.root_pattern(filename)(fn.expand('%:p'))
    if path then
        return table.merge(default, loadfile(path..'/'..filename)())
    else
        return default
    end
end


-- UI

load 'ui'

-- Servers

lsp_setup.sumneko_lua = load 'sumneko_lua'
lsp_setup.rust_analyzer = load 'rust_analyzer'

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
