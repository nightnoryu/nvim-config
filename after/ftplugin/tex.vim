setlocal conceallevel=2
setlocal concealcursor=c

nnoremap <buffer> <silent> <leader>lc :up \| cd %:h \| Dispatch! lualatex "%"<CR>
nnoremap <buffer> <silent> <leader>lp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>

command! -buffer Tidyup cd %:h | Dispatch! latex-tidyup "%"
