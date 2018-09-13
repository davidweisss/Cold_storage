## Insert 
sudo fdisk /dev/sda
sudo fdisk /dev/sdb
## Follow instructions https://thepihut.com/blogs/raspberry-pi-tutorials/17699796-formatting-and-mounting-a-usb-drive-from-a-terminal-window
sudo mkfs -t vfat -I /dev/sda1
sudo mkfs -t vfat -I /dev/sdb1
mkdir /mnt/transfer
mkdir /mnt/backup
sudo mount /dev/sda1 /mnt/transfer -o umask=000
sudo mount /dev/sdb1 /mnt/backup -o umask=000
