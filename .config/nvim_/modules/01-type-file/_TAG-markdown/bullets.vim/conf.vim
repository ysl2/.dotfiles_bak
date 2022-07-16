" ===
" === bullets
" ===
" Bullets.vim
let g:bullets_enable_in_empty_buffers = 0 " default = 1
let g:bullets_set_mappings = 0 " default = 1
let g:bullets_pad_right = 0
let g:bullets_renumber_on_change = 0
let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch'
      \]
" 注意：下面这条必须在coc.vim之前加载。否则会报错。
inoremap <expr> <cr> :call s:add_local_mapping('inoremap', '<cr>', 'pumvisible() ? "<cr>" : "<C-]><C-R>=<SID>insert_new_bullet()<cr>"')

