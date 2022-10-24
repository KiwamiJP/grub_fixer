#!/bin/bash
echo                       "!!Run this script with root account!!"
echo
echo '       ######  ######  #     #  ######     ###### ####### #         #  ######  ###### '
echo '      #     #  #     # #     #  #     #    #         #     #       #   #       #     # '
echo '      #        #     # #     #  #     #    #         #       #   #     #       #     # '
echo '      #  ####  ######  #     #  ######     ######    #        # #      ######  ###### '
echo '      #     #  #   #   #     #  #     #    #         #       #   #     #       #   # '
echo '      #     #  #    #  #     #  #     #    #         #     #      #    #       #    # '
echo '      ######   #     # ######   ######     #      ####### #        #   ######  #     # '

blkid
echo
echo "Enter your linux  partition: "
read partition
echo 

echo "Your linux installed partition is $partition"
sudo mount /dev/sda* /mnt
sudo mount --bind /dev /mnt/dev && mount --bind /dev/pts /mnt/dev/pts && mount --bind /proc /mnt/proc && mount --bind /sys /mnt/sys
sudo chroot /mnt
grub-install /dev/sda
grub-install –recheck /dev/sda
grub-install /dev/sda
update-grub
exit &&
sudo umount /mnt/sys &&
sudo umount /mnt/proc &&
sudo umount /mnt/dev/pts &&
sudo umount /mnt/dev &&
sudo umount /mnt
