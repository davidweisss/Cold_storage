## Process to securely erase a drive and securely copy a verified linux image to it

## Erase/clear micro SD card
## http://www.upubuntu.com/2012/01/how-to-clearerase-disk-partitions-from.html
sudo fdisk -l
## Find dev that gets added when you put in the card and flatten all its bytes to 0.
sudo dd if=/dev/zero of=/dev/sda

## Refs
## https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
## http://qdosmsq.dunbar-it.co.uk/blog/2013/06/noobs-for-raspberry-pi/
## https://askubuntu.com/questions/153245/how-to-wipe-ram-on-shutdown-prevent-cold-boot-attacks
## https://en.wikipedia.org/wiki/Cold_boot_attack
