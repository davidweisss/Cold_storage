# On Raspbian/Linux disk image freshly burnt from network connected rpi
## Interactive script to record the secure process
## Operator executes line by line

## Change password (interactive)
passwd

## Update software
sudo apt-get update
sudo apt-get upgrade

## Increase swap partition size
sudo sed -i '16s/.*/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

## Uninstall bluetooth
sudo apt-get purge bluez -y
sudo apt-get autoremove -y

## Install deps and utils
sudo apt-get install git vim screen autoconf libevent-dev libtool libssl-dev libboost-all-dev libminiupnpc-dev -y

## Clone bitcoin from github repo
git clone https://github.com/bitcoin/bitcoin.git

## Turn off wifi
sudo ifconfig wlan0 down

## Compile and install bitcoin
cd bitcoin
./autogen.sh
## for old wallet compat: not needed
./configure --with-incompatible-bdb
time make
sudo make install

## !! make sure you don't need this wallet anymore
## Remove existing wallet
rm ~/.bitcoin/wallets/wallet.dat

## Launching bitcoin daemon will create wallet.dat
## Launch without internet connection, blocks are not synched [3]
bitcoind -connect=0 -nolisten -daemon

## Dump wallet keys to file
bitcoin-cli dumpwallet to-destroy-b4-going-online.txt

## Examine and note manually the relevant codes
vim  ~/.bitcoin/wallets/to-destroy-b4-going-online.txt

## Remove new wallet and wallet dump
rm ~/.bitcoin/wallets/wallet.dat
rm to-destroy-b4-going-online.txt

## Turn on wifi (if needed)
sudo ifconfig wlan0 up 

## [ 1 ] refs https://steemit.com/bitcoin/@mys/usd100-raspberry-pi2-bitcoin-light-node-with-tft-display-and-3d-printed-case
## [ 2 ] https://scribles.net/disabling-bluetooth-on-raspberry-pi/
## [ 3 ] https://bitcoin.stackexchange.com/questions/50612/how-can-i-run-bitcoin-cli-with-disabled-syncing
