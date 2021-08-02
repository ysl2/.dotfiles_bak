" ===
" === vim-quickrun
" ===
" TOTE: There are many modules use the keymap below
" Check the config.vim file
" nnoremap <silent> <leader>r :w<CR>:QuickRun<CR>

" 使用quickrun插件，因此下面这个可以不用了
" 但是quickrun没法接收输入。因此这个还是留着备用吧
" nnoremap <leader>R :call CompileRunGcc()<CR>
nnoremap <silent> <leader>r :w<CR>:call AsyncRunRun()<CR>

