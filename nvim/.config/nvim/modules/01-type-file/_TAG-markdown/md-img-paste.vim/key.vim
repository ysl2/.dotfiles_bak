" ===
" === md-img-paste
" ===
autocmd FileType markdown nnoremap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR><ESC>
autocmd FileType markdown nnoremap <buffer> <leader>P !pandoc % --pdf-engine=xelatex -o %:r.pdf


