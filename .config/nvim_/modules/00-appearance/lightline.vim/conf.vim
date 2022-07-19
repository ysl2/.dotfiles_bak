" ===
" === lightline.vim
" ===
let g:lightline = get(g:, 'lightline', {})
let g:lightline.active = get(g:, 'lightline.active', {})

let g:lightline.active.left =  [
            \   [ 'mode', 'paste' ],
            \   [ 'gitstatus', 'readonly', 'filename', 'modified' ]
            \ ]
            " \   [ 'gitstatus', 'readonly' ]

" NOTE: Default is the theme name. check `autoload/theme.vim`, the variable `g:colors_name` is defined in this file.
let g:lightline.colorscheme = colors_name

" let g:lightline.mode_map = {
" \   'n' : 'Normal',
" \   'i' : 'Insert',
" \   'R' : 'Replace',
" \   'v' : 'Visual',
" \   'V' : 'V-Line',
" \   "\<C-v>": 'V-Block',
" \   'c' : 'Command',
" \   's' : 'Select',
" \   'S' : 'S-Line',
" \   "\<C-s>": 'S-Block',
" \   't': 'Terminal',
" \ }
let g:lightline.mode_map = {
            \   'n' : ' Mute',
            \   'i' : ' Talk',
            \   'R' : '﯒ Swap',
            \   'v' : ' Pick',
            \   'V' : ' Pick',
            \   "\<C-v>": ' Pick',
            \   'c' : ' Call',
            \   's' : 'Select',
            \   'S' : 'S-Line',
            \   "\<C-s>": 'S-Block',
            \   't': ' Term',
            \ }

let g:lightline.component = get(g:, 'lightline.component', {})

" %3l is right aligned padding for 3 digits for current row. -2v is left
" aligned padding for current column
let g:lightline.component.lineinfo = " %3l 並%-2v"
" let g:lightline.component.lineinfo = " %3l הּ %-2v"

let g:lightline.component_function = get(g:, 'lightline.component_function', {})

let LightlineReadonly = {-> &readonly ? "" : ''}
let g:lightline.component_function.readonly = 'LightlineReadonly'

let LightlineFiletype = {->
            \   winwidth(0) <= 70   ? '' :
            \   !strlen(&filetype)  ? '' :
            \
            \   &filetype . (exists('*WebDevIconsGetFileTypeSymbol')
            \       ? ' ' . WebDevIconsGetFileTypeSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.filetype = 'LightlineFiletype'

let LightlineFileformat = {->
            \   winwidth(0) <= 70   ? '' :
            \
            \   &fileformat . (exists('*WebDevIconsGetFileFormatSymbol')
            \       ? ' ' . WebDevIconsGetFileFormatSymbol() : ''
            \   )
            \ }
let g:lightline.component_function.fileformat = 'LightlineFileformat'

" function! MyFilename()
"     return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
"         \ '' != expand('%:p') ? expand('%:p') : '[No Name]')
" endfunction
" let g:lightline.component_function.filename = 'MyFilename'

