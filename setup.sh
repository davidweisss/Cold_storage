# Save Raspbian/Linux disk image from network connected rpi
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git vim screen autoconf libevent-dev libtool libssl-dev libboost-all-dev libminiupnpc-dev -y
git clone https://github.com/bitcoin/bitcoin.git
sudo sed -i '16s/.*/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

## refs https://steemit.com/bitcoin/@mys/usd100-raspberry-pi2-bitcoin-light-node-with-tft-display-and-3d-printed-case
