let g:shellcheck_disable_mappings = 1
" autocmd! FileType sh :call HighLightOperator()
autocmd FileType sh silent! :ShellCheck<CR>

