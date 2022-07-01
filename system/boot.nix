{ config, pkgs, ... }:
 
{


boot = {
   #kernelPackages = pkgs.linuxPackages_latest_hardened;
   loader = {
        efi = {
           #canTouchEfiVariables = true;
           efiSysMountPoint = "/boot";
        };
        grub = {
           enable = true;
           devices = [ "nodev" ];
           efiInstallAsRemovable = true;
           efiSupport = true;
           useOSProber = true;
           extraConfig = ''
           serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
           terminal_input --append serial
           terminal_output --append serial
           '';
           #theme = pkgs.nixos-grub2-theme;
        };
   };
   supportedFilesystems = [ "zfs" ]; #  add bcachefs here
   zfs.requestEncryptionCredentials = true;
   #plymouth = {
        #enable = true;
   #};
};
}
