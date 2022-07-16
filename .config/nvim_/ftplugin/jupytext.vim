" Run current file
" nnoremap <buffer> <silent> <leader>R :JupyterRunFile<CR>
nnoremap <buffer> <silent> <leader>I :PythonImportThisFile<CR>

" Change to directory of curfile
nnoremap <buffer> <silent> <leader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <leader>E :JupyterSendCell<CR>
" nnoremap <buffer> <silent> <leader>C :JupyterSendRange<CR>
" nmap     <buffer> <silent> <leader>e <Plug>JupyterRunTextObj
" Save current cursor position to register q, then re-select last area, and run command.
" After that, go back to position stored in register q
nmap     <buffer> <silent> <leader>e V<ESC>mqgv<Plug>JupyterRunVisual<ESC>`q
vmap     <buffer> <silent> <leader>e <ESC>mqgv<Plug>JupyterRunVisual<ESC>`q

nnoremap <buffer> <silent> <leader>U :JupyterUpdateShell<CR>

" Debugging maps
nnoremap <buffer> <silent> <leader>b :PythonSetBreak<CR>

