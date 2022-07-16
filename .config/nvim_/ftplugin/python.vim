function! AsyncRunRunRun()
  if &filetype == 'python'
    " execute 'CocCommand python.execInTerminal'
    let $PYTHONNUNBUFFERED=1
    " -mode={async,bang,term}
    execute 'AsyncRun! -mode=async -pos=bottom -rows=10 -raw python %'
    " execute 'AsyncRun! -cwd=<root> -raw python %'
    " execute 'AsyncRun! -pos=bottom -rows=10 -raw python %'
  endif
endfunction

nnoremap <silent> <leader>R :w<CR>:call AsyncRunRunRun()<CR>

