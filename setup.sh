# On Raspbian/Linux disk image freshly burnt from network connected rpi

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
./configure --with-incompatible-bdb
time make
sudo make install

## Remove existing wallet
rn ~/.bitcoin/wallets/wallet.dat

## Launching bitcoin daemon will create wallet.dat
bitcoind 

## Switch to a new terminal
bitcoin-cli dumpwallet to-destroy-b4-going-online.txt

## Examine and note manually the relevant codes
vim  ~/.bitcoin/wallets/to-destroy-b4-going-online.txt

## Remove new wallet
rn ~/.bitcoin/wallets/wallet.dat
rm to-destroy-b4-going-online.txt

## Turn on wifi (if needed)
sudo ifconfig wlan0 up 

## refs https://steemit.com/bitcoin/@mys/usd100-raspberry-pi2-bitcoin-light-node-with-tft-display-and-3d-printed-case
