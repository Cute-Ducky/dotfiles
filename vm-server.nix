{ ... }:
{
   imports = [
      ./system/docker.nix
      ./system/server/hostname.nix
      ./system/nextcloud.nix
      ./system/server/hardware-configuration.nix
      ./system/ssh.nix
      ./system/boot.nix
      ./system/networking.nix
      ./system/users.nix
      ./system/server/doas.nix
      ./system/configuration.nix
      ./system/firewall.nix
      ./system/tainscale.nix
      ./system/key.nix
      ./system/flakes.nix
      ./system/server/packages.nix
      ./system/libvirt.nix
   ];

   networking.hostName = "vm-server";
}
