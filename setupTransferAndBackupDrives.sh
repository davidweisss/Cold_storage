## Insert 
sudo fdisk /dev/sda
## Delete partitions and make an new one with all default options
sudo fdisk /dev/sdb
## Delete partitions and make an new one with all default options

## Make file systems
sudo mkfs -t vfat -I /dev/sda1
sudo mkfs -t vfat -I /dev/sdb1

## Make mount dirs and mount drives
mkdir /mnt/transfer
mkdir /mnt/backup
sudo mount /dev/sda1 /mnt/transfer -o umask=000
sudo mount /dev/sdb1 /mnt/backup -o umask=000
## Follow instructions https://thepihut.com/blogs/raspberry-pi-tutorials/17699796-formatting-and-mounting-a-usb-drive-from-a-terminal-window
