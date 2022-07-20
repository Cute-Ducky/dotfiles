#!/bin/sh
disk="/dev/sda"
boot="$disk"
boot+="1"
root="$disk"
root+="2"

echo "$boot"
echo "$root"
gdisk "/dev/$disk"
