{ config, pkgs, ... }:
 
{
imports =
[ # Include the results of the hardware scan.
./hardware-configuration.nix
./boot.nix
./networking.nix
./xorg.nix
./packages.nix
./zfs.nix
./doas.nix
./configuration.nix
flash-os/steam.nix
];
}
