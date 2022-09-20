require 'plugins'

-- Basics {{{
vim.g.mapleader = ' '
vim.opt.spelllang = 'en_us,ru_ru'
-- Less command history
vim.opt.history = 500
-- Compatibility settings
vim.opt.compatible = false
vim.opt.encoding = 'utf-8'
vim.cmd [[
filetype plugin indent on
]]
-- Python path
if vim.fn.has('win32') == 1 then
  vim.g.python3_host_prog = vim.env.LOCALAPPDATA .. '\\Programs\\Python\\Python310\\python.exe'
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end
--- }}}

-- Behavior {{{
-- General autocommands group
local settings = vim.api.nvim_create_augroup('settings', { clear = true })
-- Priority of EOF formats
vim.opt.fileformats = 'unix,dos'
-- Priority of encodings
vim.opt.fileencodings = 'utf-8,cp1251,cp866,koi8-r'
-- Automatically hide buffer when it's unsaved (also allows to use :bufdo)
vim.opt.hidden = true
-- Ask if there are unsaved files
vim.opt.confirm = true
-- Longer updatetime (def: 4000 ms) leads to delays and poor UX
vim.opt.updatetime = 100
-- Waiting interval for the mapped sequences
vim.opt.ttimeoutlen = 10
-- Waiting interval for the mapped commands
vim.opt.timeoutlen = 500
-- Disable swap files
vim.opt.swapfile = false
-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false
-- Auto completion for files and commands
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildignore:append('*.swp,*.bak')
vim.opt.wildignore:append('*.exe,*.o,*.obj')
vim.opt.wildignore:append('*/.git/*,*/__pycache__/*,*/node_modules/*')
vim.opt.wildignore:append('*/var/*,*/vendor/*,*/public/build/*')
-- Treat 'kebab' identifiers like a whole word
vim.opt.iskeyword:append('-')
-- Recursive :find in the current directory
vim.opt.path = '.,**'
-- Less aggressive completion
vim.opt.completeopt = 'menuone,noselect'
-- Don't display completion messages
vim.opt.shortmess:append('c')
-- Don't jump to matching bracket pairs
vim.opt.showmatch = false
-- Split windows at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Don't update screen while running macros (makes them faster & uses less resources)
vim.opt.lazyredraw = true
-- Jump to the buffer window instead of switching if it's already opened in another window
vim.opt.switchbuf = 'useopen'
-- Preview for :s command
vim.opt.inccommand = 'nosplit'
-- Treat numbers as either decimal or hex when using CTRL-A|X
vim.opt.nrformats = 'hex'
-- Disable directory-specific settings files
vim.opt.exrc = false
-- Disable dangerous settings (autocommands, shell and write commands) in the modeline and .exrc
vim.opt.secure = true
-- Allow backspace in insert mode
vim.opt.backspace = 'indent,eol,start'
-- Keeps only one whitespace when joining lines
vim.opt.joinspaces = false
-- Don't beep or flash on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
-- Use slower but better diff algorithm
vim.opt.diffopt:append('internal,algorithm:patience')
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
-- }}}

-- Appearance {{{
-- Theme settings
vim.cmd 'syntax enable'
if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end
vim.opt.background = 'dark'
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 0
vim.cmd 'colorscheme sonokai'
-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
-- Show cursor position
vim.opt.ruler = true
-- Always show statusline
vim.opt.laststatus = 2
-- Hide the mouse pointer when typing
vim.opt.mousehide = true
-- Height of the cmd line (bigger helps avoiding hit-enter prompt)
vim.opt.cmdheight = 2
-- Smaller completion menu
vim.opt.pumheight = 10
-- Show current commands in the bottom-right corner
vim.opt.showcmd = true
-- Don't show current mode in the command line
vim.opt.showmode = false
-- Highlight current line
vim.opt.cursorline = true
-- Set the window's title to the current filename
vim.opt.title = true
vim.opt.titlestring = '%{expand(\'%:t\')}'
vim.api.nvim_create_autocmd('UIEnter', {
  group = settings,
  once = true,
  callback = function() require 'ginit' end
})
-- }}}

