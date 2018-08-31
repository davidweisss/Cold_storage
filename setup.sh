# On Raspbian/Linux disk image freshly burnt from network connected rpi
## Interactive shell script to record the secure process
## Operator executes line by line

## Change password (if interactive)
## passwd

## Update software
sudo apt-get update -y
sudo apt-get upgrade -y

## Uninstall bluetooth
sudo apt-get purge bluez -y
sudo apt-get autoremove -y

## Install bitcoin deps
sudo apt-get install autoconf libevent-dev libtool libssl-dev libboost-all-dev libminiupnpc-dev -y
## dev tools
## sudo apt-get install git vim screen 

## Needs this library but chokes on version, corrected with flag on running bitcoind
sudo apt-get libdb5.3++-dev

## Clone bitcoin from github repo
git clone https://github.com/bitcoin/bitcoin.git

## Turn off wifi
sudo ifconfig wlan0 down

## At this point you may go offline to any protected place needed (Faraday cage)

## Compile and install bitcoin
cd bitcoin
./autogen.sh
## for old wallet compat: not needed
./configure --with-incompatible-bdb
time make
sudo make install

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

## [ 1 ] refs https://steemit.com/bitcoin/@mys/usd100-raspberry-pi2-bitcoin-light-node-with-tft-display-and-3d-printed-case
## [ 2 ] https://scribles.net/disabling-bluetooth-on-raspberry-pi/
## [ 3 ] https://bitcoin.stackexchange.com/questions/50612/how-can-i-run-bitcoin-cli-with-disabled-syncing
## [ 4 ] https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
## [ 5 ] https://github.com/bitcoin/bitcoin/issues/3686
