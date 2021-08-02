#/usr/bin/bash

mkdir -p temp
cd temp

# curl https://mirrors.ustc.edu.cn/golang/go1.16.5.linux-amd64.tar.gz --remote-name
# sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $(ls .)
wget -c https://mirrors.ustc.edu.cn/golang/go1.16.5.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local

cd -
# rm -rf assets
