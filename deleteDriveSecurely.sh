## Process to securely erase a drive and securely copy a verified linux image to it

## Erase/clear micro SD card
## http://www.upubuntu.com/2012/01/how-to-clearerase-disk-partitions-from.html
sudo fdisk -l

## Find dev that gets added when you put in the card and flatten all its bytes to 0. Writes until an error occurs because there is no space left on the device. Can take long (eg full day) on large cards!
sudo dd if=/dev/zero of=/dev/sda
##dd: écriture vers '/dev/sda': Aucun espace disponible sur le périphérique
##250085377+0 enregistrements lus
##250085376+0 enregistrements écrits
##128043712512 bytes (128 GB, 119 GiB) copied, 36658 s, 3,5 MB/s



## Refs
## https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
## http://qdosmsq.dunbar-it.co.uk/blog/2013/06/noobs-for-raspberry-pi/
## https://askubuntu.com/questions/153245/how-to-wipe-ram-on-shutdown-prevent-cold-boot-attacks
## https://en.wikipedia.org/wiki/Cold_boot_attack
## https://askubuntu.com/questions/703576/fdisk-l-shows-16-ram-disks-dev-ram0-ram15
## --> "The RAM disk driver is a way to use main system memory as a block device. It is required for initrd, an initial filesystem used if you need to load modules in order to access the root filesystem (see Documentation/initrd.txt). It can also be used for a temporary filesystem for crypto work, since the contents are erased on reboot."
