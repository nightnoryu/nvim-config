local function keymap()
  if vim.o.iminsert == 1 then
    return 'RU'
  else
    return ''
  end
end

local function fileinfo()
  return string.format('%s[%s]', vim.bo.fileencoding, vim.bo.fileformat)
end

require 'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'everforest',
    component_separators = { left = '|', right = '|' },
    section_separators = {},
  },
  sections = {
    lualine_a = {'mode', keymap},
    lualine_b = {'FugitiveHead'},
    lualine_c = {'filename'},
    lualine_x = {'filetype', fileinfo},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  extensions = { 'quickfix', 'fugitive', 'nerdtree' },
}
