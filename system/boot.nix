{ ... }:
 
{


boot = {
   #kernelPackages = pkgs.linuxPackages_latest_hardened;
   loader = {
        efi = {
           #canTouchEfiVariables = true;
           #efiSysMountPoint = "/mnt/boot";
        };
        grub = {
           enable = false;
           devices = [ "nodev" ];
           efiInstallAsRemovable = true;
           efiSupport = true;
           useOSProber = true;
           #theme = pkgs.nixos-grub2-theme;
	   trustedBoot.isHPLaptop = true;
	   copyKernels = true;
        };
	systemd-boot = {
 	   enable = true;
           configurationLimit = 10;
           memtest86 = {
            enable = true;
           };
	};
   };
   initrd = {
   	enable = true;
        systemd.enable = true;
   };
   #plymouth = {
        #enable = true;
   #};
};
}
