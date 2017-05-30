#!/bin/bash

# Motivation:
# 1#: https://askubuntu.com/questions/493826/grub-rescue-problem-after-deleting-ubuntu-partition.
# 2#: During my journey to resize the Ubuntu partition.

# When or Why:
# 1#:  In case you accidentally changed the boot partition

# This script assumes that you recovered from grub using grub rescue commands.
# Following can be useful in this regard:
# $ grub rescue > ls
# (hd0) (hd0,msdos5) (hd0,msdos3) (hd0,msdos2) (hd0,msdos1) (hd1) (hd1,msdos1)
# $ grub rescue > ls (hd0,msdos1) # try to recognize which partition is this
# $ grub rescue > ls (hd0,msdos2) # let's assume this is the linux partition
# $ grub rescue > set root=(hd0,msdos2)
# $ grub rescue > set prefix=(hd0,msdos2)/boot/grub # or wherever grub is installed
# $ grub rescue > insmod normal # if this produced an error, reset root and prefix to something else ..
# $ grub rescue > normal

update-grub
# where /dev/sda is assumed to be your boot device
grub-install /dev/sda
