{ config, pkgs, ... }:

{
imports =
[ # Include the results of the hardware scan.
./configuration.nix
];
boot.isContainer = true;
}

