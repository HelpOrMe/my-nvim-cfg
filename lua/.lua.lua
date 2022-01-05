return {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'fn',
                    'o',
                    'use',
                }
            },
            workspace = {
                checkThirdParty = false,
                maxPreload = 10000,
                preloadFileSize = 1000,
            }
        }
    }
}
