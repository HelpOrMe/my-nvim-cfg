load 'theme.utils'


-- Origin color (h, s, l)
h, s, l = 268, 30, 0


load 'theme' {
    none = nil,
    ignore = '',
    bold = 'bold',
    italic = 'italic',
    inverse = 'inverse',

    shade0 = hslm2hex(h, s, l),
    shade1 = hslm2hex(h, s, l + 2),
    shade2 = hslm2hex(h, s, l + 9),
    shade3 = hslm2hex(h, s, l + 12),
    shade4 = hslm2hex(h, s, l + 24),

    light0 = hslm2hex(h, s, l + 100),
    light1 = hslm2hex(h, s, l + 90),
    light2 = hslm2hex(h, s, l + 80),
    light3 = hslm2hex(h, s, l + 70),
    light4 = hslm2hex(h, s, l + 60),

    passive0 = '#DEB4FA',
    passive1 = '#D998E3',
    passive2 = '#FDA9E6', -- if, then
    passive3 = '#DEB4FA', -- string, bool
    passive4 = '#98A2BD',

    active0 = '#C2D4A5',  -- green
    active1 = '#F7A3A6',  -- red
    active2 = '#F5D7A6',  -- yellow
    active3 = '#B0E8E2',  -- blue
    active4 = '#C3B5FF'   -- purple
}
