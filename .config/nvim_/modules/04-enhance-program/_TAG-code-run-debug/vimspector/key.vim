" ===
" === vim-spector
" ===
" 设置更新调试器的快捷键
noremap <leader>DI :VimspectorInstall<CR>
noremap <leader>DI :VimspectorUpdate<CR>

" 启动调试
nmap <A-t> <Plug>VimspectorContinue
" 终止调试
nmap <A-T> <Plug>VimspectorStop
" 当调试出问题时，重置调试器
nmap <A-U> <Plug>VimspectorRestart
" 切换断点
nmap <A-d> <Plug>VimspectorToggleBreakpoint
" step over
nmap <A-o> <Plug>VimspectorStepOver
" step into
nmap <A-i> <Plug>VimspectorStepInto
" step out
nmap <A-O> <Plug>VimspectorStepOut
" 执行到光标所在位置
nmap <A-I> <Plug>VimspectorRunToCursor
" move up stack
nmap <A-s> <Plug>VimspectorUpFrame
" move dowm call stack
nmap <A-S> <Plug>VimspectorDownFrame
" 计算光标下变量的值（normal模式和visual模式）
nmap <A-u> <Plug>VimspectorBalloonEval
xmap <A-u> <Plug>VimspectorBalloonEval

