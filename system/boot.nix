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
           #theme = pkgs.nixos-grub2-theme;
	   trustedBoot.isHPLaptop = true;
	   copyKernels = true;
        };
	systemd-boot = {
 	   enable = false;
	};
   };
   initrd = {
   	enable = true;
   };
   supportedFilesystems = [ "zfs" ]; #  add bcachefs here
   zfs.requestEncryptionCredentials = true;
   #plymouth = {
        #enable = true;
   #};
};
}
