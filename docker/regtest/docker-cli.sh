#!/usr/bin/env bash

action=$1

if [ $action == 'up' ]; then
    echo "启动网络-->"
    docker-compose -f bitcoin-compose.yml up
elif [ $action == 'down' ]; then
    echo "停止网络-->"
    docker-compose -f bitcoin-compose.yml  down
elif [ $action == 'clean' ]; then
    echo "清理网络-->"
    docker-compose -f bitcoin-compose.yml  down --volumes
elif [ $action == 'in' ]; then
    echo "登录-->"
    docker exec -it btc-regtest bash
elif [ $action == 'log' ]; then
    echo "日志-->"
    docker logs -f --tail 100 btc-regtest
else 
  echo "不支持的action!!!"
fi