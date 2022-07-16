" 用于格式化
let g:autoformat_verbosemode=0

" 自定义格式化工具举例
" expand('%:p')用于输出当前文件的绝对路径


" ===
" === java formatter
" ===
let g:formatdef_google_format_java = "'google-java-format '.expand('%:p')"
" let g:formatters_java = ['google_format_java']


" ===
" === sql formatter
" ===
let g:formatdef_sqlformat = '"sqlformat --indent_width ".shiftwidth()." --keywords upper --identifiers lower -"'
let g:formatters_sql = ['sqlformat']


" ===
" === json formatter
" ===
let g:formatters_sql = ['fixjson']


" ===
" === markdown formatter
" ===
let g:formatters_markdown = ['prettier', 'stylelint']


" ===
" === pandoc formatter
" ===
let g:formatters_pandoc = ['prettier', 'stylelint']


" ===
" === latex formatter
" ===
let g:formatdef_latexindent = '"latexindent -"'
