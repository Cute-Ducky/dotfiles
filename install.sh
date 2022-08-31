#!/bin/sh
printf "run this as root \n"
set -o pipefail
disk="/dev/sda"
extra="" # for nvme0n1 and partitions being nvme0n1p1 set extra to p
boot="$disk"
boot+="$extra"
boot+="1"
root="$disk"
root+="$extra"
root+="2"

echo "create a boot named: $boot"
echo "create a root named: $root"
gdisk "/dev/$disk"

mkfs.vfat -F 32 $boot
fatlabel $boot NIXBOOT

zpool create -f \
-o altroot="/mnt" \
-o ashift=12 \
-o autotrim=on \
-O compression=lz4 \
-O acltype=posixacl \
-O xattr=sa \
-O relatime=on \
-O normalization=formD \
-O dnodesize=auto \
-O sync=disabled \
-O encryption=aes-256-gcm \
-O keylocation=prompt \
-O keyformat=passphrase \
-O mountpoint=none \
NIXROOT \
$root

zfs create -o mountpoint=legacy NIXROOT/root
zfs create -o mountpoint=legacy NIXROOT/home
zfs create -o refreservation=1G -o mountpoint=none NIXROOT/reserved

mount -t zfs NIXROOT/root /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount $boot /mnt/boot
mount -t zfs NIXROOT/home /mnt/home

nixos-generate-config --root /mnt

echo "# Add this to your nix config 
  #ZFS
  networking.hostId = "$(head -c 8 /etc/machine-id)";


  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;
  
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
"
