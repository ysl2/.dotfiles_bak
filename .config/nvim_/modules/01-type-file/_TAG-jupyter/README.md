# Jupyter

> 在使用之前，需要先安装相应的依赖。详见插件主页。

## 使用步骤

1. 先打开一个Jupyter图形终端

    ```bash
    jupyter qtconsole &
    ```

2. 用nvim打开一个一个`.ipynb`文件

3. 在nvim中执行`:JupyterConnect`，让nvim与jupyter图形终端通信

4. 按照特殊语法格式编辑此`.ipynb`文件

    ```python
    # 用"+"号表示cell的开始
    # +
    print('This is a cell. ')
    # -
    # 用"-"号表示cell的结束
    ```

