" ===
" === fzf.vim
" ===
let g:fzf_command_prefix = 'F'

" YuSoLi: this function below is copied from fzf.vim original code, it can add
" g:fzf_command_prefix in front of the command. I use this function to rewrite my
" self-flavor fzf command.
function! s:defs(commands)
  let prefix = get(g:, 'fzf_command_prefix', '')
  if prefix =~# '^[^A-Z]'
    echoerr 'g:fzf_command_prefix must start with an uppercase letter'
    return
  endif
  for command in a:commands
    let name = ':'.prefix.matchstr(command, '\C[A-Z]\S\+')
    if 2 != exists(name)
      execute substitute(command, '\ze\C[A-Z]', prefix, '')
    endif
  endfor
endfunction

" YuSoLi: rewrite default command with g:fzf_command_prefix
" e.g. I rewrite Rg command to show hidden files.
call s:defs([
      \ "command! -bang -nargs=* Rg call fzf#vim#grep('rg --hidden --ignore-file .git --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)",
      \ "command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number -- '.shellescape(<q-args>), 0, fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)",
      \])
      " \ "command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)",
      " \ "command! -bar -bang Snippets call fzf#vim#snippets({'options': '--no-preview'}, <bang>0)",

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


