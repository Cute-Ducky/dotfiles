{ ... }:
{
   imports = [
      ./system/docker.nix
      ./system/nextcloud.nix
      ./system/server/hardware-configuration.nix
      ./system/nextcloud.nix
      ./system/ssh.nix
      ./system/systemd-boot.nix
      ./system/networking.nix
      ./system/users.nix
      ./system/server/doas.nix
      ./system/configuration.nix
      ./system/jellyfin.nix
      ./system/server/jellyfin.nix
      ./system/firewall.nix
      ./system/tainscale.nix 
      ./system/flakes.nix
      ./system/server/packages.nix
      ./system/minecraft.nix
      ./system/libvirt.nix
   ];
   networking.hostName = "server-vm";
}
