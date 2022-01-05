
-- Config

require('telescope').setup({
    defaults = {
        border = false,
    }
})


-- Bindings

local telescope_builtin = require('telescope.builtin')

---@diagnostic disable-next-line: lowercase-global
function telescope_find_files()
    telescope_builtin.find_files()
end

function telescope_grep_string()
    telescope_builtin.grep_string()
end

function telescope_live_grep()
    telescope_builtin.live_grep()
end


-- Mappings

map('n', '<Leader>f', '<CMD>lua telescope_find_files()<CR>')
map('n', '<Leader>F', '<CMD>lua telescope_grep_string()<CR>')
map('n', '<Leader>lf', '<CMD>lua telescope_live_grep()<CR>')

