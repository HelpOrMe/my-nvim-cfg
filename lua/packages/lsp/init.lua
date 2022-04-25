lsp = load 'lspconfig'

local lsp_setup = {ignore = {}}
local lsp_installer = load 'nvim-lsp-installer'
local load_prefix = 'packages.lsp.'


-- Attach

on_attach = load(load_prefix..'on_attach')


-- Capabilities

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = load('cmp_nvim_lsp').update_capabilities(capabilities)


-- UI

load(load_prefix..'ui')


-- Servers

lsp_setup.sumneko_lua = load(load_prefix..'sumneko_lua')
lsp_setup.rust_analyzer = load(load_prefix..'rust_analyzer')
lsp_setup.omnisharp = load(load_prefix..'omnisharp')


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
