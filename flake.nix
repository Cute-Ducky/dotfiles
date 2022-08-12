{
  description = "My nix system config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";

      # We want home-manager to use the same set of nixpkgs as our system.
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

  outputs = { self, nixpkgs, home-manager }:
  let
     system = "x86_64-linux";

     pkgs = import nixpkgs {
        inherit system;
  config = { allowUnfree = true; };
     };

     lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
  nixconf = lib.nixosSystem {
     inherit system;
     modules = [
#./system/nextmount.nix
#./system/system.nix
#./lib/modules.nix
#./system/sound.nix
#./system/arion.nix
./system/hostname.nix
./system/wayland.nix
./system/docker.nix
./system/flakes.nix
./system/libvirt.nix
./system/clamav.nix
./system/ssh.nix
./system/hardware-configuration.nix
./system/boot.nix
./system/networking.nix
./system/xorg.nix
./system/packages.nix
./system/zfs.nix
./system/doas.nix
./system/configuration.nix
./system/flash-os/steam.nix
#./system/jellyfin.nix
./system/firewall.nix
./system/tainscale.nix
./system/key.nix
./system/users.nix

     ];
  };
  # like nixconf but boots into drawterm
  plan9 = lib.nixosSystem {
     inherit system;
     modules = [
#./system/system.nix
#./lib/modules.nix
#./system/sound.nix
./system/hostname.nix
./system/wayland.nix
./system/flakes.nix
./system/libvirt.nix
./system/clamav.nix
./system/ssh.nix
./system/hardware-configuration.nix
./system/boot.nix
./system/networking.nix
./system/xorg.nix
./system/packages.nix
./system/zfs.nix
./system/doas.nix
./system/configuration.nix
./system/flash-os/steam.nix
#./system/jellyfin.nix
./system/firewall.nix
./system/tainscale.nix
./system/users.nix
./system/plan9.nix
     ];
  };
# snow
snow = lib.nixosSystem {
     inherit system;
     modules = [
#./system/system.nix
./system/hostname.nix
./system/sound.nix
./system/flakes.nix
./system/hardware-configuration.nix
./system/boot.nix
./system/networking.nix
./system/xorg.nix
./system/snow/packages.nix
./system/zfs.nix
./system/doas.nix
./system/configuration.nix
./system/firewall.nix
./system/users.nix
];
  };



server = lib.nixosSystem {
     inherit system;
     modules = [
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
  };
 
  flash-os = lib.nixosSystem {
     inherit system;
     modules = [
      ./system/hostname.nix
      ./system/flash-os/system.nix
      ./system/hardware-configuration.nix
      ./system/boot.nix
      ./system/configuration.nix
      ./system/networking.nix
      ./system/flash-os/xorg.nix
      ./system/flash-os/packages.nix
      ./system/zfs.nix
      ./system/users.nix
      ./system/doas.nix
      ./system/flash-os/steam.nix
      ./system/ssh.nix
     ];
  };

};
    homeManagerConfigurations = {
    glenda = home-manager.lib.homeManagerConfiguration  {
    inherit system pkgs;
    username = "glenda";
    homeDirectory = "/home/glenda";
    stateVersion = "22.05";
    configuration = {
    imports = [
    ./users/glenda/home.nix
    ];
    };
    };
    # snow 
    };
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [
  ./system/container.nix
        ];
    };

  };
}
