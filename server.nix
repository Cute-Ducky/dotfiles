{ ... }:
{
      imports = [
./system/docker.nix
./system/server/hostname.nix
./system/nextcloud.nix
./system/hardware-configuration.nix
./system/systemd-boot.nix
./system/nextcloud.nix
./system/ssh.nix
#./system/boot.nix
./system/networking.nix
#./system/xorg.nix
#./system/packages.nix
#./system/zfs.nix
./system/users.nix
./system/server/doas.nix
./system/configuration.nix
#./system/flash-os/steam.nix
./system/jellyfin.nix
./system/firewall.nix
./system/tainscale.nix
./system/key.nix
./system/flakes.nix
./system/server/packages.nix
./system/minecraft.nix

      ];
}
