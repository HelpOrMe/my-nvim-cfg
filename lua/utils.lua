
function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        for _, v in ipairs(opts) do
            options[v] = true
        end
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function table.merge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                table.merge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

function table.list(tbl)
    local lst = {}
    for _, v in pairs(tbl) do
        table.insert(tbl, v)
    end

    return lst
end

function table.print(tbl, indent)
    indent = indent or 0
    
    if type(tbl) ~= 'table' then
        print(tbl)
    else
        for k, v in pairs(tbl) do
            if type(v) ~= 'table' then
                print(string.rep(' ', indent)..tostring(k)..': '..tostring(v))
            else
                print(string.rep(' ', indent)..tostring(k)..':')
                print_table(v, indent + 1)
            end
        end
    end
end

function reload_selected()
    rel_path = fn.expand('%:p')
    rel_path = string.gsub(rel_path, "^.*/lua/", '')
    rel_path = string.gsub(rel_path, ".lua", '')
    rel_path = string.gsub(rel_path, "/init", '')
    rel_path = string.gsub(rel_path, "/", '.')
    exec(':w', true)
    reload(rel_path)
    print(rel_path..' reloaded.')
end

