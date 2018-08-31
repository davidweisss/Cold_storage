## Launching bitcoin daemon will create wallet.dat
## Launch without internet connection, blocks are not synched [3]
## Dev: screen
## bitcoind -connect=0 -nolisten 
bitcoind -connect=0 -nolisten -daemon
##

## Create new screen tab C^a-C^c
## Dump wallet keys to file
bitcoin-cli dumpwallet ~/.bitcoin/wallets/to-destroy-b4-going-online.txt 

## Examine and note manually the relevant codes
vim  ~/.bitcoin/wallets/to-destroy-b4-going-online.txt

## Create new screen tab C^a-C^c
## Remove new wallet and wallet dump, and all the data from bitcoin on ./bitcoin
## Shred scrambles the data so that file cannot be recovered
shred -zvu ~/.bitcoin

## Do all cleanup necessary
## If security critical, destroy the sd card physically.

## Turn on wifi (for development, not for normal operation).
## sudo ifconfig wlan0 up 
