require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt', 'vim' },
  enable_moveright = true,
  enable_afterquote = false,
  enable_check_bracket_line = true,
  check_ts = false,
  map_bs = true,
  map_c_w = true,
})

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true,
  auto_select = false,
})
