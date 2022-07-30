vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = 'c'

vim.cmd [[
nnoremap <buffer> <silent> <leader>lc :up \| cd %:h \| Dispatch! lualatex "%"<CR>
nnoremap <buffer> <silent> <leader>lp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>
]]

vim.cmd [[
command! -buffer Tidyup cd %:h | Dispatch! latex-tidyup "%"
]]
