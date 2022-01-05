
function io.get_files(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls '..directory..''):lines() do
        i = i + 1
        t[i] = filename
    end
    return t
end

function io.get_parent_dir(path)
    return string.gmatch(path, '(.+)\\/')[1]
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

function print_table(tbl, indent)
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

function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        cmd('augroup '..group_name)
        cmd('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            cmd(command)
        end
        cmd('augroup END')
    end
end
