# near Shardnet challenges course
# 运行前准备：  准备一台云服务器，可以是谷歌或微软云或aws
机器要求： 4核8g 200g固态盘
# 挑战一 
安装基础环境：
执行命令：
sudo apt update && sudo apt upgrade -y
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs
PATH="$PATH"
sudo npm install -g near-cli
export NEAR_ENV=shardnet
echo 'export NEAR_ENV=shardnet' >> ~/.bashrc
near proposals
near validators current
near validators next
# 挑战二
执行命令：
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python docker.io protobuf-compiler libssl-dev pkg-config clang llvm cargo
sudo apt install python3-pip
USER_BASE_BIN=$(python3 -m site --user-base)/bin
export PATH="$USER_BASE_BIN:$PATH"
sudo apt install clang build-essential make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
git clone https://github.com/near/nearcore
cd nearcore
git fetch
查看当前目录文件列表：
![image](https://user-images.githubusercontent.com/39818797/180215776-9ac254c6-d899-40ce-b211-9e01962f6ee3.png)
cargo build -p neard --release --features shardnet
编译完成以后，可以发现当前目录有可执行程序：
![image](https://user-images.githubusercontent.com/39818797/180215992-3a91c2de-6efb-4db5-b3e9-5d6a736fd393.png)
初始化：
./target/release/neard --home ~/.near init --chain-id shardnet --download-genesis
删除旧config.json然后重新下载
rm ~/.near/config.json
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json
删除旧genesis文件然后重新下载
cd ~/.near
wget https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/genesis.json
启动程序：
cd ~/nearcore
./target/release/neard --home ~/.near run
查看日志：
![image](https://user-images.githubusercontent.com/39818797/180216660-8ff014be-d4e1-4ff4-b4f6-8be0e4d087c1.png)
查看进程：
![image](https://user-images.githubusercontent.com/39818797/180216715-20e75efc-e74e-44c1-a0b4-247b806ac110.png)
登录near：
near login


