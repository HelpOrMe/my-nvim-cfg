
local function hi(group, fg, bg, gui, guisp)
    local hi = 'hi '..group

    if fg then hi = hi..' guifg='..fg end
    if bg then hi = hi..' guibg='..bg end
    if gui then hi = hi..' gui='..gui end
    if guisp then hi = hi..' guisp='..guisp end

    cmd(hi)
end


-- Load scheme
return function(p)

    -- General

    hi('Normal', p.light0, p.shade1)
    hi('NonText', p.shade1, p.shade1)
    hi('SpecialKey', p.shade1, p.shade1)

    -- Cursorline

    hi('CursorLine', p.none, p.shade2)
    hi('CursorLineNr', p.light1)
    hi('CursorColumn', p.light2, p.shade2)

    hi('TabLineFill', p.light1, p.shade1)
    hi('TabLineSel', p.light1, p.shade1)
    hi('TabLine', p.light1, p.shade1)

    hi('ColorColumn', p.light1, p.shade1)
    hi('Conceal', p.active1, p.shade1)

    hi('SpecialKey', p.active1, p.shade1)

    -- Match paired bracket under the cursor
    hi('MatchParen', p.shade0, p.shade4)

    hi('VertSplit', p.shade1, p.shade0)
    hi('WildMenu', p.light0, p.shade2)
    hi('Title', p.light0, p.shade1)

    -- Input line

    hi('ErrorMsg', p.active1, p.shade1)
    hi('Question', p.passive0, p.shade1)
    hi('Warning', p.active2, p.shade1)

    hi('WarningMsg', p.active2, p.shade1)
    hi('MoreMsg', p.passive0, p.shade1)

    -- Gutter

    hi('LineNr', p.shade3, p.shade1)
    hi('SignColumn', p.active1, p.shade1) -- ?

    hi('Folded', p.light1, p.shade2)
    hi('FoldColumn', p.active1, p.shade1)

    -- Cursor

    hi('Cursor', p.light3, p.shade1)
    hi('lCursor', p.light3, p.shade1)
    hi('vCursor', p.light3, p.shade1)
    hi('iCursor', p.light3, p.shade1)

    -- Search

    hi('Search', p.shade1, p.passive0)
    hi('IncSearch', p.shade1, p.passive0)

    -- Statusline

    hi('StatusLine', p.active1, p.active1)
    hi('StatusLineNC', p.active1, p.active1)

    -- Popup

    hi('Pmenu', p.light0, p.shade2)
    hi('PmenuSel', p.light0, p.shade3)
    hi('PmenuSbar', p.light0, p.shade2)
    hi('PmenuThumb', p.light0, p.shade2)

    -- Syntax

    hi('Special', p.light2)
    hi('Comment', p.shade4)
    hi('Todo', p.active0)
    hi('Error', p.active1)
    hi('Whitespace', p.shade1)

    hi('Statement', p.passive1)
    hi('Conditional', p.passive1)
    hi('Repeat', p.passive1)
    hi('Exception', p.passive1)
    hi('Operator', p.light3)
    hi('Keyword', p.passive1)
    hi('Function', p.passive1)
    hi('Identifier', p.light0)
    hi('Typedef', p.passive1)

    hi('PreProc', p.passive0)
    hi('Include', p.passive0)
    hi('Define', p.passive0)
    hi('Macro', p.passive0)
    hi('PreCondit', p.passive0)

    hi('Constant', p.passive3)
    hi('Character', p.passive3)
    hi('String', p.passive3)
    hi('Boolean', p.passive3)
    hi('Number', p.light2)
    hi('Float', p.light2)
    hi('Type', p.passive4)
    hi('StorageClass', p.passive4)
    hi('Structure', p.passive4)

    -- IndentLine

    hi('IndentBlanklineChar', p.shade3)
    hi('IndentBlanklineSpaceChar', p.shade3)
    hi('IndentBlanklineSpaceCharBlankline', p.shade3)
    hi('IndentBlanklineContextChar', p.shade4, p.ignore, p.bold)

    -- Lightline

    hi('StatusLine', p.shade1, p.shade1)
    hi('StatusLineNC', p.shade1, p.shade1)

    g['lightline'] = {
        enable = { tabline = 0 },
        separator = {left = '', right = ''},
        subseparator = {left = '', right = ''},
        active = {
            left = {{'mode', 'paste'}, {'filename'}, {'gitbranch'}},
            right = {{'filetype'}, {'lineinfo'}}
        }
    }

    filled = fn['lightline#colorscheme#fill']({
        normal = {
          left = {{p.light1, p.shade3, "bold"}, {p.light3, p.shade2}},
          middle = {{p.light3, p.shade2}},
          right = {{p.light1, p.shade3}, {p.light3, p.shade2}},
          error = {{p.active1, p.shade1}},
          warning = {{p.active2, p.active2}},
        },
        insert = {
          left = {{p.shade0, p.active3, "bold"}, {p.light1, p.shade3}},
          middle = {{p.light3, p.shade2}},
          right = {{p.shade0, p.active3}, {p.light1, p.shade3}},
        },
        inactive = {
          left = {{p.shade4, p.shade1}},
          middle = {{p.shade3, p.shade1}},
          right = {{p.shade4, p.shade1}, {p.shade4, p.shade1}},
        },
        terminal = {
          left = {{p.shade0, p.active0, "bold"}, {p.light1, p.shade2}},
          middle = {{p.light3, p.shade1}},
          right = {{p.shade0, p.active0}, {p.light1, p.shade2}},
        },
        replace = {
          left = {{p.shade0, p.active1, "bold"}, {p.light1, p.shade3}},
          middle = {{p.light3, p.shade2}},
          right = {{p.shade0, p.active1}, {p.light1, p.shade3}},
        },
        visual = {
          left = {{p.shade0, p.active2, "bold"}, {p.light1, p.shade3}},
          middle = {{p.light1, p.shade2}},
          right = {{p.shade0, p.active2}, {p.light1, p.shade3}},
        },
        tabline = {tabse1={p.active1, p.shade1}}
    })

    g['lightline#colorscheme#default#palette'] = filled
    vim.schedule(function()
        fn['lightline#disable']()
        fn['lightline#enable']()
    end)

    -- Barbar

    hi('BufferCurrent', p.light0, p.shade1)
    hi('BufferCurrentIndex', p.light0, p.shade1)
    hi('BufferCurrentMod', p.light0, p.shade1)
    hi('BufferCurrentSign', p.light0, p.shade1)
    hi('BufferCurrentTarget', p.light0, p.shade1)
    hi('BufferVisible', p.light1, p.shade1)
    hi('BufferVisibleIndex', p.light1, p.shade1)
    hi('BufferVisibleMod', p.light1, p.shade1)
    hi('BufferVisibleSign', p.light1, p.shade1)
    hi('BufferVisible', p.light1, p.shade1)
    hi('BufferInactive', p.shade4, p.shade1)
    hi('BufferInactiveIndex', p.shade4, p.shade1)
    hi('BufferInactiveMod', p.shade4, p.shade1)
    hi('BufferInactiveSign', p.shade4, p.shade1)
    hi('BufferInactive', p.shade4, p.shade1)
    hi('BufferTabpages', p.shade4, p.shade1)
    hi('BufferTabpageFill', p.shade4, p.shade1)

    -- Nvim tree

    hi('NvimTreeNormal', p.light1)

    hi('NvimTreeSymLink', p.shade4)
    hi('NvimTreeRootFolder', p.light1)
    hi('NvimTreeFolderIcon', p.light1)
    hi('NvimTreeFolderName', p.light1)
    hi('NvimTreeEmptyFolderName', p.light1)
    hi('NvimTreeOpenedFolderName', p.light1)
    hi('NvimTreeExecFile', p.shade4)
    hi('NvimTreeOpenedFile', p.shade4)
    hi('NvimTreeSpecialFile', p.shade4)
    hi('NvimTreeIndentMarker', p.shade3)

    hi('NvimTreeFileDirty', p.active1)
    hi('NvimTreeFileStaged', p.active1)
    hi('NvimTreeFileMerge', p.active1)
    hi('NvimTreeFileRenamed', p.active1)
    hi('NvimTreeFileNew', p.active1)
    hi('NvimTreeFileDeleted', p.active1)

    -- LSP

    hi('LspDiagnosticsUnderlineError', p.active1, p.shade3)
    hi('LspDiagnosticsUnderlineHint', p.active4, p.shade3)
    hi('LspDiagnosticsUnderlineInfo', p.active3, p.shade3)
    hi('LspDiagnosticsUnderlineWarning', p.active2, p.shade3)

    hi('LspDiagnosticsDefaultError', p.active1, p.shade1)
    hi('LspDiagnosticsDefaultHint', p.active4, p.shade1)
    hi('LspDiagnosticsDefaultInfo', p.active3, p.shade1)
    hi('LspDiagnosticsDefaultWarning', p.active2, p.shade1)

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

    for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Telescope

    hi('TelescopeNormal', p.light0, p.shade2)
    hi('TelescopeSelection', p.light0, p.shade3)
end
