local noremaps = require 'utils'.noremaps

-- Don't load netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Close NERDTree when it is the last buffer
vim.cmd [[
autocmd settings BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
]]

vim.g.NERDTreeMapOpenSplit = 's'
vim.g.NERDTreeMapOpenVSplit = 'v'
vim.g.NERDTreeWinSize = 30
vim.g.NERDTreeWinSizeMax = 50
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeNaturalSort = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeIgnore = { '\\.git$' }
vim.g.NERDTreeBookmarksFile = ''

noremaps('n', '<leader>nt', ':NERDTreeToggle<CR>')
noremaps('n', '<leader>nf', ':NERDTreeFocus<CR>')
noremaps('n', '<leader>nF', ':NERDTreeFind<CR>')
