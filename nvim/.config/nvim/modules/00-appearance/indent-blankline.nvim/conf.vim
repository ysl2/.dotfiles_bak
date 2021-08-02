" =============================
" === indent-blankline.nvim ===
" =============================
let g:indent_blankline_char = "│"
" let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_filetype_exclude = [
            \"startify",
            \"dashboard",
            \"dotooagenda",
            \"log",
            \"fugitive",
            \"gitcommit",
            \"packer",
            \"vimwiki",
            \"markdown",
            \"json",
            \"txt",
            \"vista",
            \"help",
            \"todoist",
            \"NvimTree",
            \"peekaboo",
            \"git",
            \"TelescopePrompt",
            \"undotree",
            \"flutterToolsOutline"
            \]
let g:indent_blankline_buftype_exclude = ["terminal", "nofile"]
" let g:indent_blankline_show_trailing_blankline_indent = v:false
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_context_patterns = [
"             \"class",
"             \"function",
"             \"method",
"             \"block",
"             \"list_literal",
"             \"selector",
"             \"^if",
"             \"^table",
"             \"if_statement",
"             \"while",
"             \"for"
"             \]
autocmd CursorMoved * :IndentBlanklineRefresh

