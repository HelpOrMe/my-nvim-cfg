
return function(server)
    server:setup(merge_config('rust_analyzer', {
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
