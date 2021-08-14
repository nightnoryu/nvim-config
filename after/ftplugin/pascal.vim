" setlocal makeprg=gpc\ %\ -o\ %:t:r
setlocal errorformat+=%f(%l\\,%c)\ %m,%-G%.%#
setlocal commentstring={\ %s\ }

command! -buffer FindExtraSemicolons execute 'vimgrep /\v;\n?\s*(<END>|<UNTIL>)/ **/*.pas'
