"            _
"           (_)
"     __   ___ _ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
" by m3tro1d

" Config location {{{
if has('win32')
  let $VIMCONF = $LOCALAPPDATA . '/nvim'
else
  let $VIMCONF = $HOME . '/.config/nvim'
endif
" }}}

" Plugins {{{
" Using https://github.com/junegunn/vim-plug
if !isdirectory($VIMCONF . '/plugged')
  call mkdir($VIMCONF . '/plugged', 'p')
endif

call plug#begin($VIMCONF . '/plugged')
" Appearance
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb', { 'on': 'GBrowse' }
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'airblade/vim-rooter', { 'on': 'Rooter' }
Plug 'preservim/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }

" Miscellaneous utilities
Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch'] }
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'LiveEasyAlign'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/open-browser.vim', { 'on': '<Plug>(openbrowser-smart-search)' }

" Some colorschemes for alternating
" Plug 'arcticicestudio/nord-vim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/sonokai'
" Plug 'Jorengarenar/vim-darkness'
" Plug 'ayu-theme/ayu-vim'
call plug#end()
" }}}

" Basics {{{
let mapleader=' '
set spelllang=en_us,ru_ru
if has('win32')
  language en_US
else
  language en_US.UTF-8
endif
" Less command history
set history=500
" Compatibility settings
set nocompatible
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
" Python path
if has('win32')
  let g:python3_host_prog = $LOCALAPPDATA . '\Programs\Python\Python39\python.exe'
else
  let g:python3_host_prog = '/bin/python3'
endif
" }}}

" Behavior {{{
" General autocommands group
augroup settings
  autocmd!
augroup END
" Don't load netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" Priority of end-of-line formats
if has('win32')
  set fileformats=dos,unix
else
  set fileformats=unix,dos