-- Search {{{
-- Disable search results highlighting
vim.opt.hlsearch = false
-- Show results while typing
vim.opt.incsearch = true
-- Search at the beginning when hitting end of file
vim.opt.wrapscan = true
-- Ignore case if query is lowercase (use \C to force match case)
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}}

-- Indentation {{{
-- Automatic indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Do not indent cases in switch and indent scope declarations in C++ classes (use :Ng0 for custom indent)
vim.opt.cinoptions = ':0g0'
-- Use existing indentation settings in this file for new lines
vim.opt.copyindent = true
-- Show tab as 4 spaces
vim.opt.tabstop = 4
-- White spaces instead of tabs by default
vim.opt.expandtab = true
-- Number of spaces shifted with <, >
vim.opt.shiftwidth = 2
-- Number of spaces to be deleted and inserted with Backspace (negative to use shiftwidth)
vim.opt.softtabstop = -1
-- Round the indentation to shiftwidth when shifting with <, >
vim.opt.shiftround = true
-- }}}

-- Text display {{{
-- Don't break lines automatically
vim.opt.textwidth = 0
-- Wrap text and break the lines by words
vim.opt.wrap = true
vim.opt.linebreak = true
-- Proper indentation for wrapped lines
vim.opt.breakindent = true
vim.opt.breakindentopt = 'shift:2'
-- Show line wrappings
vim.opt.showbreak = '»'
-- Always try to show paragraph's last line
vim.opt.display:append('lastline')
-- Make 1 line above, below and sideways the cursor always visible
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 1
-- Turn off concealing by default
vim.opt.conceallevel = 0
-- }}}

-- Mappings {{{
local noremaps = require 'utils'.noremaps
-- Disable mouse wheel pasting
vim.api.nvim_set_keymap('n', '<MiddleMouse>', '<nop>', { silent = true })
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<nop>', { silent = true })
-- Disable Ex mode
noremaps('n', 'Q', '<nop>')
-- Change and delete to blackhole register
noremaps('n', 'c', '\"_c')
noremaps('v', 'c', '\"_c')
noremaps('n', 'C', '\"_C')
noremaps('n', 'x', '\"_x')
noremaps('v', 'x', '\"_x')
noremaps('n', 'X', '\"_X')
-- Intuitive yank (like D)
noremaps('n', 'Y', 'y$')
-- Intuitive replace
noremaps('v', 'p', 'pgvy')
-- Keep the selection after indenting
noremaps('v', '<', '<gv')
noremaps('v', '>', '>gv')
-- Center the screen on certain actions in order not to get lost
noremaps('n', 'n', 'nzzzv')
noremaps('n', 'N', 'Nzzzv')
vim.api.nvim_set_keymap('n', 'J', 'v:count ? \'J\' : \'mzJ`z\'', { noremap = true, silent = true, expr = true })
-- Moving text
noremaps('v', 'J', ':m \'>+1<CR>gv=gv')
noremaps('v', 'K', ':m \'<-2<CR>gv=gv')
-- Intuitive line movement (if count is not provided, move by displayed lines)
vim.api.nvim_set_keymap('n', 'j', 'v:count ? \'j\' : \'gj\'', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count ? \'k\' : \'gk\'', { noremap = true, silent = true, expr = true })
-- Faster movement between windows
noremaps('n', '<C-h>', '<C-w>h')
noremaps('n', '<C-j>', '<C-w>j')
noremaps('n', '<C-k>', '<C-w>k')
noremaps('n', '<C-l>', '<C-w>l')
-- Window resizing
noremaps('n', '<Right>', ':vertical resize +2<CR>')
noremaps('n', '<Left>', ':vertical resize -2<CR>')
noremaps('n', '<Up>', ':resize +2<CR>')
noremaps('n', '<Down>', ':resize -2<CR>')
-- Toggle 2 vertical and horizontal splits
noremaps('n', '<leader>th', '<C-w>t<C-w>K')
noremaps('n', '<leader>tv', '<C-w>t<C-w>H')
-- Copy and paste using system clipboard
noremaps('n', '<leader>y', '\"+y')
noremaps('v', '<leader>y', '\"+y')
noremaps('n', '<leader>p', '\"+p')
noremaps('v', '<leader>p', '\"+p')
-- Quickfix list navigation
noremaps('n', ']q', ':cnext<CR>zzzv')
noremaps('n', '[q', ':cprevious<CR>zzzv')
noremaps('n', ']Q', ':clast<CR>zzzv')
noremaps('n', '[Q', ':cfirst<CR>zzzv')
-- Buffers navigation
noremaps('n', ']b', ':bnext<CR>')
noremaps('n', '[b', ':bprevious<CR>')
noremaps('n', ']B', ':blast<CR>')
noremaps('n', '[B', ':bfirst<CR>')
-- Arguments navigation
noremaps('n', ']n', ':next<CR>')
noremaps('n', '[n', ':previous<CR>')
noremaps('n', ']N', ':last<CR>')
noremaps('n', '[N', ':first<CR>')
-- Toggle spell check
noremaps('n', '<leader>s', ':setlocal spell!<CR>')
-- Comfortable editing in command mode
vim.api.nvim_set_keymap('c', '<C-A>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-E>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-P>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-N>', '<Down>', { noremap = true })
-- Get current directory in the command mode
vim.api.nvim_set_keymap('c', '%%', '<C-r>=expand(\'%:p:h\')<CR>\\', { noremap = true })
-- More convenient terminal
noremaps('t', '<Esc>', '<C-\\><C-n>')
noremaps('t', '<C-h>', '<C-\\><C-n><C-w>h')
noremaps('t', '<C-j>', '<C-\\><C-n><C-w>j')
noremaps('t', '<C-k>', '<C-\\><C-n><C-w>k')
noremaps('t', '<C-l>', '<C-\\><C-n><C-w>l')
-- }}}

-- Russian keymap {{{
vim.opt.keymap = 'russian-jcukenwin'
vim.opt.iminsert = 0
vim.opt.imsearch = 0
noremaps('i', '<C-j>', '<C-^>')
vim.api.nvim_create_autocmd('InsertLeave', {
  group = settings,
  callback = function()
    vim.opt.iminsert = 0
  end
})
-- }}}

-- Some custom functions and commands {{{
-- Clean-up trailing whitespaces & newlines at EOF {{{
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
-- }}}

-- Quickly change indentaion spaces amount {{{
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
-- }}}

-- Simple sort motion {{{
vim.cmd [[
function! Sort(type, ...)
  '[,']sort
endfunction
nnoremap <silent> gs :set opfunc=Sort<CR>g@
]]
-- }}}

-- Commands {{{
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
-- }}}
-- }}}

-- General files settings {{{
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

-- LaTeX type
vim.g.tex_flavor = 'latex'
-- }}}

-- vim:fdm=marker:
