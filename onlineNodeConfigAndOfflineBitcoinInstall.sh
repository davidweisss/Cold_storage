# On Raspbian/Linux disk image freshly burnt from network connected rpi
## Interactive shell script to record the secure process
## Operator executes line by line


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
sudo apt-get install libdb5.3++-dev -y

## tool for processing bitcoin-cli json outputs and arbitrary precision calculator
sudo apt-get install jq bc -y


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



## [ 1 ] refs https://steemit.com/bitcoin/@mys/usd100-raspberry-pi2-bitcoin-light-node-with-tft-display-and-3d-printed-case
## [ 2 ] https://scribles.net/disabling-bluetooth-on-raspberry-pi/
## [ 3 ] https://bitcoin.stackexchange.com/questions/50612/how-can-i-run-bitcoin-cli-with-disabled-syncing
## [ 4 ] https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
## [ 5 ] https://github.com/bitcoin/bitcoin/issues/3686