endif
" Priority of encodings
set fileencodings=utf-8,cp1251,cp866,koi8-r
" Automatically hide buffer when it's unsaved (also allows to use :bufdo)
set hidden
" Ask if there are unsaved files
set confirm
" Longer updatetime (def: 4000 ms) leads to delays and poor UX
set updatetime=100
" Waiting interval for the mapped sequences
set ttimeoutlen=10
" Waiting interval for the mapped commands
set timeoutlen=500
" Disable swap files
set noswapfile
" Disable backup files
set nobackup nowritebackup
" Auto completion for files and commands
set wildmenu wildignorecase
set wildmode=longest,list,full
set wildignore+=*.swp,*.bak
set wildignore+=*.exe,*.o,*.obj
set wildignore+=*/.git/*,*/__pycache__/*,*/node_modules/*
set wildignore+=*/var/*,*/vendor/*,*/public/build/*
" Treat 'kebab' identifiers like a whole word
set iskeyword+=-
" Recursive :find in the current directory
set path+=**
" Less aggressive completion
set completeopt=menuone,noinsert,noselect
" Don't display completion messages
set shortmess+=c
" Don't jump to matching pairs
set noshowmatch
" Split windows at the bottom and right
set splitbelow splitright
" Don't update screen while running macros (makes them faster & uses less resources)
set lazyredraw
" Jump to the buffer window instead of switching if it's already opened in another window
set switchbuf=useopen
if has('nvim')
  " Preview for :s command
  set inccommand=nosplit
endif
" Treat numbers as either decimal or hex when using CTRL-A|X
set nrformats=hex
" Enable directory-specific settings files
set exrc
" Disable dangerous settings (autocommands, shell and write commands) in the modeline and .exrc
set secure
" Allow backspace in insert mode
set backspace=indent,eol,start
" Keeps only one whitespace when joining lines
set nojoinspaces
" Don't beep or flash on errors
set noerrorbells novisualbell t_vb=
" Use slower but better diff algorithm
set diffopt+=internal,algorithm:patience
" Reload file automatically if it was changed
set autoread
autocmd settings FocusGained,BufEnter * checktime
" Auto-resize splits when the program window gets resized
autocmd settings VimResized * wincmd=
" Turn off paste when leaving insert mode
autocmd settings InsertLeave * set nopaste
" Automatically reload vimrc
autocmd settings BufWritePost $MYVIMRC source $MYVIMRC
" }}}

" Appearance {{{
" Theme settings
syntax enable
if has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme everforest
" Line numbering
set number relativenumber
" Show cursor position
set ruler
" Always show statusline
set laststatus=2
" Hide the mouse pointer when typing
set mousehide
" Height of the cmd line (bigger helps avoiding hit-enter prompt)
set cmdheight=2
" Smaller completion menu
set pumheight=10
" Show current commands in the bottom-right corner
set showcmd
" Don't show current mode in the command line
set noshowmode
" Highlight current line
set cursorline
" Set the window's title to the current filename
set title titlestring=%{expand(\'%\')}
" }}}

" Search {{{
" Disable search results highlighting
set nohlsearch
" Show results while typing
set incsearch
" Search at the beginning when hitting end of file
set wrapscan
" Ignore case if query is lowercase (use \C to force match case)
set ignorecase smartcase
" }}}

" Indentation {{{
" Automatic indentation
set autoindent
" Do not indent cases in switch statement and scope declarations in classes (C++)
set cinoptions+=:0g0
" Use existing indentation settings in this file for new lines
set copyindent
" Show tab as 4 spaces
set tabstop=4
" White spaces instead of tabs by default
set expandtab
" Number of spaces shifted with <, >
set shiftwidth=2
" Number of spaces to be deleted and inserted with Backspace (negative to use shiftwidth)
set softtabstop=-1
" Round the indentation to shiftwidth when shifting with <, >
set shiftround
" }}}

" Text display {{{
" Don't break lines automatically
set textwidth=0
" Wrap text and break the lines by words
set wrap linebreak
" Proper indentation for wrapped lines
set breakindent breakindentopt=shift:2
" Show line wrappings
set showbreak=»
" Always try to show paragraph's last line
set display+=lastline
" Make 1 line above, below and sideways the cursor always visible
set scrolloff=1 sidescrolloff=1
" Turn off concealing by default
set conceallevel=0
" }}}

" Mappings {{{
" Disable mouse wheel pasting
nmap <MiddleMouse> <NOP>
imap <MiddleMouse> <NOP>
" Change and delete to blackhole register
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
" Intuitive yank (like D)
nnoremap Y y$
" Intuitive replace
vnoremap p pgvy
" Keep the selection after indenting
vnoremap < <gv
vnoremap > >gv
" Center the screen on certain actions in order not to get lost
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Moving text
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
" Intuitive line movement (if count is not provided, move by displayed lines)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" Faster movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Window resizing
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
" Toggle 2 vertical and horizontal splits
nnoremap <leader>th <C-w>t<C-w>K
nnoremap <leader>tv <C-w>t<C-w>H
" Copy and paste using system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
" Some mappings for the buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>
" Quickfix list navigation
nnoremap <silent> ]q :cnext<CR>zzzv
nnoremap <silent> [q :cprevious<CR>zzzv
nnoremap <silent> ]Q :clast<CR>zzzv
nnoremap <silent> [Q :cfirst<CR>zzzv
" Arguments navigation
nnoremap <silent> ]n :next<CR>
nnoremap <silent> [n :previous<CR>
nnoremap <silent> ]N :last<CR>
nnoremap <silent> [N :first<CR>
" Toggle spell check
nnoremap <silent> <leader>s :setlocal spell!<CR>
" Comfortable editing in command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" Get current directory in the command mode
cnoremap %% <C-r>=expand('%:p:h')<CR>\
" Terminal mappings for Neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif
" }}}

" Russian keymap {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-j> <C-^>
autocmd settings InsertLeave * set iminsert=0
" }}}

" Some custom functions and commands {{{
" Quickfix list toggle {{{
function! QuickfixToggle() abort
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction
" }}}
nnoremap <silent> <leader>q :call QuickfixToggle()<CR>

" Virtual edit (cursor beyond EOL) {{{
function! VirtualEditToggle() abort
  if &ve == ''
    setlocal ve=all
    echo 'Virtual edit: ON.'
  else
    setlocal ve=
    echo 'Virtual edit: OFF.'
  endif
endfunction " }}}
command! VirtualEditToggle call VirtualEditToggle()<CR>

" Clean-up trailing whitespaces & newlines at EOF {{{
function! CleanTrailings() abort
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  " Trailing whitespaces
  silent! %s/\s\+$//e
  " Blank lines at EOF
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction " }}}
command! CleanTrailings call CleanTrailings()

" Quickly change indentaion spaces amount {{{
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
" }}}
command! -nargs=* ChangeTabstops call ChangeTabstops(<f-args>)

" Empty registers {{{
fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun
" }}}
command! EmptyRegisters call EmptyRegisters()

" Commands {{{
" Soft-wrap the text for copying into the text processors
command! -range=% SoftWrap
      \ <line2>put _ |
      \ <line1>,<line2>g/.\+/ .;-/^$/ join | normal $x

" Create or switch to the scratch buffer
command! Scratch
      \ e scratch |
      \ setlocal buftype=nofile bufhidden=hide noswapfile
" }}}
" }}}

" Plugins settings {{{
" vim-plug {{{
let g:plug_window = 'noautocmd tabnew'
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'keymap', 'mode' ],
      \             [ 'filename', 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'keymap': 'LightlineKeymap',
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

function! LightlineKeymap() abort
  return &iminsert == 1 ? 'RU' : ''
endfunction

function! LightlineFilename() abort
  if &filetype ==# 'nerdtree'
    return ''
  endif
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : &modifiable ? '' : ' -'
  return filename . modified
endfunction

call lightline#init()
call lightline#colorscheme()
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [$VIMCONF . '/snips']
" }}}

" LSP {{{
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  require'lsp_signature'.on_attach({
    bind = true,
    doc_lines = 2,
    hint_enable = false,
    hint_prefix = '? ',
    handler_opts = {
        border = 'single'
    }
  })

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<M-CR>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local servers = { "clangd", "gopls", "tsserver", "jedi_language_server" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end
EOF

command! Format execute 'lua vim.lsp.buf.formatting()'

autocmd settings TextYankPost * silent! lua require'vim.highlight'.on_yank({ higroup = 'IncSearch', timeout = 50, on_visual = false })
" }}}

" nvim-compe {{{
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 50;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    spell = true;
    calc = true;
    emoji = true;

    nvim_lsp = true;
    nvim_lua = true;

    ultisnips = true;
  };
}
EOF

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" }}}

" Telescope {{{
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },

    file_ignore_patterns = { '.git', 'node_modules', '__pycache__', '.idea' }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
  }
}
require('telescope').load_extension('fzy_native')
EOF

nnoremap <silent> <C-p> <cmd>Telescope find_files<CR>

nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<CR>
" }}}

" nvim-treesitter {{{
lua << EOF
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'python', 'c', 'cpp', 'lua', 'javascript' },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {}
  },
}
EOF
" }}}

" NERDTree {{{
" Start NERDTree when Vim starts with a directory argument
autocmd settings StdinReadPre * let s:std_in=1
autocmd settings VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close NERDTree when it is the last buffer
autocmd settings BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeWinSize = 30
let NERDTreeWinSizeMax = 50
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = [
      \ '\.git$', 'node_modules$', '\.idea$'
      \ ]
let NERDTreeBookmarksFile = ''

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFocus<CR>
nnoremap <silent> <leader>nF :NERDTreeFind<CR>
" }}}

" matchit.vim {{{
if !exists('g:loaded_matchit')
  runtime! macros/matchit.vim
endif
" }}}

" open-browser {{{
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

" emmet-vim {{{
let g:emmet_html5 = 0
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-z>'
augroup emmet
  autocmd!
  autocmd FileType html,css,pug EmmetInstall
augroup END
" }}}

" Git plugins (fugitive + gitgutter) {{{
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>gh :diffget //2<CR>
nnoremap <silent> <leader>gl :diffget //3<CR>

let g:gitgutter_map_keys = 0
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
" }}}

" startify {{{
let g:startify_fortune_use_unicode = 1

let g:startify_session_dir = $VIMCONF . '/sessions'
let g:startify_files_number = 5

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0
let g:startify_change_cmd = 'tcd'

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                  },
      \ { 'type': 'commands',  'header': ['   Commands']                   },
      \ { 'type': 'files',     'header': ['   MRUs']                       },
      \ { 'type': 'dir',       'header': ['   MRUs in current directory '] },
      \ ]
let g:startify_bookmarks = [
      \ {'v': $MYVIMRC},
      \ {'m': $APPDATA . '\mpv\mpv.conf'},
      \ ]
let g:startify_commands = [
    \ {'h': ['Quick reference', 'h quickref']},
    \ {'u': ['Update plugins', 'PlugClean! | PlugUpdate']},
    \ {'p': ['Go to projects', 'cd D:\Documents\Projects']}
    \ ]
let g:startify_skiplist = [
      \ '\\\.git\\',
      \ 'runtime\\doc\\.*\.txt$',
      \ 'plugged\\.*\\doc\\.*\.txt$',
      \ ]
" }}}

" Rooter {{{
let g:rooter_manual_only = 1
let g:rooter_cd_cmd = 'tcd'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.git', 'node_modules', 'Makefile']
" }}}

" vim-easy-align {{{
nmap gl <Plug>(EasyAlign)
xmap gl <Plug>(EasyAlign)
" }}}
" }}}

" General files settings {{{
augroup formatting
  autocmd!
  " Turn off automatic text wrapping (both text and comments)
  autocmd FileType * setlocal formatoptions-=tc
  " Turn off automatic comment insertion
  autocmd FileType * setlocal formatoptions-=ro
  " Preserve short lines and don't break words when formatting
  autocmd FileType * setlocal formatoptions+=w
  " Recognize numbered lists when formating
  autocmd FileType * setlocal formatoptions+=n
  " Don't break a line after a one-letter word when formatting
  autocmd FileType * setlocal formatoptions+=1
  " Remove comment leader when joining lines with comments
  autocmd FileType * setlocal formatoptions+=j
  " Don't break lines at single spaces that follow periods
  autocmd FileType * setlocal formatoptions+=p
augroup END

" LaTeX type
let g:tex_flavor = 'latex'
" }}}

" Specific filetypes settings {{{
" Specific file mappings start with <leader>f
augroup gitcommit " {{{
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal formatoptions+=t
  autocmd FileType gitcommit setlocal spell
augroup END " }}}

augroup c " {{{
  autocmd!
  autocmd FileType c setlocal commentstring=//\ %s
augroup END " }}}

augroup cpp " {{{
  autocmd!
  autocmd FileType cpp omap ii <Esc>F<ci>
augroup END " }}}

augroup python " {{{
  autocmd!
  autocmd FileType python setlocal colorcolumn=80
augroup END " }}}

augroup javascript " {{{
  autocmd!
  " Node.js file navigation with 'gf'
  autocmd FileType javascript setlocal include=require(
  autocmd FileType javascript setlocal suffixesadd=.js
augroup END " }}}

augroup latex " {{{
  autocmd!
  autocmd FileType tex setlocal conceallevel=0
  " Compile
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fc :up \| cd %:h \| !pdflatex "%"<CR>
  " Preview pdf
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>
  " Tidy up useless files
  autocmd FileType tex nnoremap <buffer> <silent> <leader>ft :cd %:h \| Dispatch! latex-tidyup "%"<CR><CR>
augroup END " }}}

augroup dosbatch " {{{
  autocmd!
  autocmd FileType dosbatch setlocal fileformat=dos
augroup END " }}}

augroup php " {{{
  autocmd!
  autocmd FileType php setlocal shiftwidth=4
augroup END " }}}

augroup pascal " {{{
  autocmd!
  " autocmd FileType pascal setlocal makeprg=gpc\ %\ -o\ %:t:r
  autocmd FileType pascal setlocal errorformat+=%f(%l\\,%c)\ %m,%-G%.%#
  autocmd FileType pascal setlocal commentstring={%s}
  autocmd FileType pascal command! FindExtraSemicolons execute 'vimgrep /\v;\n?\s*(<END>|<UNTIL>)/ **/*.pas'
augroup END " }}}
" }}}

" vim:fdm=marker:
