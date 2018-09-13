sudo fdisk /dev/sda
## Follow instructions https://thepihut.com/blogs/raspberry-pi-tutorials/17699796-formatting-and-mounting-a-usb-drive-from-a-terminal-window
sudo mkfs -t vfat -I /dev/sda1
mkdir /mnt/transfer
sudo mount /dev/sda1 transfer -o umask=000
