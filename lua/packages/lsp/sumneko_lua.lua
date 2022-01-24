
return function(server)
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    server:setup(config('sumneko_lsp.lua', {
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
