####
## Run on full node with txid=true provided as argument to bitcoind
####

## Example with randomly chosen txid: 230f6b7942db0d102c4d023824aa4d16c5d1968c427a6a455562a526fabadc04
bitcoin-cli getrawtransaction 230f6b7942db0d102c4d023824aa4d16c5d1968c427a6a455562a526fabadc04 true
## TO-DO Parse output for root.hex in json returned


bitcoin-cli decoderawtransaction 0100000000010177ab74965438589f67872d06ad73c61b0785dcc5b062f8c19b213356795931ec3f00000017160014a428108f06e91ee05e1fbde693d450683e6a7c3dffffffff0295ac3d000000000016001469f5838423fb134721d2ff8c9105fa0cd0918fba72afea000000000017a914dd7c4f58808fc03db252f91c2a99c742cb1160178702483045022100b49135837035ad180504ebdf6d1d09eb6811a62a71d73397d4d6a0ad9920e79202203752a3223f53b022d96cb1c3bdda2abe316699b5ddb251e24cb170dd1eae250401210249e41cecc7992d3f6a3aa7025992899256153cf8e24128da1d96d8b5ac52535900000000

