function hslm2hex(h, s, l)
    return rgb2hex(rgbm(hsl2rgb(hsln(h, s, l))))
end

function hslm(h, s, l)
    return h * 360, s * 100, l * 100
end

function hsln(h, s, l)
    return h / 360, s / 100, l / 100
end

function rgb2hex(r, g, b)
    r, g, b = math.floor(r), math.floor(g), math.floor(b)
    local rgb = (r * 0x10000) + (g * 0x100) + b
    return "#"..string.format("%06x", rgb)
end

function hex2rgb(hex)
    hex = hex:gsub("#","")
    return rgbn(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
end

function rgbn(r, g, b)
    return r / 255, g / 255, b / 255
end

function rgbm(r, g, b)
    return r * 255, g * 255, b * 255
end

function rgb2hsl(r, g, b)
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, l

  l = (max + min) / 2

  if max == min then
    h, s = 0, 0 -- achromatic
  else
    local d = max - min
    local s
    if l > 0.5 then s = d / (2 - max - min) else s = d / (max + min) end
    if max == r then
      h = (g - b) / d
      if g < b then h = h + 6 end
    elseif max == g then h = (b - r) / d + 2
    elseif max == b then h = (r - g) / d + 4
    end
    h = h / 6
  end

  return h, s, l
end

function hsl2rgb(h, s, l)
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    function hue2rgb(p, q, t)
      if t < 0   then t = t + 1 end
      if t > 1   then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
    end

    local q
    if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1/3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1/3)
  end

  return r, g, b
end
