
return function(server)
    server:setup(config('rust_analyzer.lua', {
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
