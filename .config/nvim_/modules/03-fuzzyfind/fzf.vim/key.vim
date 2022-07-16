" ===
" === fzf
" ===

noremap <leader>fb :FBuffers<CR>

" nnoremap <silent> <plug>(fzf-maps-n) :<c-u>call fzf#vim#maps('n', {'options': '--no-preview'}, 0)<cr>
" inoremap <silent> <plug>(fzf-maps-i) <c-o>:call fzf#vim#maps('i', {'options': '--no-preview'}, 0)<cr>
" xnoremap <silent> <plug>(fzf-maps-x) :<c-u>call fzf#vim#maps('x', {'options': '--no-preview'}, 0)<cr>
" onoremap <silent> <plug>(fzf-maps-o) <c-c>:<c-u>call fzf#vim#maps('o', {'options': '--no-preview'}, 0)<cr>
" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <silent> <leader><tab> :<c-u>call fzf#vim#maps('n', {'options': '--no-preview'}, 0)<cr>
" inoremap <silent> <leader><tab> <c-o>:call fzf#vim#maps('i', {'options': '--no-preview'}, 0)<cr>
xnoremap <silent> <leader><tab> :<c-u>call fzf#vim#maps('x', {'options': '--no-preview'}, 0)<cr>
onoremap <silent> <leader><tab> <c-c>:<c-u>call fzf#vim#maps('o', {'options': '--no-preview'}, 0)<cr>


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
" Reference: https://github.com/junegunn/fzf.vim/pull/628#issuecomment-766440334
inoremap <expr> <c-x><c-f> fzf#vim#complete("fd <Bar> xargs realpath --relative-to " . expand("%:h"))
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))


" Reference: About search and replace in project
" https://github.com/junegunn/fzf.vim/issues/528#issuecomment-368260699

