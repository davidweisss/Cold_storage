## Launching bitcoin daemon will create wallet.dat
## Launch without internet connection, blocks are not synched [3]
## Dev: screen
## bitcoind -connect=0 -nolisten 
bitcoind -connect=0 -nolisten -daemon 
##

## Create new screen tab C^a-C^c
newAddress=`bitcoin-cli getnewaddress`
bitcoin-cli dumpprivkey $newAddress

## If you want to create a custom address
## for i in `seq 1 1000`; do bitcoin-cli getnewaddress|grep ^My ; done
## Or for longer strings https://twitter.com/l4rz/status/1040582046039658497

## Make a hard copy of the private key (optionally, the public key, which cam be recovered from the private key)

## Create new screen tab C^a-C^c
## Remove new wallet and wallet dump, and all the data from bitcoin on ./bitcoin
## Shred scrambles the data so that file cannot be recovered
shred -zvu ~/.bitcoin

## Delete the whole drive securely.
## If security critical, destroy the sd card (+rpi for extreme security) physically.

####################################
## !/bin/bash
# Code for vanity address generation. No external tool used for seurity therefore limited to 3 maybe 4 characters.
## arr=("A" "DNA")
## for i in "${arr[@]}" ;do 
##	address=`bitcoin-cli -rpcuser=pi -rpcpassword=pwd getnewaddress` 
## hit=`echo "$address" | grep "^3$i"`
## while  [[ ! $hit ]] 
## do
## 	address=`bitcoin-cli -rpcuser=pi -rpcpassword=pwd getnewaddress` 
## 	hit=`echo "$address" | grep "^3$i"`
##
## done
## echo Found for $i $address
## echo writing to $1
## privKey=`bitcoin-cli -rpcuser=pi -rpcpassword=pwd dumpprivkey $address`
## echo Private key is: $privKey
## echo $address $privKey >> $1	
## done

