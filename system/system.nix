{ config, pkgs, ... }:
 
{
imports =
[ # Include the results of the hardware scan.
./hardware-configuration.nix
./boot.nix
#./configuration.nix
./networking.nix
./xorg.nix
./packages.nix
./zfs.nix
./doas.nix
./configuration.nix
];
}
