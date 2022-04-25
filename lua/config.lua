
config = {}


function reload_config()
    local path = load('lspconfig').util.root_pattern("nvim.lua")(fn.expand('%:p'))
    if path then
        config = loadfile(path..'/nvim.lua')()
    end
end


function merge_config(root, tbl)
    return table.merge(tbl, config[root] or {})
end


reload_config()
