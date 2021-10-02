setlocal include=require(
setlocal suffixesadd=.js
setlocal colorcolumn=80

nnoremap <silent> <buffer> <C-q> :up \| vs \| term node %<CR>
