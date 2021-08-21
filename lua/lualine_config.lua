local colors = {
  color0   = '#e1e3e4',
  color1   = '#333846',
  color2   = '#2a2f38',
  color3   = '#ff6d7e',
  color4   = '#424b5b',
  color5   = '#a5e179',
  color6   = '#7ad5f1',
  color7   = '#eacb64',
  color8   = '#f69c5e',
  color9   = '#ba9cf3',
  color10  = '#828a9a',
}

local sonokai = {
  terminal = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color3 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  insert = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color5 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  normal = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color6 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  command = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color7 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  replace = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color8 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  visual = {
    c = { fg = colors.color0, bg = colors.color1 },
    a = { fg = colors.color2, bg = colors.color9 , gui = 'bold', },
    b = { fg = colors.color0, bg = colors.color4 },
  },
  inactive = {
    c = { fg = colors.color10, bg = colors.color1 },
    a = { fg = colors.color10, bg = colors.color1 , gui = 'bold', },
    b = { fg = colors.color10, bg = colors.color1 },
  },
}

require('lualine').setup({
  options = {
    theme = sonokai,
  },
  extensions = { 'quickfix', 'fugitive', 'nerdtree' },
})
