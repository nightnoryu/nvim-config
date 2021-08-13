require 'nvim-treesitter.install'.compilers = { 'clang', 'gcc' }
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'c', 'cpp', 'lua', 'javascript', 'go', 'latex' },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {}
  }
}
