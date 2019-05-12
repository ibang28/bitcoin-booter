#!/usr/bin/env bash

btc_cli_sh='docker exec btc-regtest bitcoin-cli -conf=/bitcoin/.bitcoin/bitcoin.conf '

echo "挖矿，生成区块————>" 
${btc_cli_sh} generate 200

echo "查看BTC————>"
${btc_cli_sh} getbalance

echo "生成新的账户和地址————>" 
new_addr=`${btc_cli_sh} getnewaddress kk`

echo "转账一定的余额给新地址————>" 
${btc_cli_sh} sendtoaddress ${new_addr} 100

echo "生成新的区块，使得交易得到确认————>" 
${btc_cli_sh} generate 1

echo "查看余额————>" 
${btc_cli_sh} listreceivedbyaddress