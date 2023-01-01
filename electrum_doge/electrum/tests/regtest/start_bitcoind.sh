#!/usr/bin/env bash
export HOME=~
set -eux pipefail
mkdir -p ~/.dogecoin
cat > ~/.dogecoin/dogecoin.conf <<EOF
regtest=1
txindex=1
printtoconsole=1
rpcuser=doggman
rpcpassword=donkey
rpcallowip=127.0.0.1
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
fallbackfee=0.0002
[regtest]
rpcbind=0.0.0.0
rpcport=18554
EOF
rm -rf ~/.dogecoin/regtest
screen -S dogecoind -X quit || true
screen -S dogecoind -m -d dogecoind -regtest
sleep 6
dogecoin-cli createwallet test_wallet
addr=$(dogecoin-cli getnewaddress)
dogecoin-cli generatetoaddress 150 $addr > /dev/null
