#!/bin/bash

# 把github.com做一下处理，换成国内地址
# result=$(curl -fsSL https://raw.fastgit.org/cknadler/vim-anywhere/master/install | sed 's/github\.com/gitclone\.com\/github\.com/')
result=$(curl -fsSL https://raw.fastgit.org/ysl2/vim-anywhere/master/install | sed 's/github\.com/hub\.fastgit\.org/g')
# 执行变量中的命令，用eval
eval "${result}"
