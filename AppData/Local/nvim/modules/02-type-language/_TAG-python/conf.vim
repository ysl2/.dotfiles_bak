" ================
" === anaconda ===
" ================

" " NOTE: Anaconda
" if $CONDA_PREFIX == ""
"     let s:current_python_path=$CONDA_PYTHON_EXE
" else
"     let s:current_python_path=$CONDA_PREFIX.'/bin/python'
" endif
" call coc#config('python', {'pythonPath': s:current_python_path})
if $CONDA_PREFIX != ""
  let s:current_python_path = $CONDA_PREFIX. '/bin/python'
  call coc#config('python', {'pythonPath': s:current_python_path})
endif

