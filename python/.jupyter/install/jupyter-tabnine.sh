#!/bin/bash

# NOTE:
# 此插件有bug。在第一次进入ipynb文件后，必须刷新一下页面然后再编辑。否则会导致通过vim插件运行cell之后，光标消失。
# 如何判断是否出现了此bug：按F1查看vim快捷键中是否存在没有映射的按键。比如"== no help=="字样。
source ./pre-check/conda.sh
source ./pre-check/jupyter.sh

echo '' >~/temp

TABNINE_PACKAGE=~/.conda/envs/${MYCONDA_VENV}/lib/python3.8/site-packages/jupyter_tabnine

pip3 install jupyter-tabnine &>>~/temp
jupyter nbextension install --user --py jupyter_tabnine &>>~/temp
jupyter nbextension enable --user --py jupyter_tabnine &>>~/temp
jupyter serverextension enable --user --py jupyter_tabnine &>>~/temp
mv "${TABNINE_PACKAGE}"/handler.py "${TABNINE_PACKAGE}"/handler.py_ &>>~/temp
mv "${TABNINE_PACKAGE}"/tabnine.py "${TABNINE_PACKAGE}"/tabnine.py_ &>>~/temp
cp $(pwd)/assets/jupyter-tabnine/* "${TABNINE_PACKAGE}" &>>~/temp

# mkdir -p $(jupyter --data-dir)/nbextensions &>>~/temp
# cd $(jupyter --data-dir)/nbextensions &>>~/temp
# git clone https://hub.fastgit.org/wenmin-wu/jupyter-tabnine.git &>>~/temp
# cd jupyter-tabnine
# python3 setup.py install &>>~/temp
# python -c "import os.path as p; from jupyter_tabnine import __file__ as f, _jupyter_nbextension_paths as n; print(p.normpath(p.join(p.dirname(f), n()[0]['src'])))" &>>~/temp
# jupyter nbextension install --user ~/.conda/envs/${MYCONDA_VENV}/lib/python3.8/site-packages/jupyter_tabnine-1.2.2-py3.8.egg &>>~/temp
# jupyter nbextension enable --user jupyter_tabnine/jupyter_tabnine &>>~/temp


# NOTE: Uninstall
# jupyter serverextension disable --py jupyter_tabnine &>~/temp
# jupyter nbextension disable --py jupyter_tabnine &>>~/temp
# jupyter nbextension uninstall --py jupyter_tabnine &>>~/temp
# pip3 uninstall jupyter-tabnine -y &>>~/temp
