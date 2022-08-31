#!/bin/sh
disk="/dev/sda"
extra="" # for nvme0n1 and partitions being nvme0n1p1 set extra to p
boot="$disk"
boot+="$extra"
boot+="1"
root="$disk"
root+="$extra"
root+="2"

echo "$boot"
echo "$root"
gdisk "/dev/$disk"
