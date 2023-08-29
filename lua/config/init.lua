-- Compatibility settings
vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.cmd('filetype plugin indent on')

require('config.packer')
require('config.set')
require('config.remap')
require('config.gui')

-- Python path
if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog = vim.env.LOCALAPPDATA .. '\\Programs\\Python\\Python311\\python.exe'
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end

-- General autocommands group
local settings = vim.api.nvim_create_augroup('settings', { clear = true })
-- Reload file automatically if it was changed
vim.opt.autoread = true
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter'}, {
  group = settings,
  command = 'checktime',
})
-- Auto-resize splits when the program window gets resized
vim.api.nvim_create_autocmd('VimResized', {
  group = settings,
  command = 'wincmd=',
})
-- Close some windows using q
vim.api.nvim_create_autocmd('FileType', {
  group = settings,
  pattern = { 'help', 'qf', 'fugitive', 'fugitiveblame' },
  callback = function(args)
    vim.api.nvim_buf_set_keymap(args.buf, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
  end
})
-- Highlight region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = settings,
  callback = function()
    require 'vim.highlight'.on_yank { higroup = 'IncSearch', timeout = 50, on_visual = false }
  end
})

vim.opt.keymap = 'russian-jcukenwin'
vim.opt.iminsert = 0
vim.opt.imsearch = 0
vim.api.nvim_create_autocmd('InsertLeave', {
  group = settings,
  callback = function()
    vim.opt.iminsert = 0
  end
})

-- Clean-up trailing whitespaces & newlines at EOF
vim.cmd [[
function! CleanTrailings() abort
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  " Trailing whitespaces
  silent! %s/\s\+$//e
  " Blank lines at EOF
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
command! CleanTrailings call CleanTrailings()
]]

-- Quickly change indentaion spaces amount
vim.cmd [[
function! ChangeTabstops(current, new) abort
  let &l:tabstop = a:current
  let &l:shiftwidth = a:current
  setlocal noexpandtab
  retab!
  let &l:tabstop = a:new
  let &l:shiftwidth = a:new
  setlocal expandtab
  retab
endf
command! -nargs=* ChangeTabstops call ChangeTabstops(<f-args>)
]]

-- Simple sort motion
vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]

-- Soft-wrap the text for copying into the text processors
vim.cmd [[
command! -range=% SoftWrap
      \ <line2>put _ |
      \ <line1>,<line2>g/.\+/ .;-/^$/ join | normal $x
]]

-- Create or switch to the scratch buffer
vim.cmd [[
command! Scratch
      \ e scratch |
      \ setlocal buftype=nofile bufhidden=hide noswapfile |
      \ nnoremap <silent> <buffer> ZZ :%y+<CR>ZQ
command! VScratch vs | Scratch
]]

vim.api.nvim_create_autocmd('FileType', {
  group = settings,
  callback = function()
  -- Turn off automatic text wrapping (both text and comments)
  vim.cmd 'setlocal formatoptions-=tc'
  -- Turn off automatic comment insertion
  vim.cmd 'setlocal formatoptions-=ro'
  -- Preserve short lines and don't break words when formatting
  vim.opt_local.formatoptions:append('w')
  -- Recognize numbered lists when formating
  vim.opt_local.formatoptions:append('n')
  -- Don't break a line after a one-letter word when formatting
  vim.opt_local.formatoptions:append('1')
  -- Remove comment leader when joining lines with comments
  vim.opt_local.formatoptions:append('j')
  -- Don't break lines at single spaces that follow periods
  vim.opt_local.formatoptions:append('p')
  end
})
