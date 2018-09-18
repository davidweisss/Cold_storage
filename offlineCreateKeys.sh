## Launching bitcoin daemon will create wallet.dat
## Launch without internet connection, blocks are not synched [3]
## Dev: screen
## bitcoind -connect=0 -nolisten 
bitcoind -connect=0 -nolisten -daemon 
##

## Create new screen tab C^a-C^c
newAddress=`bitcoin-cli getnewaddress`
bitcoin-cli dumpprivkey $newAddress

## Make a hard copy of the private key (optionally, the public key, which cam be recovered from the private key)

## Create new screen tab C^a-C^c
## Remove new wallet and wallet dump, and all the data from bitcoin on ./bitcoin
## Shred scrambles the data so that file cannot be recovered
shred -zvu ~/.bitcoin

## 
## If security critical, destroy the sd card (+rpi for extreme security) physically.
