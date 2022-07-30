vim.g.startify_fortune_use_unicode = 1

vim.g.startify_files_number = 5

vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_change_cmd = 'tcd'

vim.g.startify_lists = {
  { type = 'bookmarks', header = {'   Bookmarks'}                  },
  { type = 'commands',  header = {'   Commands'}                   },
  { type = 'files',     header = {'   MRUs'}                       },
  { type = 'dir',       header = {'   MRUs in current directory '} },
}
vim.g.startify_bookmarks = {
      { v = vim.env.MYVIMRC },
      { m = vim.env.APPDATA .. '\\mpv\\mpv.conf' },
}
vim.g.startify_commands = {
  { s = { 'Scratch', 'Scratch' } },
  { u = { 'Update plugins', 'PackerSync' } },
  { h = { 'Quick reference', 'h quickref' } },
}
vim.g.startify_skiplist = {
  '\\\\\\.git\\\\',
  'runtime\\\\doc\\\\.*\\.txt$',
  'plugged\\\\.*\\\\doc\\\\.*\\.txt$',
}
