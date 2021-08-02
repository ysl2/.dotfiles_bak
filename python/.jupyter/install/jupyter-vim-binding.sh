#!/bin/bash
# 在 jupyter 中使用 vim 快捷键
# 注意：需要jupyter环境

source ./pre-check/conda.sh
source ./pre-check/jupyter.sh

mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://hub.fastgit.org/ysl2/jupyter-vim-binding.git vim_binding
jupyter nbextension enable vim_binding/vim_binding

